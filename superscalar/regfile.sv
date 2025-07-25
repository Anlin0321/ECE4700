/////////////////////////////////////////////////////////////////////////
//                                                                     //
//   Modulename :  regfile.v                                           //
//                                                                     //
//  Description :  This module creates the Regfile used by the ID and  // 
//                 WB Stages of the Pipeline.                          //
//                                                                     //
/////////////////////////////////////////////////////////////////////////

`ifndef __REGFILE_V__
`define __REGFILE_V__

`timescale 1ns/100ps

`include "sys_defs.svh"

module regfile
(
    // ---- read side: 3 instructions && 2 source regs ----
    input  logic [`ISSUE_WIDTH-1:0] [4:0]            rda_idx,
    input  logic [`ISSUE_WIDTH-1:0] [4:0]            rdb_idx,
    output logic [`ISSUE_WIDTH-1:0] [`XLEN-1:0]      rda_out,
    output logic [`ISSUE_WIDTH-1:0] [`XLEN-1:0]      rdb_out,

    // ---- write side: up to 3 destinations per cycle ----
    input  logic                                    clk, rst,
    input  logic [`ISSUE_WIDTH-1:0]                 wr_en,
    input  logic [`ISSUE_WIDTH-1:0] [4:0]           wr_idx ,
    input  logic [`ISSUE_WIDTH-1:0] [`XLEN-1:0]     wr_data
);

    // ---- storage array ----
    logic [`XLEN-1:0] rf[31:0];

    // ---- three write ports (priority 0 > 1 > 2) ----
    integer i;
    always_ff @(posedge clk) begin
        // For simplicity, add rst to regfile
        if (rst) begin
            for (i = 0; i < 32; i++) begin
                rf[i] <= '0;
            end
        end else begin
            for (i = 0; i < `ISSUE_WIDTH; i++) begin
                if (wr_en[i] && (wr_idx[i] != 5'd0))
                    rf[wr_idx[i]] <= wr_data[i];
            end
        end
    end

    // ---- six read ports ----
    genvar w;
    generate
        for (w = 0; w < `ISSUE_WIDTH; w++) begin : G_READ
            assign rda_out[w] = (rda_idx[w] == 5'd0) ? '0 : rf[rda_idx[w]];
            assign rdb_out[w] = (rdb_idx[w] == 5'd0) ? '0 : rf[rdb_idx[w]];
        end
    endgenerate
endmodule

//module regfile(
//        input   [4:0] rda_idx, rdb_idx, wr_idx,    // read/write index
//        input  [`XLEN-1:0] wr_data,            // write data
//        input         wr_en, wr_clk,

//        output logic [`XLEN-1:0] rda_out, rdb_out    // read data
          
//      );
  
//  logic    [31:0] [`XLEN-1:0] registers;   // 32, 64-bit Registers

//  wire   [`XLEN-1:0] rda_reg = registers[rda_idx];
//  wire   [`XLEN-1:0] rdb_reg = registers[rdb_idx];

//  //
//  // Read port A
//  //
//  always_comb
//    if (rda_idx == `ZERO_REG)
//      rda_out = 0;
//    else if (wr_en && (wr_idx == rda_idx))
//      rda_out = wr_data;  // internal forwarding
//    else
//      rda_out = rda_reg;

//  //
//  // Read port B
//  //
//  always_comb
//    if (rdb_idx == `ZERO_REG)
//      rdb_out = 0;
//    else if (wr_en && (wr_idx == rdb_idx))
//      rdb_out = wr_data;  // internal forwarding
//    else
//      rdb_out = rdb_reg;

//  //
//  // Write port
//  //
//  always_ff @(posedge wr_clk)
//    if (wr_en) begin
//      registers[wr_idx] <= `SD wr_data;
//    end

//endmodule // regfile
`endif //__REGFILE_V__
