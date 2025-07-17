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


module mem_stage (
    input  logic          clk, rst,
    // ---- EX/MEM input (superscalar) ----
    input  EX_MEM_PACKET                    ex_mem_in,
    // ---- D-cache interface (superscalar) ----
    output logic [`ISSUE_WIDTH-1:0] [1:0]          proc2Dcache_command,
//    output XLEN_t [`ISSUE_WIDTH-1:0]        proc2Dcache_addr,
    output logic [`ISSUE_WIDTH-1:0] [`XLEN-1:0]    proc2Dcache_addr,
    output logic [`ISSUE_WIDTH-1:0] [63:0]         proc2Dcache_data,
`ifndef CACHE_MODE
    output MEM_SIZE [`ISSUE_WIDTH-1:0]      proc2Dcache_size,
`endif
    input  logic [`ISSUE_WIDTH-1:0] [3:0]   mem2Dcache_response,
    input  logic [`ISSUE_WIDTH-1:0] [63:0]  mem2Dcache_data,
    input  logic [`ISSUE_WIDTH-1:0] [3:0]   mem2Dcache_tag,
    // ---- MEM/WB output (superscalar) ----
    output MEM_WB_PACKET                    mem_wb_out,
    // ---- Pipeline control ----
    output logic mem_stall
);

    // State for each memory operation
    logic [`ISSUE_WIDTH-1:0] pending;
    logic [`ISSUE_WIDTH-1:0] [63:0] load_data;

    genvar w;
    generate
        for (w = 0; w < `ISSUE_WIDTH; w++) begin : G_MEM
            // Issue memory request if valid and not already pending
            assign proc2Dcache_command[w] = (ex_mem_in.valid[w] && !pending[w] && 
                                            (ex_mem_in.rd_mem[w] || ex_mem_in.wr_mem[w])) ? 
                                           (ex_mem_in.rd_mem[w] ? BUS_LOAD : BUS_STORE) : BUS_NONE;
            
            assign proc2Dcache_addr[w] = ex_mem_in.alu_result[w];
            assign proc2Dcache_data[w] = ex_mem_in.rs2_value[w];
            
`ifndef CACHE_MODE
            assign proc2Dcache_size[w] = MEM_SIZE'(ex_mem_in.mem_size[w][1:0]);
`endif

            // Memory operation state machine
            always_ff @(posedge clk or posedge rst) begin
                if (rst || mem_stall) begin
                    pending[w] <= 1'b0;
                end else begin
                    // Set pending when request is accepted
                    if (proc2Dcache_command[w] != BUS_NONE && 
                        mem2Dcache_response[w] != 0) begin
                        pending[w] <= 1'b1;
                    end
                    // Clear pending when response arrives
                    if (mem2Dcache_tag[w] != 0) begin
                        pending[w] <= 1'b0;
                    end
                end
            end

            // Handle load data sign-extension
            always_ff @(posedge clk) begin
                if (mem2Dcache_tag[w] != 0 && ex_mem_in.rd_mem[w]) begin
                    if (ex_mem_in.mem_size[w][2]) begin // Signed load
                        case (ex_mem_in.mem_size[w][1:0])
                            2'b00:  load_data[w] <= {{56{mem2Dcache_data[w][7]}},  mem2Dcache_data[w][7:0]};
                            2'b01:  load_data[w] <= {{48{mem2Dcache_data[w][15]}}, mem2Dcache_data[w][15:0]};
                            2'b10:  load_data[w] <= {{32{mem2Dcache_data[w][31]}}, mem2Dcache_data[w][31:0]};
                            default: load_data[w] <= mem2Dcache_data[w];
                        endcase
                    end else begin // Unsigned load
                        case (ex_mem_in.mem_size[w][1:0])
                            2'b00:  load_data[w] <= {56'b0, mem2Dcache_data[w][7:0]};
                            2'b01:  load_data[w] <= {48'b0, mem2Dcache_data[w][15:0]};
                            2'b10:  load_data[w] <= {32'b0, mem2Dcache_data[w][31:0]};
                            default: load_data[w] <= mem2Dcache_data[w];
                        endcase
                    end
                end
            end

            // Write-back data selection
            assign mem_wb_out.wb_data[w] = 
                (ex_mem_in.rd_mem [w]&& mem2Dcache_tag[w] != 0) ? load_data[w] : 
                ex_mem_in.alu_result[w];

            // Pass-through control signals
            assign mem_wb_out.NPC[w]          = ex_mem_in.NPC[w];
            assign mem_wb_out.take_branch[w]  = ex_mem_in.take_branch[w];
            assign mem_wb_out.dest_reg_idx[w] = ex_mem_in.dest_reg_idx[w];
            assign mem_wb_out.halt[w]         = ex_mem_in.halt[w];
            assign mem_wb_out.illegal[w]      = ex_mem_in.illegal[w];
            assign mem_wb_out.csr_op[w]       = ex_mem_in.csr_op[w];
            assign mem_wb_out.valid[w]        = ex_mem_in.valid[w] && 
                                              ((!ex_mem_in.rd_mem[w] && !ex_mem_in.wr_mem[w]) || 
                                               (mem2Dcache_tag[w] != 0));
        end
    endgenerate

    // Stall if any memory operation is pending
    assign mem_stall = |pending;

    // Assertions for 32-bit mode
    generate
        for (w = 0; w < `ISSUE_WIDTH; w++) begin : G_ASSERT
            property no_double_in_32bit;
                @(negedge clk) (`XLEN == 32) && ex_mem_in.rd_mem[w] |-> proc2Dcache_size[w] != DOUBLE;
            endproperty
            
            always @(negedge clk) begin
                if(`XLEN == 32) begin
                    $display("[%t] Checking ex_mem_in.rd_mem[w] for operation %0d", $time, w);
                    $display("  ex_mem_in.rd_mem[%0d]: %b", w, ex_mem_in.rd_mem[w]);
                    $display("[%t] Checking no_double_in_32bit for operation %0d", $time, w);
                    $display("  proc2Dcache_size[%0d]: %b", w, proc2Dcache_size[w]);
                end
            end
            assert property (no_double_in_32bit);
        end
    endgenerate

endmodule
`endif // __MEM_STAGE_V__

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
//`endif // __MEM_STAGE_V__
