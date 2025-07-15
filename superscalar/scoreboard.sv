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
    input  logic [`ISSUE_WIDTH-1:0]       issue_valid,
    input  logic [`ISSUE_WIDTH-1:0][4:0]  issue_rs1,
    input  logic [`ISSUE_WIDTH-1:0][4:0]  issue_rs2,

    output logic                     stall
);

    // track busy registers x1-x31 (x0 never busy)
    logic [31:1] busy_bits;

    integer i;
    always_ff @(posedge clk or posedge rst) begin
        if (rst) busy_bits <= '0;
        else begin
            // clear on commit
            for (i = 0; i < `ISSUE_WIDTH; i++)
                if (commit_valid[i] && commit_rd[i]!=5'd0)
                    busy_bits[commit_rd[i]] <= 1'b0;

            // set on issue (dest not provided here, so conservative)
            // could be expanded if dest indices available at ID
        end
    end

    // RAW hazard check
    logic hazard;
    always_comb begin
        hazard = 1'b0;
        for (i = 0; i < `ISSUE_WIDTH; i++) if (issue_valid[i]) begin
            if (issue_rs1[i]!=5'd0 && busy_bits[issue_rs1[i]]) hazard = 1'b1;
            if (issue_rs2[i]!=5'd0 && busy_bits[issue_rs2[i]]) hazard = 1'b1;
        end
    end
    assign stall = hazard;
endmodule

