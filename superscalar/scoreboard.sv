`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/17/2025 06:50:31 AM
// Design Name: 
// Module Name: scoreboard
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

`timescale 1ns/100ps
`include "sys_defs.svh"

module scoreboard
(
    input  logic         clk, rst,

    // ---- commit (write-back) ----
    input  logic [`ISSUE_WIDTH-1:0]       commit_valid,
    input  logic [`ISSUE_WIDTH-1:0][4:0]  commit_rd,

    // ---- issue (decode) ----
    input  logic [`ISSUE_WIDTH-1:0]       issue_valid_rs1,
    input  logic [`ISSUE_WIDTH-1:0]       issue_valid_rs2,
    input  logic [`ISSUE_WIDTH-1:0]       issue_valid_rd,
    input  logic [`ISSUE_WIDTH-1:0][4:0]  issue_rs1,
    input  logic [`ISSUE_WIDTH-1:0][4:0]  issue_rs2,
    // no issue_valid for rd since rd can be set to `ZERO_REG
    input  logic [`ISSUE_WIDTH-1:0][4:0]  issue_rd,

    output logic                     stall
);

    // track busy registers x1-x31 (x0 never busy)
    logic [31:1][$clog2(`ISSUE_WIDTH*5)-1:0] busy_counters;

    always_ff @(posedge clk or posedge rst) begin
        if (rst) busy_counters <= '0;
        else begin
            // clear on commit
            for (int i = 0; i < `ISSUE_WIDTH; i++) begin
                if (commit_valid[i] && commit_rd[i]!=`ZERO_REG)
//                    busy_counters[commit_rd[i]] <= busy_counters[commit_rd[i]] - 1'b1;
                    busy_counters[commit_rd[i]] <= 1'b0;  // FIXME:
            end
            // set on issue (only not stalled)
            if (~stall) begin
                for (int j = 0; j < `ISSUE_WIDTH; j++) begin
                    if (issue_valid_rd[j] && issue_rd[j] != `ZERO_REG)
                        busy_counters[issue_rd[j]] <= busy_counters[issue_rd[j]] + 1'b1;
                end
            end
        end
    end

//    always_comb begin
//        for (int j = 0; j < `ISSUE_WIDTH; j++)
//            if (issue_rd[j] != `ZERO_REG)
//                busy_bits[issue_rd[j]] = 1'b1;
//    end

    // RAW hazard check
    logic hazard;
    always_comb begin
        hazard = 1'b0;
        for (int j = 0; j < `ISSUE_WIDTH; j++) begin
            if (issue_valid_rs1[j] && issue_rs1[j]!=`ZERO_REG && busy_counters[issue_rs1[j]]) hazard = 1'b1;
            if (issue_valid_rs2[j] && issue_rs2[j]!=`ZERO_REG && busy_counters[issue_rs2[j]]) hazard = 1'b1;
        end
    end
    assign stall = hazard;
endmodule

