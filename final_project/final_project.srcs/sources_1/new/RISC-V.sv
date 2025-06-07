`timescale 1ns/100ps

module riscv (
    input logic clk,
    input logic rst,

    input logic [31:0] instr_bus[3],
    input logic [31:0] mem_resp[3],

    input logic [31:0] reg_rdata[6],  // 6 read ports
    output logic [31:0] reg_wdata[3],  // 3 write ports

    output logic [31:0] pc_next[3],
    output logic [31:0] wb_data[3],
    output logic [31:0] mem_req_addr[3],
    output logic [31:0] mem_req_data[3],
    output logic        mem_req_valid[3],
    output logic        mem_req_is_load[3]
);

    logic [31:0] pc[3];

    logic [31:0] id_instr[3], id_pc[3];
    logic [31:0] ex_instr[3], ex_pc[3], ex_op1[3], ex_op2[3];
    logic [31:0] mem_alu_result[3], mem_wdata[3];
    logic [31:0] wb_result[3];

    logic [31:0] fwd_data[3];

    // IF Stage
    always_ff @(posedge clk or posedge rst) begin
        if (rst) begin
            pc[0] <= 32'h0;
            pc[1] <= 32'h4;
            pc[2] <= 32'h8;
        end else begin
            id_instr <= instr_bus;
            id_pc <= pc;
            pc[0] <= pc[0] + 12;
            pc[1] <= pc[1] + 12;
            pc[2] <= pc[2] + 12;
        end
    end

    assign pc_next = pc;

    // ID Stage
    always_ff @(posedge clk) begin
        for (int i = 0; i < 3; i++) begin
            ex_instr[i] <= id_instr[i];
            ex_pc[i] <= id_pc[i];

            ex_op1[i] <= reg_rdata[i*2];
            ex_op2[i] <= reg_rdata[i*2 + 1];
        end
    end

    // EX Stage
    always_ff @(posedge clk) begin
        for (int i = 0; i < 3; i++) begin
            mem_alu_result[i] <= ex_op1[i] + ex_op2[i];
            mem_wdata[i] <= ex_op2[i];
        end
    end

    // MEM Stage
    always_ff @(posedge clk) begin
        for (int i = 0; i < 3; i++) begin
            mem_req_addr[i] <= mem_alu_result[i];
            mem_req_data[i] <= mem_wdata[i];
            mem_req_valid[i] <= 1'b1;
            mem_req_is_load[i] <= 1'b1;
            wb_result[i] <= mem_alu_result[i];
        end
    end

    // WB Stage
    always_ff @(posedge clk) begin
        for (int i = 0; i < 3; i++) begin
            reg_wdata[i] <= wb_result[i];
            wb_data[i] <= wb_result[i];
            fwd_data[i] <= wb_result[i];
        end
    end

endmodule
