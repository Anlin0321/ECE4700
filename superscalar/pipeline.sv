/////////////////////////////////////////////////////////////////////////
//                                                                     //
//   Modulename :  pipeline.v                                          //
//                                                                     //
//  Description :  Top-level module of the verisimple pipeline;        //
//                 This instantiates and connects the 5 stages of the  //
//                 Verisimple pipeline togeather.                      //
//                                                                     //
//                                                                     //
/////////////////////////////////////////////////////////////////////////

`ifndef __PIPELINE_V__
`define __PIPELINE_V__

`timescale 1ns/100ps

`include "sys_defs.svh"

module pipeline (
    input  logic clk, rst,
    // ---- I-cache (superscalar) ----
    output logic [`ISSUE_WIDTH-1:0] [1:0]   proc2Icache_command, 
    output XLEN_t [`ISSUE_WIDTH-1:0]        proc2Icache_addr,
    input  logic [`ISSUE_WIDTH-1:0] [3:0]   mem2Icache_response,
    input  logic [`ISSUE_WIDTH-1:0] [63:0]  mem2Icache_data,
    input  logic [`ISSUE_WIDTH-1:0] [3:0]   mem2Icache_tag,

    // ---- D-cache (superscalar) ----
    output logic [`ISSUE_WIDTH-1:0] [1:0]   proc2Dcache_command,
    output XLEN_t [`ISSUE_WIDTH-1:0]        proc2Dcache_addr,
    output logic [`ISSUE_WIDTH-1:0] [63:0]  proc2Dcache_data,
`ifndef CACHE_MODE
    output MEM_SIZE [`ISSUE_WIDTH-1:0]      proc2Dcache_size,
`endif
    input  logic [`ISSUE_WIDTH-1:0] [3:0]   mem2Dcache_response,
    input  logic [`ISSUE_WIDTH-1:0] [63:0]  mem2Dcache_data,
    input  logic [`ISSUE_WIDTH-1:0] [3:0]   mem2Dcache_tag,
    
    // ---- Monitor Signals ----
    output logic [$clog2(`ISSUE_WIDTH+1)-1:0]  pipeline_completed_insts,
    output EXCEPTION_CODE   pipeline_error_status
);

    // ---------------------------------------------------------
    // Stage registers (now ISSUE_WIDTH arrays)
    // ---------------------------------------------------------
    IF_ID_PACKET   if_packet, if_id_packet;
//    ID_EX_PACKET   id_packet, id_ex_packet, id_ex_forward_packet, id_ex_stall_packet;
    ID_EX_PACKET   id_packet, id_ex_forward_packet, id_ex_stall_packet;
//    ID_EX_PACKET   id_stall_packet, id_forward_packet, id_ex_forward_packet, id_ex_stall_packet;
    EX_MEM_PACKET  ex_packet, ex_mem_packet;
    MEM_WB_PACKET  mem_packet, mem_wb_packet;
    
    // stall register (for id stage)
    logic last_stalled;
    
    // ---- regfile shared between ID & WB ----
    logic [`ISSUE_WIDTH-1:0] [4:0] rs1_idx;
    logic [`ISSUE_WIDTH-1:0] [4:0] rs2_idx;
    logic [`ISSUE_WIDTH-1:0] [4:0] rd_idx;  // id stage rd
    XLEN_t [`ISSUE_WIDTH-1:0]      rs1_val;
    XLEN_t [`ISSUE_WIDTH-1:0]      rs2_val;

    logic [`ISSUE_WIDTH-1:0]        rf_wr_en;
    logic [`ISSUE_WIDTH-1:0] [4:0]  rf_wr_idx;
    XLEN_t [`ISSUE_WIDTH-1:0]       rf_wr_data;

    // ---------------------------------------------------------
    // Control wires
    // ---------------------------------------------------------
    logic          stall, flush;
    logic          branch_take;
    XLEN_t         branch_target;
    
    logic if_id_enable;
    logic id_ex_enable;
    logic ex_mem_enable;

    logic [`ISSUE_WIDTH-1:0]  id_kills;
    logic [`ISSUE_WIDTH-1:0]  id_forwards;
    
    // ---------------------------------------------------------
    // Internal Monitors
    // ---------------------------------------------------------
    logic mem_wb_illegal;
    logic mem_wb_halt;
    logic halted;

    always_ff @(posedge clk) begin
        if (rst)
            halted = 1'b0;
        else if (mem_wb_halt)
            halted = 1'b1;
    end

    assign mem_wb_illegal = any_valid_packed(unpacked_and(mem_wb_packet.illegal, mem_wb_packet.valid));
    assign mem_wb_halt = any_valid_unpacked(mem_wb_packet.halt);

    assign pipeline_completed_insts = count_valid(mem_wb_packet.valid);
    assign pipeline_error_status =  mem_wb_illegal             ? ILLEGAL_INST :
	                                mem_wb_halt                ? HALTED_ON_WFI :
	                                // (mem2proc_response==4'h0)  ? LOAD_ACCESS_FAULT :
	                                NO_ERROR;

////////////////////////////////////////////////////
////                                              //
////                  Monitor                     //
////                                              //
////////////////////////////////////////////////////

    function automatic void print_if_id_packet(input IF_ID_PACKET pkt);
        $display("IF_ID_PACKET:");
        for (int i = 0; i < `ISSUE_WIDTH; i++) begin
            $display("  Lane %0d:", i);
            $display("    valid: %b", pkt.valid[i]);
            $display("    inst:  %h", pkt.inst[i]);
            $display("    NPC:   %h", pkt.NPC[i]);
            $display("    PC:    %h", pkt.PC[i]);
        end
    endfunction

    // Helper function to print ID_EX_PACKET
    function automatic void print_id_ex_packet(input ID_EX_PACKET pkt);
        $display("ID_EX_PACKET:");
        for (int i = 0; i < `ISSUE_WIDTH; i++) begin
            $display("  Lane %0d:", i);
            $display("    valid:        %b", pkt.valid[i]);
            $display("    inst:         %h", pkt.inst[i]);
            $display("    NPC:          %h", pkt.NPC[i]);
            $display("    PC:           %h", pkt.PC[i]);
            $display("    rs1_value:    %h", pkt.rs1_value[i]);
            $display("    rs2_value:    %h", pkt.rs2_value[i]);
            $display("    dest_reg_idx: %h", pkt.dest_reg_idx[i]);
            $display("    alu_func:     %s", pkt.alu_func[i].name());
            $display("    rd_mem:       %b", pkt.rd_mem[i]);
            $display("    wr_mem:       %b", pkt.wr_mem[i]);
            $display("    cond_branch:  %b", pkt.cond_branch[i]);
            $display("    uncond_branch:%b", pkt.uncond_branch[i]);
            $display("    halt:         %b", pkt.halt[i]);
            $display("    illegal:      %b", pkt.illegal[i]);
            $display("    csr_op:       %b", pkt.csr_op[i]);
        end
    endfunction

    // Helper function to print EX_MEM_PACKET
    function automatic void print_ex_mem_packet(input EX_MEM_PACKET pkt);
        $display("EX_MEM_PACKET:");
        for (int i = 0; i < `ISSUE_WIDTH; i++) begin
            $display("  Lane %0d:", i);
            $display("    valid:        %b", pkt.valid[i]);
            $display("    alu_result:   %h", pkt.alu_result[i]);
            $display("    NPC:          %h", pkt.NPC[i]);
            $display("    take_branch:  %b", pkt.take_branch[i]);
            $display("    rs2_value:    %h", pkt.rs2_value[i]);
            $display("    rd_mem:       %b", pkt.rd_mem[i]);
            $display("    wr_mem:       %b", pkt.wr_mem[i]);
            $display("    dest_reg_idx: %h", pkt.dest_reg_idx[i]);
            $display("    halt:         %b", pkt.halt[i]);
            $display("    illegal:      %b", pkt.illegal[i]);
            $display("    csr_op:       %b", pkt.csr_op[i]);
            $display("    mem_size:     %b", pkt.mem_size[i]);
        end
    endfunction

    // Helper function to print MEM_WB_PACKET
    function automatic void print_mem_wb_packet(input MEM_WB_PACKET pkt);
        $display("MEM_WB_PACKET:");
        for (int i = 0; i < `ISSUE_WIDTH; i++) begin
            $display("  Lane %0d:", i);
            $display("    valid:        %b", pkt.valid[i]);
            $display("    wb_data:      %h", pkt.wb_data[i]);
            $display("    dest_reg_idx: %h", pkt.dest_reg_idx[i]);
            $display("    halt:         %b", pkt.halt[i]);
            $display("    illegal:      %b", pkt.illegal[i]);
            $display("    csr_op:       %b", pkt.csr_op[i]);
        end
    endfunction

    // Print packets at each stage transition
    always @(posedge clk) begin
        if (rst) begin
            $display("\n[%0t] SYSTEM RESET", $time);

        end else if (~halted) begin
            $display("\n[%0t] CYCLE %0d", $time, $time/10);

            // IF/ID Stage
            $display("--- IF Stage Output ---");
            print_if_id_packet(if_packet);

            // ID/EX Stage
            $display("--- ID Stage Output ---");
//            print_id_ex_packet(id_forward_packet);
            print_id_ex_packet(id_packet);

            // EX/MEM Stage
            $display("--- EX Stage Output ---");
            print_ex_mem_packet(ex_packet);

            // MEM/WB Stage
            $display("--- MEM Stage Output ---");
            print_mem_wb_packet(mem_packet);
 
            // Final WB Stage
            $display("--- WB Stage Output ---");
            for (int i = 0; i < `ISSUE_WIDTH; i++) begin
                if (rf_wr_en[i]) begin
                    $display("  Writing to reg %0d: data=%h", 
                            rf_wr_idx[i], rf_wr_data[i]);
                end
            end
        end
    end


////////////////////////////////////////////////////
////                                              //
////                  IF-Stage                    //
////                                              //
////////////////////////////////////////////////////
    if_stage U_IF (
        .clk                 (clk),
        .rst                 (rst),
        .stall               (stall),
        .flush               (flush),
        .new_PC              (branch_target),
        .proc2Icache_command(proc2Icache_command),
        .proc2Icache_addr    (proc2Icache_addr),
        .mem2Icache_response(mem2Icache_response),
        .mem2Icache_data    (mem2Icache_data),
        .mem2Icache_tag     (mem2Icache_tag),
        .if_id_out           (if_packet)
    );

    regfile U_RF (
        .rda_idx   (rs1_idx),
        .rdb_idx   (rs2_idx),
        .rda_out   (rs1_val),
        .rdb_out   (rs2_val),
        .clk       (clk),
        .rst       (rst),
        .wr_en     (rf_wr_en),
        .wr_idx    (rf_wr_idx),
        .wr_data   (rf_wr_data)
    );

    // ---- scoreboard ----
    logic sb_stall;
    logic [`ISSUE_WIDTH-1:0] issue_valid_rs1;
    logic [`ISSUE_WIDTH-1:0] issue_valid_rs2;
    logic [`ISSUE_WIDTH-1:0] issue_valid_rd;
    scoreboard U_SB (
        .clk          (clk),
        .rst          (rst),
        .commit_valid (rf_wr_en),
        .commit_rd    (rf_wr_idx),
        .issue_valid_rs1  (issue_valid_rs1),
        .issue_valid_rs2  (issue_valid_rs2),
        .issue_valid_rd   (issue_valid_rd),
        .issue_rs1    (rs1_idx),
        .issue_rs2    (rs2_idx),
        .issue_rd     (rd_idx),
        .stall        (sb_stall)
    );

////////////////////////////////////////////////////
////                                              //
////            IF/ID Pipeline Register           //
////                                              //
////////////////////////////////////////////////////

	assign if_id_enable = 1'b1; // always enabled
//    assign if_id_enable = ~stall; // if stalled, we want if_id registers freeze
	// synopsys sync_set_reset "reset"
	always_ff @(posedge clk) begin
		if (rst) begin 
			for (int i = 0; i < `ISSUE_WIDTH; i++) begin
                if_id_packet.valid[i] <= 1'b0;
                if_id_packet.inst[i]  <= `NOP;
                if_id_packet.NPC[i]   <= 0;
                if_id_packet.PC[i]    <= 0;
            end
		end else begin// if (reset)
			if (if_id_enable) begin
				if_id_packet <= `SD if_packet; 
			end // if (if_id_enable)	
		end
	end // always

////////////////////////////////////////////////////
////                                              //
////                  ID-Stage                    //
////                                              //
////////////////////////////////////////////////////
    logic in_lane_stall; // stall for intra-lane hazards
    id_stage U_ID (
        .clk         (clk),
        .rst         (rst),
        .if_id_in    (if_id_packet),
        .id_ex_in    (id_ex_stall_packet),

        .issue_valid_rs1 (issue_valid_rs1),
        .issue_valid_rs2 (issue_valid_rs2),
        .issue_valid_rd  (issue_valid_rd),
        .issue_rd        (rd_idx),
        .rf_rs1_idx  (rs1_idx),
        .rf_rs2_idx  (rs2_idx),
        .rf_rs1_val  (rs1_val),
        .rf_rs2_val  (rs2_val),

        .id_ex_out   (id_packet),
//        .id_ex_forward_out  (id_forward_packet),
//        .id_ex_stall_out    (id_stall_packet),
        .forward     (id_forwards),
        .stall       (last_stalled),
        .flush       (flush),
        .kill        (id_kills)
    );
    
////////////////////////////////////////////////////
////                                              //
////            ID/EX Pipeline Register           //
////                                              //
////////////////////////////////////////////////////

//	assign id_ex_NPC        = id_ex_packet.NPC;
//	assign id_ex_IR         = id_ex_packet.inst;
//	assign id_ex_valid_inst = id_ex_packet.valid;

	assign id_ex_enable = 1'b1; // always enabled
	assign in_lane_stall = any_valid_packed(id_kills);

    always_ff @(posedge clk) begin
        if (rst)
            last_stalled = 1'b0;
        else
            last_stalled = stall;
    end

	// synopsys sync_set_reset "reset"
	always_ff @(posedge clk) begin
		if (rst) begin
		    for (int i = 0; i < `ISSUE_WIDTH; i++) begin
//                id_ex_packet.NPC[i]           <= {`XLEN{1'b0}};
//                id_ex_packet.PC[i]            <= {`XLEN{1'b0}};
//                id_ex_packet.rs1_value[i]     <= {`XLEN{1'b0}};
//                id_ex_packet.rs2_value[i]     <= {`XLEN{1'b0}};
//                id_ex_packet.opa_select[i]    <= OPA_IS_RS1;  // Default to using RS1
//                id_ex_packet.opb_select[i]    <= OPB_IS_RS2;  // Default to using RS2
//                id_ex_packet.inst[i]         <= `NOP;        // Insert NOP instructions
//                id_ex_packet.dest_reg_idx[i]  <= `ZERO_REG;   // Default to zero register
//                id_ex_packet.alu_func[i]      <= ALU_ADD;     // Default to ADD operation
//                id_ex_packet.rd_mem[i]       <= 1'b0;        // No memory read
//                id_ex_packet.wr_mem[i]       <= 1'b0;        // No memory write
//                id_ex_packet.cond_branch[i]  <= 1'b0;        // No conditional branch
//                id_ex_packet.uncond_branch[i] <= 1'b0;        // No unconditional branch
//                id_ex_packet.halt[i]         <= 1'b0;        // Not halted
//                id_ex_packet.illegal[i]      <= 1'b0;        // Legal instruction
//                id_ex_packet.csr_op[i]       <= 1'b0;        // No CSR operation
//                id_ex_packet.valid[i]        <= 1'b0;        // Invalid instruction

                id_ex_forward_packet.NPC[i]           <= {`XLEN{1'b0}};
                id_ex_forward_packet.PC[i]            <= {`XLEN{1'b0}};
                id_ex_forward_packet.rs1_value[i]     <= {`XLEN{1'b0}};
                id_ex_forward_packet.rs2_value[i]     <= {`XLEN{1'b0}};
                id_ex_forward_packet.rs1_idx[i]     <= {`XLEN{1'b0}};
                id_ex_forward_packet.rs2_idx[i]     <= {`XLEN{1'b0}};
                id_ex_forward_packet.opa_select[i]    <= OPA_IS_RS1;  // Default to using RS1
                id_ex_forward_packet.opb_select[i]    <= OPB_IS_RS2;  // Default to using RS2
                id_ex_forward_packet.inst[i]         <= `NOP;        // Insert NOP instructions
                id_ex_forward_packet.dest_reg_idx[i]  <= `ZERO_REG;   // Default to zero register
                id_ex_forward_packet.alu_func[i]      <= ALU_ADD;     // Default to ADD operation
                id_ex_forward_packet.rd_mem[i]       <= 1'b0;        // No memory read
                id_ex_forward_packet.wr_mem[i]       <= 1'b0;        // No memory write
                id_ex_forward_packet.cond_branch[i]  <= 1'b0;        // No conditional branch
                id_ex_forward_packet.uncond_branch[i] <= 1'b0;        // No unconditional branch
                id_ex_forward_packet.halt[i]         <= 1'b0;        // Not halted
                id_ex_forward_packet.illegal[i]      <= 1'b0;        // Legal instruction
                id_ex_forward_packet.csr_op[i]       <= 1'b0;        // No CSR operation
                id_ex_forward_packet.valid[i]        <= 1'b0;        // Invalid instruction
                
                id_ex_stall_packet.NPC[i]           <= {`XLEN{1'b0}};
                id_ex_stall_packet.PC[i]            <= {`XLEN{1'b0}};
                id_ex_stall_packet.rs1_value[i]     <= {`XLEN{1'b0}};
                id_ex_stall_packet.rs2_value[i]     <= {`XLEN{1'b0}};
                id_ex_stall_packet.rs1_idx[i]     <= {`XLEN{1'b0}};
                id_ex_stall_packet.rs2_idx[i]     <= {`XLEN{1'b0}};
                id_ex_stall_packet.opa_select[i]    <= OPA_IS_RS1;  // Default to using RS1
                id_ex_stall_packet.opb_select[i]    <= OPB_IS_RS2;  // Default to using RS2
                id_ex_stall_packet.inst[i]         <= `NOP;        // Insert NOP instructions
                id_ex_stall_packet.dest_reg_idx[i]  <= `ZERO_REG;   // Default to zero register
                id_ex_stall_packet.alu_func[i]      <= ALU_ADD;     // Default to ADD operation
                id_ex_stall_packet.rd_mem[i]       <= 1'b0;        // No memory read
                id_ex_stall_packet.wr_mem[i]       <= 1'b0;        // No memory write
                id_ex_stall_packet.cond_branch[i]  <= 1'b0;        // No conditional branch
                id_ex_stall_packet.uncond_branch[i] <= 1'b0;        // No unconditional branch
                id_ex_stall_packet.halt[i]         <= 1'b0;        // Not halted
                id_ex_stall_packet.illegal[i]      <= 1'b0;        // Legal instruction
                id_ex_stall_packet.csr_op[i]       <= 1'b0;        // No CSR operation
                id_ex_stall_packet.valid[i]        <= 1'b0;        // Invalid instruction
			end
        end else if (sb_stall) begin
//            id_ex_stall_packet <= `SD id_stall_packet;
            id_ex_stall_packet <= `SD id_packet;

            for (int i = 0; i < `ISSUE_WIDTH; i++) begin
                id_ex_forward_packet.valid[i] <= `SD 1'b0;
//                id_ex_stall_packet.valid[i]   <= `SD id_forward_packet.valid[i]; 
            end

		end else begin // if (reset)
			if (id_ex_enable) begin
				id_ex_forward_packet <= `SD id_packet;
				id_ex_stall_packet <= `SD id_packet;
				for (int i = 0; i < `ISSUE_WIDTH; i++) begin
                    id_ex_forward_packet.valid[i] <= `SD id_packet.valid[i] & id_forwards[i];
                    id_ex_stall_packet.valid[i]   <= `SD id_packet.valid[i] & ~id_forwards[i]; 
                end
			end // if
		end // else: !if(reset)
	end // always

////////////////////////////////////////////////////
////                                              //
////                  EX-Stage                    //
////                                              //
////////////////////////////////////////////////////

    ex_stage U_EX (
        .clk            (clk),
        .rst            (rst),
//        .id_ex_in       (id_ex_packet),
        .id_ex_in       (id_ex_forward_packet),
        .ex_mem_out     (ex_packet),
        .branch_taken   (branch_take),
        .branch_target  (branch_target)
    );

////////////////////////////////////////////////////
////                                              //
////           EX/MEM Pipeline Register           //
////                                              //
////////////////////////////////////////////////////
	
//	assign ex_mem_NPC        = ex_mem_packet.NPC;
//	assign ex_mem_valid_inst = ex_mem_packet.valid;

	assign ex_mem_enable = 1'b1; // always enabled
	// synopsys sync_set_reset "reset"
	always_ff @(posedge clk) begin
		if (rst) begin
//			ex_mem_IR     <= `SD `NOP;
			for (int i = 0; i < `ISSUE_WIDTH; i++) begin
                ex_mem_packet.alu_result[i]   <= 0;
                ex_mem_packet.NPC[i]          <= 0;
                ex_mem_packet.take_branch[i] <= 1'b0;
                ex_mem_packet.rs2_value[i]    <= 0;
                ex_mem_packet.rd_mem[i]      <= 1'b0;
                ex_mem_packet.wr_mem[i]      <= 1'b0;
                ex_mem_packet.dest_reg_idx[i] <= `ZERO_REG;
                ex_mem_packet.halt[i]        <= 1'b0;
                ex_mem_packet.illegal[i]     <= 1'b0;
                ex_mem_packet.csr_op[i]      <= 1'b0;
                ex_mem_packet.valid[i]       <= 1'b0;
                ex_mem_packet.mem_size[i]    <= 3'b0;
            end
		end else begin
			if (ex_mem_enable)   begin
				// these are forwarded directly from ID/EX registers, only for debugging purposes
//				ex_mem_IR     <= `SD id_ex_IR;
				// EX outputs
				ex_mem_packet <= `SD ex_packet;
			end // if
		end // else: !if(reset)
	end // always

////////////////////////////////////////////////////
////                                              //
////                 MEM-Stage                    //
////                                              //
////////////////////////////////////////////////////

    mem_stage U_MEM (
        .clk                (clk),
        .rst                (rst),
        .ex_mem_in          (ex_mem_packet),
        .proc2Dcache_command(proc2Dcache_command),
        .proc2Dcache_addr   (proc2Dcache_addr),
        .proc2Dcache_data   (proc2Dcache_data),
`ifndef CACHE_MODE
        .proc2Dcache_size   (proc2Dcache_size),
`endif
        .mem2Dcache_response(mem2Dcache_response),
        .mem2Dcache_data   (mem2Dcache_data),
        .mem2Dcache_tag    (mem2Dcache_tag),
        .mem_wb_out        (mem_packet)
    );

////////////////////////////////////////////////////
////                                              //
////           MEM/WB Pipeline Register           //
////                                              //
////////////////////////////////////////////////////

    always_ff @(posedge clk) begin
            if (rst) begin
    //			ex_mem_IR     <= `SD `NOP;
                for (int i = 0; i < `ISSUE_WIDTH; i++) begin
                    mem_wb_packet.NPC[i]          <= 0;
                    mem_wb_packet.take_branch[i]  <= 1'b0;
                    mem_wb_packet.wb_data[i]      <= 0;            // Zero writeback data
                    mem_wb_packet.dest_reg_idx[i] <= `ZERO_REG;    // Target zero register
                    mem_wb_packet.halt[i]        <= 1'b0;         // Not halted
                    mem_wb_packet.illegal[i]     <= 1'b0;         // Legal instruction
                    mem_wb_packet.csr_op[i]      <= 1'b0;         // No CSR operation
                    mem_wb_packet.valid[i]       <= 1'b0;         // Invalid instruction
                end
            end else begin
                 mem_wb_packet <= `SD mem_packet;
            end // else: !if(reset)
        end // always
    
    wb_stage U_WB (
        .mem_wb_in  (mem_wb_packet),
        .rf_wr_en   (rf_wr_en),
        .rf_wr_idx  (rf_wr_idx),
        .rf_wr_data (rf_wr_data),
        .halt_out   (/* unused */),
        .illegal_out(/* unused */)
    );

//    // ---- Stalling Detection Unit ----
//    stalling_detection_unit U_STALL (
//        .if_id_q    (if_id_q),
//        .id_ex_q    (id_ex_q),
//        .stall      (stall_signal)  // Combine with other stall sources
//    );

//    // ---- forwarding unit ----
//    forwarding_unit U_FU (
//        .id_ex_q        (id_ex_q),
//        .ex_mem_q       (ex_mem_q),
//        .mem_wb_q       (mem_wb_q),
//        .forwardA_stage (forwardA_stage),
//        .forwardA_slot  (forwardA_slot),
//        .forwardB_stage (forwardB_stage),
//        .forwardB_slot  (forwardB_slot)
//    );

    // ---------------------------------------------------------
    // Global stall / flush
    // ---------------------------------------------------------
    assign flush = branch_take;
    assign stall = sb_stall | in_lane_stall;   // + other sources (e.g., cache miss)
//    assign stall = sb_stall | any_valid(stall_signal);

endmodule

//module pipeline (

//	input         clock,                    // System clock
//	input         reset,                    // System reset
//	input [3:0]   mem2proc_response,        // Tag from memory about current request
//	input [63:0]  mem2proc_data,            // Data coming back from memory
//	input [3:0]   mem2proc_tag,              // Tag from memory about current reply
	
//	output logic [1:0]  proc2mem_command,    // command sent to memory
//	output logic [`XLEN-1:0] proc2mem_addr,      // Address sent to memory
//	output logic [63:0] proc2mem_data,      // Data sent to memory
//	output MEM_SIZE proc2mem_size,          // data size sent to memory

//	output logic [3:0]  pipeline_completed_insts,
//	output EXCEPTION_CODE   pipeline_error_status,
//	output logic [4:0]  pipeline_commit_wr_idx,
//	output logic [`XLEN-1:0] pipeline_commit_wr_data,
//	output logic        pipeline_commit_wr_en,
//	output logic [`XLEN-1:0] pipeline_commit_NPC,
	
	
//	// testing hooks (these must be exported so we can test
//	// the synthesized version) data is tested by looking at
//	// the final values in memory
	
	
//	// Outputs from IF-Stage 
//	output logic [`XLEN-1:0] if_NPC_out,
//	output logic [31:0] if_IR_out,
//	output logic        if_valid_inst_out,
	
//	// Outputs from IF/ID Pipeline Register
//	output logic [`XLEN-1:0] if_id_NPC,
//	output logic [31:0] if_id_IR,
//	output logic        if_id_valid_inst,
	
	
//	// Outputs from ID/EX Pipeline Register
//	output logic [`XLEN-1:0] id_ex_NPC,
//	output logic [31:0] id_ex_IR,
//	output logic        id_ex_valid_inst,
	
	
//	// Outputs from EX/MEM Pipeline Register
//	output logic [`XLEN-1:0] ex_mem_NPC,
//	output logic [31:0] ex_mem_IR,
//	output logic        ex_mem_valid_inst,
	
	
//	// Outputs from MEM/WB Pipeline Register
//	output logic [`XLEN-1:0] mem_wb_NPC,
//	output logic [31:0] mem_wb_IR,
//	output logic        mem_wb_valid_inst

//);

//	// Pipeline register enables
//	logic   if_id_enable, id_ex_enable, ex_mem_enable, mem_wb_enable;
	
//	// Outputs from IF-Stage
//	logic [`XLEN-1:0] proc2Imem_addr;
//	IF_ID_PACKET if_packet;

//	// Outputs from IF/ID Pipeline Register
//	IF_ID_PACKET if_id_packet;

//	// Outputs from ID stage
//	ID_EX_PACKET id_packet;

//	// Outputs from ID/EX Pipeline Register
//	ID_EX_PACKET id_ex_packet;
	
//	// Outputs from EX-Stage
//	EX_MEM_PACKET ex_packet;
//	// Outputs from EX/MEM Pipeline Register
//	EX_MEM_PACKET ex_mem_packet;

//	// Outputs from MEM-Stage
//	logic [`XLEN-1:0] mem_result_out;
//	logic [`XLEN-1:0] proc2Dmem_addr;
//	logic [`XLEN-1:0] proc2Dmem_data;
//	logic [1:0]  proc2Dmem_command;
//	MEM_SIZE proc2Dmem_size;

//	// Outputs from MEM/WB Pipeline Register
//	logic        mem_wb_halt;
//	logic        mem_wb_illegal;
//	logic  [4:0] mem_wb_dest_reg_idx;
//	logic [`XLEN-1:0] mem_wb_result;
//	logic        mem_wb_take_branch;
	
//	// Outputs from WB-Stage  (These loop back to the register file in ID)
//	logic [`XLEN-1:0] wb_reg_wr_data_out;
//	logic  [4:0] wb_reg_wr_idx_out;
//	logic        wb_reg_wr_en_out;
	
//	assign pipeline_completed_insts = {3'b0, mem_wb_valid_inst};
//	assign pipeline_error_status =  mem_wb_illegal             ? ILLEGAL_INST :
//	                                mem_wb_halt                ? HALTED_ON_WFI :
//	                                (mem2proc_response==4'h0)  ? LOAD_ACCESS_FAULT :
//	                                NO_ERROR;
	
//	assign pipeline_commit_wr_idx = wb_reg_wr_idx_out;
//	assign pipeline_commit_wr_data = wb_reg_wr_data_out;
//	assign pipeline_commit_wr_en = wb_reg_wr_en_out;
//	assign pipeline_commit_NPC = mem_wb_NPC;
	
//	assign proc2mem_command =
//	     (proc2Dmem_command == BUS_NONE) ? BUS_LOAD : proc2Dmem_command;
//	assign proc2mem_addr =
//	     (proc2Dmem_command == BUS_NONE) ? proc2Imem_addr : proc2Dmem_addr;
//	//if it's an instruction, then load a double word (64 bits)
//	assign proc2mem_size =
//	     (proc2Dmem_command == BUS_NONE) ? DOUBLE : proc2Dmem_size;
//	assign proc2mem_data = {32'b0, proc2Dmem_data};

////////////////////////////////////////////////////
////                                              //
////                  IF-Stage                    //
////                                              //
////////////////////////////////////////////////////

//	//these are debug signals that are now included in the packet,
//	//breaking them out to support the legacy debug modes
//	assign if_NPC_out        = if_packet.NPC;
//	assign if_IR_out         = if_packet.inst;
//	assign if_valid_inst_out = if_packet.valid;
	
//	if_stage if_stage_0 (
//		// Inputs
//		.clock (clock),
//		.reset (reset),
//		.mem_wb_valid_inst(mem_wb_valid_inst),
//		.ex_mem_take_branch(ex_mem_packet.take_branch),
//		.ex_mem_target_pc(ex_mem_packet.alu_result),
//		.Imem2proc_data(mem2proc_data),
		
//		// Outputs
//		.proc2Imem_addr(proc2Imem_addr),
//		.if_packet_out(if_packet)
//	);


////////////////////////////////////////////////////
////                                              //
////            IF/ID Pipeline Register           //
////                                              //
////////////////////////////////////////////////////

//	assign if_id_NPC        = if_id_packet.NPC;
//	assign if_id_IR         = if_id_packet.inst;
//	assign if_id_valid_inst = if_id_packet.valid;
//	assign if_id_enable = 1'b1; // always enabled
//	// synopsys sync_set_reset "reset"
//	always_ff @(posedge clock) begin
//		if (reset) begin 
//			if_id_packet.inst  <= `SD `NOP;
//			if_id_packet.valid <= `SD `FALSE;
//            if_id_packet.NPC   <= `SD 0;
//            if_id_packet.PC    <= `SD 0;
//		end else begin// if (reset)
//			if (if_id_enable) begin
//				if_id_packet <= `SD if_packet; 
//			end // if (if_id_enable)	
//		end
//	end // always

   
////////////////////////////////////////////////////
////                                              //
////                  ID-Stage                    //
////                                              //
////////////////////////////////////////////////////
	
//	id_stage id_stage_0 (// Inputs
//		.clock(clock),
//		.reset(reset),
//		.if_id_packet_in(if_id_packet),
//		.wb_reg_wr_en_out   (wb_reg_wr_en_out),
//		.wb_reg_wr_idx_out  (wb_reg_wr_idx_out),
//		.wb_reg_wr_data_out (wb_reg_wr_data_out),
		
//		// Outputs
//		.id_packet_out(id_packet)
//	);


////////////////////////////////////////////////////
////                                              //
////            ID/EX Pipeline Register           //
////                                              //
////////////////////////////////////////////////////

//	assign id_ex_NPC        = id_ex_packet.NPC;
//	assign id_ex_IR         = id_ex_packet.inst;
//	assign id_ex_valid_inst = id_ex_packet.valid;

//	assign id_ex_enable = 1'b1; // always enabled
//	// synopsys sync_set_reset "reset"
//	always_ff @(posedge clock) begin
//		if (reset) begin
//			id_ex_packet <= `SD '{{`XLEN{1'b0}},
//				{`XLEN{1'b0}}, 
//				{`XLEN{1'b0}}, 
//				{`XLEN{1'b0}}, 
//				OPA_IS_RS1, 
//				OPB_IS_RS2, 
//				`NOP,
//				`ZERO_REG,
//				ALU_ADD, 
//				1'b0, //rd_mem
//				1'b0, //wr_mem
//				1'b0, //cond
//				1'b0, //uncond
//				1'b0, //halt
//				1'b0, //illegal
//				1'b0, //csr_op
//				1'b0 //valid
//			}; 
//		end else begin // if (reset)
//			if (id_ex_enable) begin
//				id_ex_packet <= `SD id_packet;
//			end // if
//		end // else: !if(reset)
//	end // always


////////////////////////////////////////////////////
////                                              //
////                  EX-Stage                    //
////                                              //
////////////////////////////////////////////////////
//	ex_stage ex_stage_0 (
//		// Inputs
//		.clock(clock),
//		.reset(reset),
//		.id_ex_packet_in(id_ex_packet),
//		// Outputs
//		.ex_packet_out(ex_packet)
//	);


////////////////////////////////////////////////////
////                                              //
////           EX/MEM Pipeline Register           //
////                                              //
////////////////////////////////////////////////////
	
//	assign ex_mem_NPC        = ex_mem_packet.NPC;
//	assign ex_mem_valid_inst = ex_mem_packet.valid;

//	assign ex_mem_enable = 1'b1; // always enabled
//	// synopsys sync_set_reset "reset"
//	always_ff @(posedge clock) begin
//		if (reset) begin
//			ex_mem_IR     <= `SD `NOP;
//			ex_mem_packet <= `SD 0;
//		end else begin
//			if (ex_mem_enable)   begin
//				// these are forwarded directly from ID/EX registers, only for debugging purposes
//				ex_mem_IR     <= `SD id_ex_IR;
//				// EX outputs
//				ex_mem_packet <= `SD ex_packet;
//			end // if
//		end // else: !if(reset)
//	end // always

   
////////////////////////////////////////////////////
////                                              //
////                 MEM-Stage                    //
////                                              //
////////////////////////////////////////////////////
//	mem_stage mem_stage_0 (// Inputs
//		.clock(clock),
//		.reset(reset),
//		.ex_mem_packet_in(ex_mem_packet),
//		.Dmem2proc_data(mem2proc_data[`XLEN-1:0]),
		
//		// Outputs
//		.mem_result_out(mem_result_out),
//		.proc2Dmem_command(proc2Dmem_command),
//		.proc2Dmem_size(proc2Dmem_size),
//		.proc2Dmem_addr(proc2Dmem_addr),
//		.proc2Dmem_data(proc2Dmem_data)
//	);


////////////////////////////////////////////////////
////                                              //
////           MEM/WB Pipeline Register           //
////                                              //
////////////////////////////////////////////////////
//	assign mem_wb_enable = 1'b1; // always enabled
//	// synopsys sync_set_reset "reset"
//	always_ff @(posedge clock) begin
//		if (reset) begin
//			mem_wb_NPC          <= `SD 0;
//			mem_wb_IR           <= `SD `NOP;
//			mem_wb_halt         <= `SD 0;
//			mem_wb_illegal      <= `SD 0;
//			mem_wb_valid_inst   <= `SD 0;
//			mem_wb_dest_reg_idx <= `SD `ZERO_REG;
//			mem_wb_take_branch  <= `SD 0;
//			mem_wb_result       <= `SD 0;
//		end else begin
//			if (mem_wb_enable) begin
//				// these are forwarded directly from EX/MEM latches
//				mem_wb_NPC          <= `SD ex_mem_packet.NPC;
//				mem_wb_IR           <= `SD ex_mem_IR;
//				mem_wb_halt         <= `SD ex_mem_packet.halt;
//				mem_wb_illegal      <= `SD ex_mem_packet.illegal;
//				mem_wb_valid_inst   <= `SD ex_mem_packet.valid;
//				mem_wb_dest_reg_idx <= `SD ex_mem_packet.dest_reg_idx;
//				mem_wb_take_branch  <= `SD ex_mem_packet.take_branch;
//				// these are results of MEM stage
//				mem_wb_result       <= `SD mem_result_out;
//			end // if
//		end // else: !if(reset)
//	end // always


////////////////////////////////////////////////////
////                                              //
////                  WB-Stage                    //
////                                              //
////////////////////////////////////////////////////
//	wb_stage wb_stage_0 (
//		// Inputs
//		.clock(clock),
//		.reset(reset),
//		.mem_wb_NPC(mem_wb_NPC),
//		.mem_wb_result(mem_wb_result),
//		.mem_wb_dest_reg_idx(mem_wb_dest_reg_idx),
//		.mem_wb_take_branch(mem_wb_take_branch),
//		.mem_wb_valid_inst(mem_wb_valid_inst),
		
//		// Outputs
//		.reg_wr_data_out(wb_reg_wr_data_out),
//		.reg_wr_idx_out(wb_reg_wr_idx_out),
//		.reg_wr_en_out(wb_reg_wr_en_out)
//	);

//endmodule  // module verisimple
`endif // __PIPELINE_V__
