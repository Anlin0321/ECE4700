// This is the top-level N-way branch predictor module.
// It instantiates the TAGE predictor and finds the first predicted taken branch.
`include "sys_defs.svh"
`include "ISA.svh"

module branch_predictor #(
    parameter N = `ISSUE_WIDTH // Superscalar width, must match the instantiated predictor
)(
    input wire clk,
    input wire reset,
    input wire flush,
    input wire stall,
    input wire [31:0] new_PC,  // Added missing declaration

    // N-way inputs from Fetch Stage
    input  logic [`ISSUE_WIDTH-1:0] [3:0]          mem2Icache_response,
    input  logic [`ISSUE_WIDTH-1:0] [63:0]         mem2Icache_data,
    input  logic [`ISSUE_WIDTH-1:0] [3:0]          mem2Icache_tag,

    // Update interface (passed through to the TAGE module)
    input wire                       update_valid,
    input wire [31:0]                update_pc,
    input wire                       is_branch_actual,
    input wire                       branch_taken_actual,
    input wire [2:0]                 update_provider_component,
    input wire [($clog2(2048)*7)-1:0] update_indices,         // Assuming TAGE params
    input wire [255:0]               update_ghist_snapshot,  // Assuming TAGE params

    // --- Outputs to Fetch Stage ---
    output reg                       taken_branch_valid, // Is there a predicted taken branch?
    output reg [$clog2(`ISSUE_WIDTH)-1:0]       taken_branch_way,   // Which way is the first taken branch?
    output reg [31:0]                taken_branch_target_pc // Where does it go?
);

    // --- Wires for connecting to the TAGE predictor ---
    wire [`ISSUE_WIDTH-1:0] prediction;
    wire [`ISSUE_WIDTH-1:0] is_branch;
    wire [`ISSUE_WIDTH-1:0] is_unconditional;
    logic [31:0] proc2Icache_addr [0:`ISSUE_WIDTH-1];   // I-cache request addresses
    logic [31:0] PC_q;                       // current PC register
    logic [31:0] PC_n;                       // next PC value
    logic PC_enable;
    logic [31:0] instruction [`ISSUE_WIDTH-1:0];
    logic [31:0] taken_branch_target_pc;
    logic [31:0] pc [`ISSUE_WIDTH-1:0];

    assign PC_enable = !stall | flush;

    always_ff @(posedge clk or posedge reset) begin
        if (reset) 
            PC_q <= `PC_RESET;
        else if (PC_enable) 
            PC_q <= PC_n;
    end

    // next PC logic
    always_comb begin
    if (flush) begin
            // Misprediction recovery - highest priority
            PC_n = new_PC;  
        end else if (taken_branch_valid) begin
            // Predicted branch
            PC_n = taken_branch_target_pc;
        end else begin
            // Sequential flow
            PC_n = PC_q + 4*`ISSUE_WIDTH;
        end
    end

    // ---- I-cache requests ----
    genvar w;
    generate
        for (w = 0; w < `ISSUE_WIDTH; w++) begin : G_ICACHE
            assign proc2Icache_addr[w]    = PC_q + w*4;
            assign instruction[w] = proc2Icache_addr[w][2] ? 
                                  mem2Icache_data[w][63:32] : 
                                  mem2Icache_data[w][31:0];
            assign pc[w] = PC_q + w*4;
        end
    endgenerate

    // Instantiate the N-Way TAGE Predictor
    // NOTE: Parameters here must match the design's requirements.
    tage_predictor_n_way #(
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

        // Prediction Interface
        .predict_pc(pc),
        .predict_instruction(instruction),

        // Update Interface
        .update_valid(update_valid),
        .update_pc(update_pc),
        .branch_taken(branch_taken_actual),
        .is_branch(is_branch_actual),
        .update_provider_component(update_provider_component),
        .update_indices(update_indices),
        .update_ghist_snapshot(update_ghist_snapshot),

        // Prediction Outputs
        .prediction_out(prediction),
        .is_branch_out(is_branch),
        .is_unconditional_out(is_unconditional)
        // Metadata outputs are ignored here but would be pipelined in a real CPU
    );

    // --- Target PC Calculation and First-Taken-Branch Selection ---
    always_comb begin
        // Local declarations for procedural assignments
        logic [`ISSUE_WIDTH-1:0][6:0]  opcode;
        logic [`ISSUE_WIDTH-1:0]       is_branch_inst;
        logic [`ISSUE_WIDTH-1:0]       is_jal_inst;
        logic [`ISSUE_WIDTH-1:0]       is_jalr_inst;
        logic [`ISSUE_WIDTH-1:0]       predicted_taken;
        logic [31:0]        jal_imm [0:`ISSUE_WIDTH-1];
        logic [31:0]        branch_imm [0:`ISSUE_WIDTH-1];
        logic [31:0]        jalr_target [0:`ISSUE_WIDTH-1];

        taken_branch_valid = 1'b0;
        taken_branch_way   = -1;
        taken_branch_target_pc = '0;

        for (int i = 0; i < `ISSUE_WIDTH; i++) begin
            // Instruction decode
            opcode[i]        = instruction[i][6:0];
            is_branch_inst[i] = (opcode[i] == 7'b1100011);
            is_jal_inst[i]    = (opcode[i] == 7'b1101111);
            is_jalr_inst[i]   = (opcode[i] == 7'b1100111);
            // Immediate extraction
            jal_imm[i]    = {{12{instruction[i][31]}},
                            instruction[i][19:12],
                            instruction[i][20],
                            instruction[i][30:21], 1'b0};

            branch_imm[i] = {{20{instruction[i][31]}},
                            instruction[i][7],
                            instruction[i][30:25],
                            instruction[i][11:8], 1'b0};

            jalr_target[i] = (pc[i] + `RV32_signext_Iimm(instruction[i])) & 32'hFFFFFFFE;

            // Predicted taken?
            predicted_taken[i] = prediction[i] &
                                (is_branch_inst[i] | is_jal_inst[i] | is_jalr_inst[i]);

            // First taken branch
            if (!taken_branch_valid && predicted_taken[i]) begin
                taken_branch_valid     = 1'b1;
                taken_branch_way       = i;
                if (is_jal_inst[i])
                    taken_branch_target_pc = pc[i] + jal_imm[i];
                else if (is_branch_inst[i])
                    taken_branch_target_pc = pc[i] + branch_imm[i];
                else // jalr
                    taken_branch_target_pc = jalr_target[i];
            end
        end
    end
endmodule

// This is the core N-way TAGE predictor module.
// It removes the loop predictor and adds N-way prediction with speculative history updates.
module tage_predictor_n_way #(
    parameter NUM_TABLES = 7,
    parameter TAG_WIDTH = 14,
    parameter CTR_WIDTH = 3,
    parameter TABLE_SIZE = 2048,
    parameter GHIST_WIDTH = 256,
    parameter USEFUL_WIDTH = 2,
    parameter ALLOC_THRESH = 2
)(
    input wire clk,
    input wire reset,
    input wire [31:0] predict_pc [`ISSUE_WIDTH-1:0],
    input wire [31:0] predict_instruction [`ISSUE_WIDTH-1:0],
    input wire                       update_valid,
    input wire [31:0]                update_pc,
    input wire                       branch_taken,
    input wire                       is_branch,
    input wire [2:0]                 update_provider_component,
    input wire [($clog2(TABLE_SIZE)*NUM_TABLES)-1:0] update_indices,
    input wire [GHIST_WIDTH-1:0]     update_ghist_snapshot,
    // Change outputs to logic
    output logic [`ISSUE_WIDTH-1:0]              prediction_out,
    output logic [`ISSUE_WIDTH-1:0]              is_branch_out,
    output logic [`ISSUE_WIDTH-1:0]              is_unconditional_out,
    output logic [`ISSUE_WIDTH-1:0][2:0]         provider_component_out,
    output logic [`ISSUE_WIDTH-1:0][2:0]         alt_provider_component_out,
    output logic [`ISSUE_WIDTH-1:0][($clog2(TABLE_SIZE)*NUM_TABLES)-1:0] computed_indices_out,
    output logic [`ISSUE_WIDTH-1:0][GHIST_WIDTH-1:0] ghist_snapshot_out
);

    // ========== ADDED DECLARATIONS ==========
    typedef struct packed {
        logic valid;
        logic [TAG_WIDTH-1:0] tag;
        logic [CTR_WIDTH-1:0] ctr;
        logic [USEFUL_WIDTH-1:0] useful;
    } tage_entry_t;

    localparam INDEX_WIDTH = $clog2(TABLE_SIZE);
    localparam int HISTORY_LEN [NUM_TABLES] = '{0, 4, 8, 16, 32, 64, 128};
    function automatic [TAG_WIDTH-1:0] compute_tag(
        input int table_idx,
        input [31:0] pc_val,
        input [GHIST_WIDTH-1:0] ghist_val
    );
        integer k;
        reg [TAG_WIDTH-1:0] folded_hist_tag;
    begin
        folded_hist_tag = '0;
        for (k = 0; k < HISTORY_LEN[table_idx]; k = k + 1) begin
            if (k < GHIST_WIDTH) begin
                folded_hist_tag = folded_hist_tag ^ (ghist_val[k] << (k % TAG_WIDTH));
            end
        end
        compute_tag = pc_val[31:18] ^ pc_val[17:4] ^ folded_hist_tag;
    end
    endfunction
    logic [GHIST_WIDTH-1:0] global_history;
    logic [CTR_WIDTH-1:0] bimodal_table [0:TABLE_SIZE-1];
    tage_entry_t tage_tables [1:NUM_TABLES-1][0:TABLE_SIZE-1];
    
    logic [GHIST_WIDTH-1:0] spec_ghist;
    logic tage_pred;
    logic [6:0] opcode;
    logic [INDEX_WIDTH-1:0] current_bimodal_idx;
    logic [INDEX_WIDTH-1:0] current_tage_idx [1:NUM_TABLES-1];
    logic [TAG_WIDTH-1:0]  current_tage_tag [1:NUM_TABLES-1];
    logic [NUM_TABLES-1:1] tag_match;
    //==========================================================================
    // PREDICTION LOGIC (Combinational for N ways with speculative GHR)
    //==========================================================================
    always_comb begin
        spec_ghist = global_history;
        for (int i = 0; i < `ISSUE_WIDTH; i = i + 1) begin
            // Use logic instead of wire
            opcode = predict_instruction[i][6:0];
            // --- Per-Way Instruction Decoding ---
            is_branch_out[i] = (opcode == 7'b1100011);
            is_unconditional_out[i] = (opcode == 7'b1101111) | (opcode == 7'b1100111);

            // --- Hashing and Index/Tag Calculation using spec_ghist ---

            current_bimodal_idx = predict_pc[i][INDEX_WIDTH+1:2];

            for (int t = 1; t < NUM_TABLES; t++) begin
                automatic int hist_len = HISTORY_LEN[t];
                automatic reg [INDEX_WIDTH-1:0] folded_hist_idx = '0;
                automatic reg [TAG_WIDTH-1:0]  folded_hist_tag = '0;
                for (int k = 0; k < hist_len; k++) begin
                    if (k < GHIST_WIDTH) begin
                        folded_hist_idx = folded_hist_idx ^ (spec_ghist[k] << (k % INDEX_WIDTH));
                        folded_hist_tag = folded_hist_tag ^ (spec_ghist[k] << (k % TAG_WIDTH));
                    end
                end
                current_tage_idx[t] = predict_pc[i][INDEX_WIDTH+1:2] ^ folded_hist_idx;
                current_tage_tag[t] = predict_pc[i][31:18] ^ predict_pc[i][17:4] ^ folded_hist_tag;
            end

            // --- Provider Selection and Prediction ---
            for (int t = 1; t < NUM_TABLES; t++) begin
                tag_match[t] = tage_tables[t][current_tage_idx[t]].valid &&
                               (tage_tables[t][current_tage_idx[t]].tag == current_tage_tag[t]);
            end

            provider_component_out[i] = '0;
            for (int t = NUM_TABLES - 1; t >= 1; t--) begin
                if (tag_match[t]) begin
                    provider_component_out[i] = t;
                    break;
                end
            end

            alt_provider_component_out[i] = '0;
            if (provider_component_out[i] > 0) begin
                for (int t = provider_component_out[i] - 1; t >= 1; t--) begin
                    if (tag_match[t]) begin
                        alt_provider_component_out[i] = t;
                        break;
                    end
                end
            end

            // --- Generate TAGE Prediction ---
            tage_pred = 0;
            if (provider_component_out[i] != 0) begin
                tage_pred = tage_tables[provider_component_out[i]][current_tage_idx[provider_component_out[i]]].ctr[CTR_WIDTH-1];
            end else begin
                tage_pred = bimodal_table[current_bimodal_idx][CTR_WIDTH-1];
            end

            // Final prediction for this way (unconditional branches are always "taken")
            prediction_out[i] = is_unconditional_out[i] ? 1'b1 : tage_pred;

            // --- Metadata Output Assignment ---
            ghist_snapshot_out[i] = spec_ghist; // Save GHR state *before* this way's update
            computed_indices_out[i][INDEX_WIDTH-1:0] = current_bimodal_idx;
            for (int t = 1; t < NUM_TABLES; t=t+1) begin
                computed_indices_out[i][(t+1)*INDEX_WIDTH-1 -: INDEX_WIDTH] = current_tage_idx[t];
            end

            // --- Speculative GHR Update ---
            // Update history for the *next* way's prediction if this is a conditional branch
            if (is_branch_out[i]) begin
                spec_ghist = {prediction_out[i], spec_ghist[GHIST_WIDTH-1:1]};
            end
        end
    end

    //==========================================================================
    // UPDATE LOGIC (Synchronous on branch resolution)
    //==========================================================================
    logic [INDEX_WIDTH-1:0] bimodal_update_idx;
    logic [INDEX_WIDTH-1:0] tage_update_idx [1:NUM_TABLES-1];
    logic provider_pred_correct;
    logic alt_pred_correct;
    always @(posedge clk) begin
        if (reset) begin
            global_history <= '0;
            for (integer i = 0; i < TABLE_SIZE; i = i + 1) begin
                bimodal_table[i] <= (1 << (CTR_WIDTH - 2)); // Weakly not-taken
            end
            for (integer j = 1; j < NUM_TABLES; j = j + 1) begin
                for (integer i = 0; i < TABLE_SIZE; i = i + 1) begin
                    tage_tables[j][i] <= '{default: '0};
                end
            end
        end else if (update_valid && is_branch) begin
            // --- Step 1: Update NON-SPECULATIVE Global History ---
            global_history <= {global_history[GHIST_WIDTH-2:0], branch_taken};

            // --- Step 2: Unpack Pipelined Indices ---
            // Change wire to logic
            
            bimodal_update_idx = update_indices[INDEX_WIDTH-1:0];
            for (int t = 1; t < NUM_TABLES; t++) begin
                tage_update_idx[t] = update_indices[(t+1)*INDEX_WIDTH-1 -: INDEX_WIDTH];
            end

            // --- Step 3: Update Prediction Counters ---
            // Change reg to logic
            
            
            // Determine if the original predictions were correct
            if (update_provider_component == 0) begin
                provider_pred_correct = (bimodal_table[bimodal_update_idx][CTR_WIDTH-1] == branch_taken);
            end else begin
                provider_pred_correct = (tage_tables[update_provider_component][tage_update_idx[update_provider_component]].ctr[CTR_WIDTH-1] == branch_taken);
            end

            // Update the counter of the provider component
            if (update_provider_component == 0) begin // Bimodal provided
                if (branch_taken) begin
                    if (bimodal_table[bimodal_update_idx] < (1<<CTR_WIDTH)-1)
                        bimodal_table[bimodal_update_idx] <= bimodal_table[bimodal_update_idx] + 1;
                end else begin
                    if (bimodal_table[bimodal_update_idx] > 0)
                        bimodal_table[bimodal_update_idx] <= bimodal_table[bimodal_update_idx] - 1;
                end
            end else begin // A TAGE component provided
                tage_entry_t current_entry, next_entry;
                current_entry = tage_tables[update_provider_component][tage_update_idx[update_provider_component]];
                next_entry = current_entry; // Calculate next state combinationally

                if (branch_taken) begin
                    if (current_entry.ctr < (1<<CTR_WIDTH)-1) next_entry.ctr = current_entry.ctr + 1;
                end else begin
                    if (current_entry.ctr > 0) next_entry.ctr = current_entry.ctr - 1;
                end

                // Update 'useful' bits only if TAGE prediction differed from bimodal
                // Change wire to logic
                
                alt_pred_correct = (bimodal_table[bimodal_update_idx][CTR_WIDTH-1] == branch_taken);
                
                if (provider_pred_correct != alt_pred_correct) begin
                    if (provider_pred_correct) begin
                        if (current_entry.useful < (1<<USEFUL_WIDTH)-1) next_entry.useful = current_entry.useful + 1;
                    end else begin
                        if (current_entry.useful > 0) next_entry.useful = current_entry.useful - 1;
                    end
                end
                tage_tables[update_provider_component][tage_update_idx[update_provider_component]] <= next_entry;
            end
            // --- Step 4: Allocate New Entry on Misprediction ---
            if (!provider_pred_correct) begin
                automatic int start_alloc_table = (update_provider_component < NUM_TABLES - 1) ? (update_provider_component + 1) : (NUM_TABLES - 1);
                for (int t = start_alloc_table; t < NUM_TABLES; t++) begin
                    if (tage_tables[t][tage_update_idx[t]].useful < ALLOC_THRESH) begin
                        tage_entry_t new_entry;
                        new_entry.valid = 1'b1;
                        new_entry.tag = compute_tag(t, update_pc, update_ghist_snapshot);
                        new_entry.ctr = (1 << (CTR_WIDTH - 2)); // Weakly taken/not-taken based on actual outcome
                        new_entry.useful = 0;
                        tage_tables[t][tage_update_idx[t]] <= new_entry;
                        break; // Allocate only one entry
                    end
                end
            end
        end
    end
endmodule