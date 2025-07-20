module branch_predictor (
    input wire clk,
    input wire reset,
    input wire [31:0] pc,
    input wire [31:0] instruction,
    input wire branch_taken_actual,
    input wire is_branch_actual,
    output wire prediction,
    output wire new_PC
);

    // Instruction type decoding
    wire [6:0] opcode = instruction[6:0];
    wire is_branch_inst = (opcode == 7'b1100011); 
    wire is_jal_inst = (opcode == 7'b1101111);
    wire is_jalr_inst = (opcode == 7'b1100111);

    // Immediate field extraction (similar to decoder module)
    wire [31:0] jal_imm = {{12{instruction[31]}}, instruction[19:12], instruction[20], instruction[30:21], 1'b0};
    wire [31:0] branch_imm = {{20{instruction[31]}}, instruction[7], instruction[30:25], instruction[11:8], 1'b0};
    wire [31:0] jalr_imm = {{20{instruction[31]}}, instruction[31:20]};
    
    // Calculate target addresses
    wire [31:0] jal_target = pc + jal_imm;
    wire [31:0] branch_target = pc + branch_imm;
    wire [31:0] jalr_target_base = (pc + jalr_imm) & ~32'h1; // Clear LSB for alignment
    
    // Unconditional branches always taken
    wire unconditional_taken = is_jal_inst | is_jalr_inst;
    
    // TAGE prediction with loop predictor
    wire tage_prediction;
    wire loop_prediction;
    wire use_loop_pred;
    
    tage_predictor #(
        .NUM_TABLES(7),
        .TAG_WIDTH(14),
        .CTR_WIDTH(3),
        .TABLE_SIZE(2048),
        .GHIST_WIDTH(256),
        .USEFUL_WIDTH(2),
        .ALLOC_THRESH(2)
    ) tage_predictor_inst (
        .clk(clk),
        .reset(reset),
        .pc(pc),
        .branch_taken(branch_taken_actual),
        .is_branch(is_branch_actual),
        .prediction(tage_prediction),
        .loop_prediction(loop_prediction),
        .use_loop_pred(use_loop_pred)
    );
    
    // Final prediction with loop priority
    wire raw_prediction;

    assign raw_prediction = unconditional_taken ? 1'b1 :
                             (use_loop_pred ? loop_prediction : tage_prediction);
    
    assign prediction = !raw_prediction;
    // New PC calculation
    reg [31:0] predicted_target;
    always_comb begin
        if (is_jal_inst) begin
            predicted_target = jal_target;
        end else if (is_jalr_inst) begin
            // For JALR, we need RS1 value which we don't have here
            // In a real implementation, this would come from register file
            // For prediction purposes, we'll just use the base address
            predicted_target = jalr_target_base;
        end else if (is_branch_inst) begin
            predicted_target = branch_target;
        end else begin
            predicted_target = pc + 4; // Default to next instruction
        end
    end
    
    // Select new PC based on prediction
    assign new_PC = (prediction && (is_branch_inst || is_jal_inst || is_jalr_inst)) ? 
                    predicted_target : 
                    pc + 4;

endmodule

module tage_predictor #(
    parameter NUM_TABLES = 7,         // Including bimodal table
    parameter TAG_WIDTH = 14,          // Tag width for TAGE tables
    parameter CTR_WIDTH = 3,           // Counter width
    parameter TABLE_SIZE = 2048,       // Entries per table
    parameter GHIST_WIDTH = 256,       // Global history width
    parameter USEFUL_WIDTH = 2,        // Useful counter width
    parameter ALLOC_THRESH = 2         // Allocation threshold
)(
    input wire clk,
    input wire reset,
    input wire [31:0] pc,
    input wire branch_taken,
    input wire is_branch,
    output reg prediction,
    output reg loop_prediction,
    output reg use_loop_pred
);

    // Derived parameters
    localparam INDEX_WIDTH = $clog2(TABLE_SIZE);
    localparam int HISTORY_LEN [7] = '{0, 4, 10, 20, 40, 80, 160}; // History lengths
    
    // Global history registers
    reg [GHIST_WIDTH-1:0] global_history;
    
    // Loop detection registers
    reg [31:0] last_branch_pc [0:3];  // Last 4 branch PCs
    reg [15:0] loop_counter [0:3];     // Loop counters
    reg [1:0]  loop_state [0:3];       // Loop states: 00=inactive, 01=detecting, 10=active
    reg [1:0]  loop_ptr;               // Current loop buffer pointer
    
    // Loop detection logic
    wire loop_detected = (loop_state[0] == 2'b10) || 
                         (loop_state[1] == 2'b10) || 
                         (loop_state[2] == 2'b10) || 
                         (loop_state[3] == 2'b10);
    
    // History update logic
    always @(posedge clk) begin
        if (reset) begin
            global_history <= '0;
            for (int i = 0; i < 4; i++) begin
                last_branch_pc[i] <= '0;
                loop_counter[i] <= '0;
                loop_state[i] <= 2'b00;
            end
            loop_ptr <= 0;
        end
        else if (is_branch) begin
            // Update global history
            global_history <= {global_history[GHIST_WIDTH-2:0], branch_taken};
            
            // Update loop detector
            if (loop_state[loop_ptr] == 2'b10) begin
                // Active loop: increment counter
                loop_counter[loop_ptr] <= loop_counter[loop_ptr] + 1;
                
                // Check for loop exit
                if (!branch_taken) begin
                    loop_state[loop_ptr] <= 2'b00; // End loop
                    loop_ptr <= (loop_ptr + 1) % 4; // Move to next slot
                end
            end
            else if (branch_taken && (pc == last_branch_pc[loop_ptr])) begin
                // Potential loop start
                if (loop_state[loop_ptr] == 2'b01) begin
                    // Second occurrence - confirm loop
                    loop_state[loop_ptr] <= 2'b10;
                    loop_counter[loop_ptr] <= 2;
                end
                else begin
                    // First occurrence
                    loop_state[loop_ptr] <= 2'b01;
                    loop_counter[loop_ptr] <= 1;
                end
            end
            else begin
                // Reset detection state
                loop_state[loop_ptr] <= 2'b00;
            end
            
            // Store current PC
            last_branch_pc[loop_ptr] <= pc;
        end
    end
    
    // Loop prediction logic
    always_comb begin
        loop_prediction = 1'b0;
        use_loop_pred = 1'b0;
        
        // Check all loop slots
        for (int i = 0; i < 4; i++) begin
            if (loop_state[i] == 2'b10) begin
                // Predict taken except when counter is multiple of 4
                loop_prediction = (loop_counter[i][1:0] != 2'b00);
                use_loop_pred = 1'b1;
                break; // Use first active loop found
            end
        end
    end
    
    // Prediction tables
    // Table 0: Bimodal
    reg [CTR_WIDTH-1:0] bimodal_table [0:TABLE_SIZE-1];
    
    // Tagged tables
    typedef struct packed {
        logic valid; 
        logic [TAG_WIDTH-1:0] tag;
        logic [CTR_WIDTH-1:0] ctr;
        logic [USEFUL_WIDTH-1:0] useful;  // Useful counter
    } tage_entry_t;
    
    tage_entry_t tage_tables [1:NUM_TABLES-1][0:TABLE_SIZE-1];
    
    // Initialize tables
    integer i, j;
    always @(posedge clk) begin
        if (reset) begin
            for (i = 0; i < TABLE_SIZE; i = i + 1) begin
                bimodal_table[i] <= {1'b0, 1'b1, 1'b0};  // Weakly taken (3'b010)
            end
            for (j = 1; j < NUM_TABLES; j = j + 1) begin
                for (i = 0; i < TABLE_SIZE; i = i + 1) begin
                    tage_tables[j][i] <= '{
                        valid: 1'b0, 
                        tag: '0, 
                        ctr: {1'b0, 1'b1, 1'b0}, // Weakly taken
                        useful: '0
                    };
                end
            end
        end
    end
    
    // Compute indices and tags
    wire [INDEX_WIDTH-1:0] base_index = pc[INDEX_WIDTH+1:2];
    
    // Wire declarations
    wire [INDEX_WIDTH-1:0] tage_index [1:NUM_TABLES-1];
    wire [TAG_WIDTH-1:0] tage_tag [1:NUM_TABLES-1];
    wire [NUM_TABLES-1:1] tag_match;
    wire [NUM_TABLES-1:1] tage_pred;
    
    // Generate hash computations
    generate
        for (genvar t = 1; t < NUM_TABLES; t++) begin: table_hash
            // Effective history length
            localparam int hist_len = (HISTORY_LEN[t] > GHIST_WIDTH) ? 
                                     GHIST_WIDTH : HISTORY_LEN[t];
            
            // Folded history calculation
            reg [INDEX_WIDTH-1:0] folded_index;
            reg [TAG_WIDTH-1:0] folded_tag;
            
            always_comb begin
                folded_index = '0;
                folded_tag = '0;
                for (int k = 0; k < hist_len; k++) begin
                    if (k < GHIST_WIDTH) begin
                        folded_index = folded_index ^ (global_history[k] << (k % INDEX_WIDTH));
                        folded_tag = folded_tag ^ (global_history[k] << (k % TAG_WIDTH));
                    end
                end
            end
            
            // Index and tag computation
            assign tage_index[t] = pc[INDEX_WIDTH+1:2] ^ folded_index;
            assign tage_tag[t] = pc[31:18] ^ folded_tag;
            
            // Tag matching
            assign tag_match[t] = tage_tables[t][tage_index[t]].valid && 
                                 (tage_tables[t][tage_index[t]].tag == tage_tag[t]);
            assign tage_pred[t] = tage_tables[t][tage_index[t]].ctr[CTR_WIDTH-1];
        end
    endgenerate
    
    // Prediction logic
    reg [2:0] provider;  // Provider table
    reg [2:0] alt_provider; // Alternate provider
    
    // Base prediction
    wire base_pred = bimodal_table[base_index][CTR_WIDTH-1];
    
    // Provider selection
    always_comb begin
        provider = '0;
        alt_provider = '0;
        
        // Find highest priority matching table
        for (int t = NUM_TABLES-1; t >= 1; t--) begin
            if (tag_match[t]) begin
                provider = t;
                break;
            end
        end
        
        // Find alternate provider
        if (provider > 0) begin
            for (int t = provider-1; t >= 0; t--) begin
                if (t == 0) begin
                    alt_provider = 0;
                    break;
                end
                else if (tag_match[t]) begin
                    alt_provider = t;
                    break;
                end
            end
        end
    end
    
    // Final prediction
    always_comb begin
        if (use_loop_pred) begin
            prediction = loop_prediction;
        end
        else if (provider == 0) begin
            prediction = base_pred;
        end
        else begin
            prediction = tage_pred[provider];
        end
    end
    
    // Update logic
    always @(posedge clk) begin
        if (!reset && is_branch) begin
            // Update used entry
            if (provider == 0 && !use_loop_pred) begin
                // Update bimodal
                if (branch_taken) begin
                    if (bimodal_table[base_index] < (2**CTR_WIDTH)-1)
                        bimodal_table[base_index] <= bimodal_table[base_index] + 1;
                end
                else begin
                    if (bimodal_table[base_index] > 0)
                        bimodal_table[base_index] <= bimodal_table[base_index] - 1;
                end
            end
            else if (provider > 0) begin
                // Update tagged table counter
                tage_entry_t entry = tage_tables[provider][tage_index[provider]];
                
                if (branch_taken) begin
                    if (entry.ctr < (2**CTR_WIDTH)-1)
                        entry.ctr = entry.ctr + 1;
                end
                else begin
                    if (entry.ctr > 0)
                        entry.ctr = entry.ctr - 1;
                end
                
                // Update useful counter
                if (prediction == branch_taken) begin
                    if (entry.useful < (2**USEFUL_WIDTH)-1)
                        entry.useful = entry.useful + 1;
                end
                else if (entry.useful > 0) begin
                    entry.useful = entry.useful - 1;
                end
                
                tage_tables[provider][tage_index[provider]] <= entry;
            end
            
            // Allocation on misprediction
            if (prediction != branch_taken && !use_loop_pred) begin
                // Try to allocate in higher tables
                for (int t = provider+1; t < NUM_TABLES; t++) begin
                    if (!tage_tables[t][tage_index[t]].valid || 
                        tage_tables[t][tage_index[t]].useful < ALLOC_THRESH) begin
                        
                        tage_tables[t][tage_index[t]] <= '{
                            valid: 1'b1,
                            tag: tage_tag[t],
                            ctr: branch_taken ? (2**CTR_WIDTH)-1 : 0,
                            useful: 0
                        };
                        break;
                    end
                end
            end
        end
    end

endmodule