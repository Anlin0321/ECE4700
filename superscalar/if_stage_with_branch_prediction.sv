/////////////////////////////////////////////////////////////////////////
//                                                                     //
//   Modulename :  if_stage.v                                          //
//                                                                     //
//  Description :  instruction fetch (IF) stage of the pipeline;       // 
//                 fetch instruction, compute next PC location, and    //
//                 send them down the pipeline.                        //
//                                                                     //
//                                                                     //
/////////////////////////////////////////////////////////////////////////

`timescale 1ns/100ps

`include "sys_defs.svh"

// 先做always take
// 再decode instruction, decode offset then jump
// ex stage calculate target, packet add branch take or not. 成败
module if_stage_with_branch_prediction (
    input  logic                          clk, rst,
    // ---- pipeline control ----
    input  logic                          stall,
    input  logic                          flush,
    input  XLEN_t                         new_PC,        // redirected PC on branch
    input  logic                          bp_prediction,  // Prediction signal (taken/not taken)
    input  XLEN_t                         bp_target,      // Predicted target address
    // ---- I-cache interface (superscalar) ----
    output logic [`ISSUE_WIDTH-1:0] [1:0]         proc2Icache_command, 
//    output XLEN_t [`ISSUE_WIDTH-1:0]      proc2Icache_addr,
    output logic [`ISSUE_WIDTH-1:0] [`XLEN-1:0]    proc2Icache_addr,
    input  logic [`ISSUE_WIDTH-1:0] [3:0]          mem2Icache_response,
    input  logic [`ISSUE_WIDTH-1:0] [63:0]         mem2Icache_data,
    input  logic [`ISSUE_WIDTH-1:0] [3:0]          mem2Icache_tag,
    // ---- IF/ID latch ----
    output IF_ID_PACKET                   if_id_out
);

    // ---- program counter ----
    XLEN_t PC_q, PC_n;
    logic PC_enable;
    
    assign PC_enable = !stall | flush;

    always_ff @(posedge clk or posedge rst) begin
        if (rst) 
            PC_q <= `PC_RESET;
        else if (PC_enable) 
            PC_q <= PC_n;
    end

    // next PC logic
    always_comb begin
    if (flush) begin
            // Misprediction recovery - highest priority
            PC_n = new_PC;  
        end else if (bp_prediction) begin
            // Predicted branch
            PC_n = bp_target;
        end else begin
            // Sequential flow
            PC_n = PC_q + 4*`ISSUE_WIDTH;
        end
    end

    // ---- I-cache requests ----
    genvar w;
    generate
        for (w = 0; w < `ISSUE_WIDTH; w++) begin : G_ICACHE
            // Send fetch request for this instruction slot
//            assign proc2Icache_command[w] = (stall || flush) ? BUS_NONE : BUS_LOAD;
            assign proc2Icache_command[w] = PC_enable ? BUS_LOAD : BUS_NONE;
            assign proc2Icache_addr[w]    = PC_q + w*4;  // word-aligned address
            
            // Process cache response
            assign if_id_out.inst [w] = proc2Icache_addr[w][2]? mem2Icache_data[w][63: 32] : mem2Icache_data[w][31:0];
            assign if_id_out.PC   [w] = PC_q + w*4;
            assign if_id_out.NPC  [w] = PC_q + (w+1)*4;
            
            // Valid if cache responded and no stall/flush
            assign if_id_out.valid[w] = (mem2Icache_response[w] != 0) && 
                                       ~stall && ~flush && 
                                       (mem2Icache_tag[w] == mem2Icache_response[w]);
        end
    endgenerate

endmodule

//module if_stage(
//	input         clock,                  // system clock
//	input         reset,                  // system reset
//	input         mem_wb_valid_inst,      // only go to next instruction when true
//	                                      // makes pipeline behave as single-cycle
//	input         ex_mem_take_branch,      // taken-branch signal
//	input  [`XLEN-1:0] ex_mem_target_pc,        // target pc: use if take_branch is TRUE
//	input  [63:0] Imem2proc_data,          // Data coming back from instruction-memory
//	output logic [`XLEN-1:0] proc2Imem_addr,    // Address sent to Instruction memory
//	output IF_ID_PACKET if_packet_out         // Output data packet from IF going to ID, see sys_defs for signal information 
//);


//	logic    [`XLEN-1:0] PC_reg;             // PC we are currently fetching
	
//	logic    [`XLEN-1:0] PC_plus_4;
//	logic    [`XLEN-1:0] next_PC;
//	logic           PC_enable;
	
//	assign proc2Imem_addr = {PC_reg[`XLEN-1:3], 3'b0};
	
//	// this mux is because the Imem gives us 64 bits not 32 bits
//	assign if_packet_out.inst = PC_reg[2] ? Imem2proc_data[63:32] : Imem2proc_data[31:0];
	
//	// default next PC value
//	assign PC_plus_4 = PC_reg + 4;
	
//	// next PC is target_pc if there is a taken branch or
//	// the next sequential PC (PC+4) if no branch
//	// (halting is handled with the enable PC_enable;
//	assign next_PC = ex_mem_take_branch ? ex_mem_target_pc : PC_plus_4;
	
//	// The take-branch signal must override stalling (otherwise it may be lost)
//	assign PC_enable = if_packet_out.valid | ex_mem_take_branch;
	
//	// Pass PC+4 down pipeline w/instruction
//	assign if_packet_out.NPC = PC_plus_4;
//	assign if_packet_out.PC  = PC_reg;
//	// This register holds the PC value
//	// synopsys sync_set_reset "reset"
//	always_ff @(posedge clock) begin
//		if(reset)
//			PC_reg <= `SD 0;       // initial PC value is 0
//		else if(PC_enable)
//			PC_reg <= `SD next_PC; // transition to next PC
//	end  // always
	
//	// This FF controls the stall signal that artificially forces
//	// fetch to stall until the previous instruction has completed
//	// This must be removed for Project 3
//	// synopsys sync_set_reset "reset"
//	always_ff @(posedge clock) begin
//		if (reset)
//			if_packet_out.valid <= `SD 1;  // must start with something
//		else
//			if_packet_out.valid <= `SD mem_wb_valid_inst;
//	end
//endmodule  // module if_stage
