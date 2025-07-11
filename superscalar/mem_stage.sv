/////////////////////////////////////////////////////////////////////////
//                                                                     //
//   Modulename :  mem_stage.v                                         //
//                                                                     //
//  Description :  memory access (MEM) stage of the pipeline;          //
//                 this stage accesses memory for stores and loads,    // 
//                 and selects the proper next PC value for branches   // 
//                 based on the branch condition computed in the       //
//                 previous stage.                                     // 
//                                                                     //
//                                                                     //
/////////////////////////////////////////////////////////////////////////

`ifndef __MEM_STAGE_V__
`define __MEM_STAGE_V__

`timescale 1ns/100ps

`include "sys_defs.svh"


module mem_stage
(
    input  logic          clk, rst,

    // ---- EX/MEM input ----
    input  EX_MEM_PACKET  ex_mem_in,

    // ---- memory interface (abstract) ----
    output logic          mem_rd,
    output logic          mem_wr,
    output XLEN_t         mem_addr,
    output logic [31:0]   mem_wdata,
    input  logic [31:0]   mem_rdata,

    // ---- MEM/WB output ----
    output MEM_WB_PACKET  mem_wb_out
);

    // note: for brevity only slot 0 really accesses memory
    assign mem_rd   = ex_mem_in.rd_mem[0] & ex_mem_in.valid[0];
    assign mem_wr   = ex_mem_in.wr_mem[0] & ex_mem_in.valid[0];
    assign mem_addr = ex_mem_in.alu_result[0];
    assign mem_wdata= ex_mem_in.rs2_value[0];

    genvar w;
    generate
        for (w = 0; w < `ISSUE_WIDTH; w++) begin : G_MEM
            assign mem_wb_out.wb_data[w] =
                      ex_mem_in.rd_mem[w] ? mem_rdata :
                      ex_mem_in.alu_result[w];  // ALU result for reg ops

            // pass-through control
            assign mem_wb_out.dest_reg_idx[w] = ex_mem_in.dest_reg_idx[w];
            assign mem_wb_out.halt         [w] = ex_mem_in.halt[w];
            assign mem_wb_out.illegal      [w] = ex_mem_in.illegal[w];
            assign mem_wb_out.csr_op       [w] = ex_mem_in.csr_op[w];
            assign mem_wb_out.valid        [w] = ex_mem_in.valid[w];
        end
    endgenerate
endmodule

//module mem_stage(
//	input         clock,              // system clock
//	input         reset,              // system reset
//	input  EX_MEM_PACKET ex_mem_packet_in,      // write memory? (from decoder)
//	input  [`XLEN-1:0] Dmem2proc_data,
	
//	output logic [`XLEN-1:0] mem_result_out,      // outgoing instruction result (to MEM/WB)
//	output logic [1:0] proc2Dmem_command,
//	output MEM_SIZE proc2Dmem_size,
//	output logic [`XLEN-1:0] proc2Dmem_addr,      // Address sent to data-memory
//	output logic [`XLEN-1:0] proc2Dmem_data      // Data sent to data-memory
//);



//	// Determine the command that must be sent to mem
//	assign proc2Dmem_command =
//	                        (ex_mem_packet_in.wr_mem & ex_mem_packet_in.valid) ? BUS_STORE :
//							(ex_mem_packet_in.rd_mem & ex_mem_packet_in.valid) ? BUS_LOAD :
//	                        BUS_NONE;

//	assign proc2Dmem_size = MEM_SIZE'(ex_mem_packet_in.mem_size[1:0]);	//only the 2 LSB to determine the size;
	


//	// The memory address is calculated by the ALU
//	assign proc2Dmem_data = ex_mem_packet_in.rs2_value;

//	assign proc2Dmem_addr = ex_mem_packet_in.alu_result;	
//	// Assign the result-out for next stage
//	always_comb begin
//		mem_result_out = ex_mem_packet_in.alu_result;
//		if (ex_mem_packet_in.rd_mem) begin
//			if (~ex_mem_packet_in.mem_size[2]) begin //is this an signed/unsigned load?
//				if (ex_mem_packet_in.mem_size[1:0] == 2'b0)
//					mem_result_out = {{(`XLEN-8){Dmem2proc_data[7]}}, Dmem2proc_data[7:0]};
//				else if  (ex_mem_packet_in.mem_size[1:0] == 2'b01) 
//					mem_result_out = {{(`XLEN-16){Dmem2proc_data[15]}}, Dmem2proc_data[15:0]};
//				else mem_result_out = Dmem2proc_data;
//			end else begin
//				if (ex_mem_packet_in.mem_size[1:0] == 2'b0)
//					mem_result_out = {{(`XLEN-8){1'b0}}, Dmem2proc_data[7:0]};
//				else if  (ex_mem_packet_in.mem_size[1:0] == 2'b01)
//					mem_result_out = {{(`XLEN-16){1'b0}}, Dmem2proc_data[15:0]};
//				else mem_result_out = Dmem2proc_data;
//			end
//		end
//	end
//	//if we are in 32 bit mode, then we should never load a double word sized data
//	assert property (@(negedge clock) (`XLEN == 32) && ex_mem_packet_in.rd_mem |-> proc2Dmem_size != DOUBLE);

//endmodule // module mem_stage
`endif // __MEM_STAGE_V__
