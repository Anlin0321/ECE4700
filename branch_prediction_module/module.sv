module branch_predictor (
    input wire clk,
    input wire reset,
    input wire [31:0] pc,
    input wire [31:0] instruction,
    input wire branch_taken_actual,
    input wire is_branch_actual,
    output wire prediction,
    output wire is_branch_predicted
);

    // Instruction type decoding
    wire [6:0] opcode = instruction[6:0];
    wire is_branch_inst = (opcode == 7'b1100011); 
    wire is_jal_inst = (opcode == 7'b1101111);
    wire is_jalr_inst = (opcode == 7'b1100111);
    
    assign is_branch_predicted = is_branch_inst | is_jal_inst | is_jalr_inst;
    
    // Unconditional branches always taken
    wire unconditional_taken = is_jal_inst | is_jalr_inst;
    
    // TAGE prediction
    wire tage_prediction;
    
    tage_predictor tage_predictor_inst (
        .clk(clk),
        .reset(reset),
        .pc(pc),
        .branch_taken(branch_taken_actual),
        .is_branch(is_branch_actual),
        .prediction(tage_prediction)
    );
    
    // Final prediction
    assign prediction = unconditional_taken ? 1'b1 : tage_prediction;

endmodule

module tage_predictor (
    input wire clk,
    input wire reset,
    input wire [31:0] pc,
    input wire branch_taken,
    input wire is_branch,
    output wire prediction
);

    // Parameters
    parameter NUM_TABLES = 5;  // Including bimodal table
    parameter TAG_WIDTH = 12;
    parameter COUNTER_WIDTH = 3;  // 3-bit counters for better hysteresis
    localparam TABLE_SIZE = 1024;  // 1K entries per table
    localparam INDEX_WIDTH = 10;   // 2^10 = 1024
    
    // History lengths for each table
    localparam int HISTORY_LEN [5] = '{0, 4, 8, 16, 32};
    
    // Global history register
    reg [63:0] global_history;
    always @(posedge clk) begin
        if (reset) 
            global_history <= 0;
        else if (is_branch)
            global_history <= {global_history[62:0], branch_taken};
    end
    
    // Prediction tables
    // Table 0: Bimodal (no tag)
    reg [COUNTER_WIDTH-1:0] bimodal_table [0:TABLE_SIZE-1];
    
    // Tagged tables (1-4)
    typedef struct packed {
        logic valid; 
        logic [TAG_WIDTH-1:0] tag;
        logic [COUNTER_WIDTH-1:0] counter;
        logic useful;  // Useful bit for allocation policy
    } tage_entry_t;
    
    tage_entry_t tage_tables [1:NUM_TABLES-1][0:TABLE_SIZE-1];
    
    // Initialize tables
    integer i, j;
    always @(posedge clk) begin
        if (reset) begin
            for (i = 0; i < TABLE_SIZE; i = i + 1) begin
                bimodal_table[i] <= 3'b010;  // Weakly taken state
            end
            for (j = 1; j < NUM_TABLES; j = j + 1) begin
                for (i = 0; i < TABLE_SIZE; i = i + 1) begin
                    tage_tables[j][i] <= '{valid: 1'b0, tag: 0, counter: 3'b010, useful: 1'b0};
                end
            end
        end
    end
    
    // Compute indices and tags
    wire [INDEX_WIDTH-1:0] base_index = pc[INDEX_WIDTH+1:2];
    
    // Wire declarations for generate block outputs
    wire [INDEX_WIDTH-1:0] tage_index [1:4];
    wire [TAG_WIDTH-1:0] tage_tag [1:4];
    
    generate
        for (genvar t = 1; t < NUM_TABLES; t++) begin: table_hash
            // Effective history length
            localparam hist_len = HISTORY_LEN[t] > 64 ? 64 : HISTORY_LEN[t];
            
            // Calculate folded history
            wire [63:0] history_mask = (1 << hist_len) - 1;
            wire [63:0] masked_history = global_history & history_mask;
            
            // Fold history to INDEX_WIDTH bits
            wire [INDEX_WIDTH-1:0] folded_history;
            assign folded_history = 
                masked_history[0*INDEX_WIDTH +: INDEX_WIDTH] ^
                masked_history[1*INDEX_WIDTH +: INDEX_WIDTH] ^
                masked_history[2*INDEX_WIDTH +: INDEX_WIDTH] ^
                masked_history[3*INDEX_WIDTH +: INDEX_WIDTH];
            
            // Index hash: PC XOR folded history
            assign tage_index[t] = pc[INDEX_WIDTH+1:2] ^ folded_history;
            
            // Tag hash: XOR of PC segments with folded history
            wire [TAG_WIDTH-1:0] folded_history_tag;
            assign folded_history_tag = 
                masked_history[0*TAG_WIDTH +: TAG_WIDTH] ^
                masked_history[1*TAG_WIDTH +: TAG_WIDTH] ^
                masked_history[2*TAG_WIDTH +: TAG_WIDTH];
            
            assign tage_tag[t] = pc[31:20] ^ folded_history_tag;
        end
    endgenerate
    
    // Prediction logic
    reg [2:0] provider;  // Provider table (0-4)
    reg alt_pred;        // Alternate prediction
    
    // Base prediction
    wire base_pred = bimodal_table[base_index][COUNTER_WIDTH-1];  // MSB = prediction
    
    // Tagged table predictions
    wire [4:0] tag_match;
    wire [4:0] tage_pred;
    
    generate
        for (genvar t = 1; t < NUM_TABLES; t++) begin: table_pred
            assign tag_match[t] = tage_tables[t][tage_index[t]].valid && 
                                 (tage_tables[t][tage_index[t]].tag == tage_tag[t]);
            assign tage_pred[t] = tage_tables[t][tage_index[t]].counter[COUNTER_WIDTH-1];
        end
    endgenerate
    
    // Provider selection (highest matching table)
    always_comb begin
        provider = 0;
        alt_pred = base_pred;
        
        // Check tables from highest to lowest priority
        if (tag_match[4]) begin
            provider = 4;
            // Find alternate prediction
            if (tag_match[3]) alt_pred = tage_pred[3];
            else if (tag_match[2]) alt_pred = tage_pred[2];
            else if (tag_match[1]) alt_pred = tage_pred[1];
            else alt_pred = base_pred;
        end
        else if (tag_match[3]) begin
            provider = 3;
            if (tag_match[2]) alt_pred = tage_pred[2];
            else if (tag_match[1]) alt_pred = tage_pred[1];
            else alt_pred = base_pred;
        end
        else if (tag_match[2]) begin
            provider = 2;
            if (tag_match[1]) alt_pred = tage_pred[1];
            else alt_pred = base_pred;
        end
        else if (tag_match[1]) begin
            provider = 1;
            alt_pred = base_pred;
        end
    end
    
    // Final prediction
    assign prediction = (provider == 0) ? base_pred : tage_pred[provider];
    
    // Update logic
    always @(posedge clk) begin
        if (!reset && is_branch) begin
            // Update used entry
            if (provider == 0) begin
                // Update bimodal
                if (branch_taken && (bimodal_table[base_index] < ((2**COUNTER_WIDTH)-1))) begin
                    bimodal_table[base_index] <= bimodal_table[base_index] + 1;
                end
                else if (!branch_taken && (bimodal_table[base_index] > 0)) begin
                    bimodal_table[base_index] <= bimodal_table[base_index] - 1;
                end
            end
            else begin
                // Update tagged table
                if (branch_taken && (tage_tables[provider][tage_index[provider]].counter < ((2**COUNTER_WIDTH)-1))) begin
                    tage_tables[provider][tage_index[provider]].counter <= 
                        tage_tables[provider][tage_index[provider]].counter + 1;
                end
                else if (!branch_taken && (tage_tables[provider][tage_index[provider]].counter > 0)) begin
                    tage_tables[provider][tage_index[provider]].counter <= 
                        tage_tables[provider][tage_index[provider]].counter - 1;
                end
                
                // Update useful bit (only if prediction was correct and altpred was wrong)
                if ((prediction == branch_taken) && (alt_pred != branch_taken)) begin
                    tage_tables[provider][tage_index[provider]].useful <= 1'b1;
                end
            end
            
            // Allocation on misprediction
            if (prediction != branch_taken) begin
                // Try to allocate in a higher table
                for (int t = provider+1; t < NUM_TABLES; t++) begin
                    if (!tage_tables[t][tage_index[t]].valid || 
                        !tage_tables[t][tage_index[t]].useful) begin
                        
                        tage_tables[t][tage_index[t]] <= '{
                            valid: 1'b1,
                            tag: tage_tag[t],
                            counter: branch_taken ? 3'b111 : 3'b000,  // Strong initial state
                            useful: 1'b0
                        };
                        break;
                    end
                end
            end
        end
    end

endmodule