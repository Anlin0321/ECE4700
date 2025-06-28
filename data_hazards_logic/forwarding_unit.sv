`timescale 1ns/100ps
`include "sys_defs.svh"

module forwarding_unit (
    input ID_EX_PACKET  id_ex_q,
    input EX_MEM_PACKET ex_mem_q,
    input MEM_WB_PACKET mem_wb_q,

    output logic [1:0] forwardA_stage [`ISSUE_WIDTH-1:0],               // 00: no forward, 01: EX/MEM, 10: MEM/WB
    output logic [$clog2(`ISSUE_WIDTH)-1:0] forwardA_slot [`ISSUE_WIDTH-1:0],  // which slot inside EX/MEM or MEM/WB

    output logic [1:0] forwardB_stage [`ISSUE_WIDTH-1:0],
    output logic [$clog2(`ISSUE_WIDTH)-1:0] forwardB_slot [`ISSUE_WIDTH-1:0]
);

    // Precompute regwrite flags per EX/MEM and MEM/WB slot
    logic ex_mem_regwrite   [`ISSUE_WIDTH-1:0];
    logic mem_wb_regwrite   [`ISSUE_WIDTH-1:0];

    always_comb begin
        for (int j = 0; j < `ISSUE_WIDTH; j++) begin
            ex_mem_regwrite[j] = ex_mem_q.valid[j] && !ex_mem_q.halt[j] && !ex_mem_q.illegal[j] &&
                                 !ex_mem_q.wr_mem[j] && (ex_mem_q.dest_reg_idx[j] != 0);
            mem_wb_regwrite[j] = mem_wb_q.valid[j] && !mem_wb_q.halt[j] && !mem_wb_q.illegal[j] &&
                                 !mem_wb_q.wr_mem[j] && (mem_wb_q.dest_reg_idx[j] != 0);
        end
    end

    // Main forwarding logic
    always_comb begin
        for (int i = 0; i < `ISSUE_WIDTH; i++) begin
            // Extract source registers of instruction i in EX stage
            logic [4:0] rs1 = id_ex_q.inst[i][19:15];
            logic [4:0] rs2 = id_ex_q.inst[i][24:20];

            // Default: no forwarding
            forwardA_stage[i] = 2'b00;
            forwardA_slot[i]  = '0;
            forwardB_stage[i] = 2'b00;
            forwardB_slot[i]  = '0;

            if (id_ex_q.valid[i]) begin
                // Check MEM/WB stage (lower priority, can be covered later)
                for (int j = 0; j < `ISSUE_WIDTH; j++) begin
                    if (mem_wb_regwrite[j]) begin
                        if (mem_wb_q.dest_reg_idx[j] == rs1) begin
                            forwardA_stage[i] = 2'b10;
                            forwardA_slot[i]  = JK;
                        end
                        if (mem_wb_q.dest_reg_idx[j] == rs2) begin
                            forwardB_stage[i] = 2'b10;
                            forwardB_slot[i]  = j;
                        end
                    end
                end

                // Check EX/MEM stage (higher priority)
                for (int j = 0; j < `ISSUE_WIDTH; j++) begin
                    if (ex_mem_regwrite[j]) begin
                        if (ex_mem_q.dest_reg_idx[j] == rs1) begin
                            forwardA_stage[i] = 2'b01;
                            forwardA_slot[i]  = j;
                        end
                        if (ex_mem_q.dest_reg_idx[j] == rs2) begin
                            forwardB_stage[i] = 2'b01;
                            forwardB_slot[i]  = j;
                        end
                    end
                end
            end
        end
    end

endmodule
