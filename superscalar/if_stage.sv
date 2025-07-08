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

module if_stage
(
    input  logic                      clk, rst,
    // ---- pipeline control ----
    input  logic [`ISSUE_WIDTH-1:0]   stall,
    input  logic                      flush,
    input  XLEN_t                     new_PC,       // redirected PC on branch
    // ---- I-cache interface ----
    output XLEN_t                     icache_addr,
    input  logic [95:0]               icache_data,  // 3 x 32-bit words per hit
    // ---- IF/ID latch ----
    output IF_ID_PACKET               if_id_out
);

    // ---- program counter ----
    XLEN_t PC_q, PC_n;

    // This is the registered logic for the IF stage
    always_ff @(posedge clk or posedge rst) begin
        if (rst) begin
            PC_q <= `PC_RESET;
            if_id_out.valid <= '{default: 0};
        end
        // FIX: Replaced '!|stall' with a more portable comparison to zero
        else if (stall == '0) begin 
            PC_q <= PC_n;
            if_id_out.valid <= ~flush ? '{default: 1} : '{default: 0};
        end
    end

    // Combinational logic for the next PC value
    always_comb begin
        if (flush)
            PC_n = new_PC;
        // FIX: Replaced '|stall' with a more portable comparison to zero
        else if (stall != '0)
            PC_n = PC_q;      // If any slot is stalled, hold the PC
        else
            PC_n = PC_q + (`ISSUE_WIDTH * 4); // Advance PC by the number of instructions fetched
    end

    // ---- I-cache request ----
    assign icache_addr = {PC_q[31:2], 2'b00};      // word-aligned

    // ---- Split cache line into individual instructions for the IF/ID packet ----
    genvar w;
    generate
        for (w = 0; w < `ISSUE_WIDTH; w++) begin : G_SPLIT
            assign if_id_out.inst[w]  = icache_data[w*32 +: 32];
            assign if_id_out.PC[w]    = PC_q + (w * 4);
            assign if_id_out.NPC[w]   = PC_q + ((w + 1) * 4);
        end
    endgenerate
endmodule
//tzb's fix
//module if_stage
//(
//    input  logic          clk, rst,
//    // ---- pipeline control ----
//    input  logic [`ISSUE_WIDTH-1:0] stall,
//    input  logic          flush,
//    input  XLEN_t         new_PC,       // redirected PC on branch
//    // ---- I-cache interface ----
//    output XLEN_t         icache_addr,
//    input  logic [95:0]   icache_data,  // 3 �� 32-bit words per hit
//    // ---- IF/ID latch ----
//    output IF_ID_PACKET   if_id_out
//);

//    // ---- program counter ----
//    XLEN_t PC_q, PC_n;

//    always_ff @(posedge clk or posedge rst) begin
//        if (rst) begin
//            PC_q <= `PC_RESET;
//            if_id_out.valid <= '0;
//        end
//        else if (!stall) begin 
//            PC_q <= PC_n;
//            if_id_out.valid <= ~flush ? {`ISSUE_WIDTH{1'b1}} : '0;
//        end
//    end

//    // next PC logic
//    always_comb begin
//        if (flush)                 PC_n = new_PC;
//        else if (|stall)           PC_n = PC_q;
//        else                       PC_n = PC_q + 12;   // 3 instructions
//    end

//    // ---- I-cache request ----
//    assign icache_addr = {PC_q[31:2], 2'b00};          // word-aligned

//    // ---- split line into 3 instructions ----
//    genvar w;
//    generate
//        for (w = 0; w < `ISSUE_WIDTH; w++) begin : G_SPLIT
//            assign if_id_out.inst [w]  = icache_data >> (w*32);
//            assign if_id_out.PC   [w]  = PC_q + w*4;
//            assign if_id_out.NPC  [w]  = PC_q + (w+1)*4;
//            assign if_id_out.valid[w]  = ~(|stall & ~stall[w]) & ~flush;
//        end
//    endgenerate
//endmodule

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
