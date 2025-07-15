/////////////////////////////////////////////////////////////////////////
//                                                                     //
//   Modulename :  wb_stage.v                                          //
//                                                                     //
//  Description :   writeback (WB) stage of the pipeline;              //
//                  determine the destination register of the          //
//                  instruction and write the result to the register   //
//                  file (if not to the zero register), also reset the //
//                  NPC in the fetch stage to the correct next PC      //
//                  address.                                           // 
//                                                                     //
//                                                                     //
/////////////////////////////////////////////////////////////////////////

`timescale 1ns/100ps

`include "sys_defs.svh"

module wb_stage
(
    // ---- MEM/WB input ----
    input  MEM_WB_PACKET  mem_wb_in,

    // ---- regfile write-back ----
    output logic  [`ISSUE_WIDTH-1:0]        rf_wr_en,
    output logic  [`ISSUE_WIDTH-1:0][4:0]   rf_wr_idx,
    output XLEN_t [`ISSUE_WIDTH-1:0]        rf_wr_data,

    // ---- global halt/illegal ----
    output logic          halt_out,
    output logic          illegal_out
);

    genvar w;
    generate
        for (w = 0; w < `ISSUE_WIDTH; w++) begin : G_WB
            assign rf_wr_en  [w] = mem_wb_in.valid[w] & ~mem_wb_in.illegal[w];
            assign rf_wr_idx [w] = mem_wb_in.dest_reg_idx[w];
            assign rf_wr_data[w] = mem_wb_in.wb_data[w];
        end
    endgenerate

//    assign halt_out    = &mem_wb_in.halt;       // halt when *all* lanes halt
//    assign illegal_out = |mem_wb_in.illegal;    // any lane illegal
    // ----------------------------------------------------------
    //  Global halt / illegal reduction for unpacked arrays
    // ----------------------------------------------------------
    logic all_halt;
    logic any_illegal;

    always_comb begin
        all_halt    = 1'b1;
        any_illegal = 1'b0;
        for (int i = 0; i < `ISSUE_WIDTH; i++) begin
            all_halt    &= mem_wb_in.halt   [i];
            any_illegal |= mem_wb_in.illegal[i];
        end
    end

    assign halt_out    = all_halt;      // halt when every lane requests halt
    assign illegal_out = any_illegal;   // illegal if any lane flags it
endmodule

//module wb_stage(
//    input         clock,                // system clock
//    input         reset,                // system reset
//    input  [`XLEN-1:0] mem_wb_NPC,            // incoming instruction PC+4
//    input  [`XLEN-1:0] mem_wb_result,        // incoming instruction result
//    input         mem_wb_take_branch, 
//    input   [4:0] mem_wb_dest_reg_idx,  // dest index (ZERO_REG if no writeback)
//    input         mem_wb_valid_inst,

//    output logic [`XLEN-1:0] reg_wr_data_out,      // register writeback data
//    output logic [4:0] reg_wr_idx_out,        // register writeback index
//    output logic       reg_wr_en_out          // register writeback enable
//    // Always enabled if valid inst
//  );


//  wire   [`XLEN-1:0] result_mux;

//  // Mux to select register writeback data:
//  // ALU/MEM result, unless taken branch, in which case we write
//  // back the old NPC as the return address.  Note that ALL branches
//  // and jumps write back the 'link' value, but those that don't
//  // want it specify ZERO_REG as the destination.
//  assign result_mux = (mem_wb_take_branch) ? mem_wb_NPC : mem_wb_result;

//  // Generate signals for write-back to register file
//  // reg_wr_en_out computation is sort of overkill since the reg file
//  // has a special way of handling `ZERO_REG but there is no harm 
//  // in putting this here.  Hopefully it illustrates how the pipeline works.
//  assign reg_wr_en_out  = mem_wb_dest_reg_idx != `ZERO_REG;
//  assign reg_wr_idx_out = mem_wb_dest_reg_idx;
//  assign reg_wr_data_out = result_mux;

//endmodule // module wb_stage

