`timescale 1ns/100ps
`include "sys_defs.svh"

module stalling_detection_unit (
    input IF_ID_PACKET if_id_q,
    input ID_EX_PACKET id_ex_q,

    output logic [`ISSUE_WIDTH-1:0] stall
);

    // Internal signals
    logic [`ISSUE_WIDTH-1:0] load_use_hazard;
    logic [`ISSUE_WIDTH-1:0] intra_group_hazard;

    // 1. Load-Use Hazard detection per slot
    always_comb begin
        load_use_hazard = '0;
        for (int id_idx = 0; id_idx < `ISSUE_WIDTH; id_idx++) begin
            if (if_id_q.valid[id_idx]) begin
                logic [4:0] id_rs1 = if_id_q.inst[id_idx][19:15];
                logic [4:0] id_rs2 = if_id_q.inst[id_idx][24:20];
                for (int ex_idx = 0; ex_idx < `ISSUE_WIDTH; ex_idx++) begin
                    if (id_ex_q.valid[ex_idx] && id_ex_q.rd_mem[ex_idx] && (id_ex_q.dest_reg_idx[ex_idx] != 0)) begin
                        if (((id_rs1 == id_ex_q.dest_reg_idx[ex_idx]) && (id_rs1 != 0)) ||
                            ((id_rs2 == id_ex_q.dest_reg_idx[ex_idx]) && (id_rs2 != 0)))
                            load_use_hazard[id_idx] = 1'b1;
                    end
                end
            end
        end
    end

    // 2. Intra-group RAW hazard per slot
    always_comb begin
        intra_group_hazard = '0;
        for (int later = 1; later < `ISSUE_WIDTH; later++) begin
            if (if_id_q.valid[later]) begin
                if (intra_group_hazard[later-1])
                    intra_group_hazard[later] = 1'b1;
                else begin
                    logic [4:0] later_rs1 = if_id_q.inst[later][19:15];
                    logic [4:0] later_rs2 = if_id_q.inst[later][24:20];
                    for (int earlier = 0; earlier < later; earlier++) begin
                        if (if_id_q.valid[earlier]) begin
                            logic [4:0] earlier_rd = if_id_q.inst[earlier][11:7];
                            if ((earlier_rd != 0) && ((later_rs1 == earlier_rd) || (later_rs2 == earlier_rd)))
                                intra_group_hazard[later] = 1'b1;
                        end
                    end
                end
            end
        end
    end

    //  Combine for final stall signal per slot
    always_comb begin
        for (int i = 0; i < `ISSUE_WIDTH; i++) begin
            stall[i] = load_use_hazard[i] || intra_group_hazard[i];
        end
    end

endmodule
