//////////////////////////////////////////////////////////////////////////
//                                                                      //
//   Modulename :  ex_stage.v                                           //
//                                                                      //
//  Description :  instruction execute (EX) stage of the pipeline;      //
//                 given the instruction command code CMD, select the   //
//                 proper input A and B for the ALU, compute the result,// 
//                 and compute the condition for branches, and pass all //
//                 the results down the pipeline. MWB                   // 
//                                                                      //
//                                                                      //
//////////////////////////////////////////////////////////////////////////
`ifndef __EX_STAGE_WITH_BRANCH_PREDICTION_V__
`define __EX_STAGE_WITH_BRANCH_PREDICTION_V__

`timescale 1ns/100ps

`include "sys_defs.svh"

//
// The ALU
//
// given the command code CMD and proper operands A and B, compute the
// result of the instruction
//
// This module is purely combinational
//
module alu(
	input [`XLEN-1:0] opa,
	input [`XLEN-1:0] opb,
	ALU_FUNC     func,

	output logic [`XLEN-1:0] result
);
	wire signed [`XLEN-1:0] signed_opa, signed_opb;
	wire signed [2*`XLEN-1:0] signed_mul, mixed_mul;
	wire        [2*`XLEN-1:0] unsigned_mul;
	assign signed_opa = opa;
	assign signed_opb = opb;
	assign signed_mul = signed_opa * signed_opb;
	assign unsigned_mul = opa * opb;
	assign mixed_mul = signed_opa * opb;

	always_comb begin
		case (func)
			ALU_ADD:      result = opa + opb;
			ALU_SUB:      result = opa - opb;
			ALU_AND:      result = opa & opb;
			ALU_SLT:      result = signed_opa < signed_opb;
			ALU_SLTU:     result = opa < opb;
			ALU_OR:       result = opa | opb;
			ALU_XOR:      result = opa ^ opb;
			ALU_SRL:      result = opa >> opb[4:0];
			ALU_SLL:      result = opa << opb[4:0];
			ALU_SRA:      result = signed_opa >>> opb[4:0]; // arithmetic from logical shift
			ALU_MUL:      result = signed_mul[`XLEN-1:0];
			ALU_MULH:     result = signed_mul[2*`XLEN-1:`XLEN];
			ALU_MULHSU:   result = mixed_mul[2*`XLEN-1:`XLEN];
			ALU_MULHU:    result = unsigned_mul[2*`XLEN-1:`XLEN];

			default:      result = `XLEN'hfacebeec;  // here to prevent latches
		endcase
	end
endmodule // alu

//
// BrCond module
//
// Given the instruction code, compute the proper condition for the
// instruction; for branches this condition will indicate whether the
// target is taken.
//
// This module is purely combinational
//
module brcond(// Inputs
	input [`XLEN-1:0] rs1,    // Value to check against condition
	input [`XLEN-1:0] rs2,
	input  [2:0] func,  // Specifies which condition to check

	output logic cond    // 0/1 condition result (False/True)
);

	logic signed [`XLEN-1:0] signed_rs1, signed_rs2;
	assign signed_rs1 = rs1;
	assign signed_rs2 = rs2;
	always_comb begin
		cond = 0;
		case (func)
			3'b000: cond = signed_rs1 == signed_rs2;  // BEQ
			3'b001: cond = signed_rs1 != signed_rs2;  // BNE
			3'b100: cond = signed_rs1 < signed_rs2;   // BLT
			3'b101: cond = signed_rs1 >= signed_rs2;  // BGE
			3'b110: cond = rs1 < rs2;                 // BLTU
			3'b111: cond = rs1 >= rs2;                // BGEU
		endcase
	end
	
endmodule // brcond


module ex_stage_with_branch_prediction
(
    input  logic          clk, rst,

    // ---- ID/EX input ----
    input  ID_EX_PACKET   id_ex_in,

    // ---- EX/MEM output ----
    output EX_MEM_PACKET  ex_mem_out,

    // ---- branch feedback ----
    output logic          branch_taken,
    output XLEN_t         branch_target,

    // ---- Forwarding inputs ----
    input  logic [1:0]    forwardA_stage [`ISSUE_WIDTH-1:0],
    input  logic [$clog2(`ISSUE_WIDTH)-1:0] forwardA_slot [`ISSUE_WIDTH-1:0],
    input  logic [1:0]    forwardB_stage [`ISSUE_WIDTH-1:0],
    input  logic [$clog2(`ISSUE_WIDTH)-1:0] forwardB_slot [`ISSUE_WIDTH-1:0],
    input  EX_MEM_PACKET  ex_mem_forward,   // Forwarding data from EX/MEM
    input  MEM_WB_PACKET  mem_wb_forward,   // Forwarding data from MEM/WB

    // ---- Branch Predictor Interface ----
    output logic          bp_update,        // Predictor update trigger
    output logic          bp_actual_taken,  // Actual branch outcome
    output XLEN_t         bp_actual_target, // Actual target address
    output XLEN_t         bp_inst_pc        // PC of branch instruction
);

    // Internal signals for each way
    genvar w;
    generate
        for (w = 0; w < `ISSUE_WIDTH; w++) begin : G_EX_STAGE
            logic [`XLEN-1:0] opa_mux_out, opb_mux_out;
            logic brcond_result;
            logic take_branch;
            logic is_jalr;
            logic [`XLEN-1:0] branch_target_internal;
            logic [`XLEN-1:0] rs1_value_forwarded, rs2_value_forwarded;
            
            // Handle forwarding for rs1 and rs2 values
            always_comb begin
                // Default to original value
                rs1_value_forwarded = id_ex_in.rs1_value[w];
                rs2_value_forwarded = id_ex_in.rs2_value[w];
                
                // Forwarding logic for rs1
                case (forwardA_stage[w])
                    2'b01: rs1_value_forwarded = ex_mem_forward.alu_result[forwardA_slot[w]];  // EX/MEM forward
                    2'b10: rs1_value_forwarded = mem_wb_forward.wb_data[forwardA_slot[w]];     // MEM/WB forward
                    default: ; // No forwarding
                endcase
                
                // Forwarding logic for rs2
                case (forwardB_stage[w])
                    2'b01: rs2_value_forwarded = ex_mem_forward.alu_result[forwardB_slot[w]];  // EX/MEM forward
                    2'b10: rs2_value_forwarded = mem_wb_forward.wb_data[forwardB_slot[w]];     // MEM/WB forward
                    default: ; // No forwarding
                endcase
            end

            // JALR detection using opcode field
            assign is_jalr = (id_ex_in.inst[w][6:0] == `RV32_JALR_OP);

            // OPA Mux
            always_comb begin
                opa_mux_out = `XLEN'hdeadfbac;  // Default for simulation debug
                case (id_ex_in.opa_select[w])
                    OPA_IS_RS1:  opa_mux_out = rs1_value_forwarded;
                    OPA_IS_NPC:  opa_mux_out = id_ex_in.NPC[w];
                    OPA_IS_PC:   opa_mux_out = id_ex_in.PC[w];
                    OPA_IS_ZERO: opa_mux_out = 0;
                endcase
            end

            // OPB Mux
            always_comb begin
                opb_mux_out = `XLEN'hfacefeed;  // Default for simulation debug
                case (id_ex_in.opb_select[w])
                    OPB_IS_RS2:   opb_mux_out = rs2_value_forwarded;
                    OPB_IS_I_IMM: opb_mux_out = `RV32_signext_Iimm(id_ex_in.inst[w]);
                    OPB_IS_S_IMM: opb_mux_out = `RV32_signext_Simm(id_ex_in.inst[w]);
                    OPB_IS_B_IMM: opb_mux_out = `RV32_signext_Bimm(id_ex_in.inst[w]);
                    OPB_IS_U_IMM: opb_mux_out = `RV32_signext_Uimm(id_ex_in.inst[w]);
                    OPB_IS_J_IMM: opb_mux_out = `RV32_signext_Jimm(id_ex_in.inst[w]);
                endcase
            end

            // ALU instantiation
            alu alu_inst (
                .opa(opa_mux_out),
                .opb(opb_mux_out),
                .func(id_ex_in.alu_func[w]),
                .result(ex_mem_out.alu_result[w])
            );

            // Branch condition checker
            brcond brcond_inst (
                .rs1(id_ex_in.rs1_value[w]),  
                .rs2(id_ex_in.rs2_value[w]),  
                .func(id_ex_in.inst[w].b.funct3),
                .cond(brcond_result)
            );

            // Take branch signal
            assign take_branch = id_ex_in.uncond_branch[w] | 
                                (id_ex_in.cond_branch[w] & brcond_result);
            assign ex_mem_out.take_branch[w] = take_branch;

            // Calculate branch target (with JALR handling)
            assign branch_target_internal = 
                is_jalr ? {ex_mem_out.alu_result[w][`XLEN-1:1], 1'b0} :
                id_ex_in.PC[w] + `RV32_signext_Bimm(id_ex_in.inst[w]);

            // Pass-through signals
            assign ex_mem_out.NPC[w]           = id_ex_in.NPC[w];
            assign ex_mem_out.rs2_value[w]     = id_ex_in.rs2_value[w];
            assign ex_mem_out.rd_mem[w]        = id_ex_in.rd_mem[w];
            assign ex_mem_out.wr_mem[w]        = id_ex_in.wr_mem[w];
            assign ex_mem_out.dest_reg_idx[w]  = id_ex_in.dest_reg_idx[w];
            assign ex_mem_out.mem_size[w]      = id_ex_in.inst[w].r.funct3; // From instruction
            assign ex_mem_out.halt[w]          = id_ex_in.halt[w];
            assign ex_mem_out.illegal[w]       = id_ex_in.illegal[w];
            assign ex_mem_out.csr_op[w]        = id_ex_in.csr_op[w];
            assign ex_mem_out.valid[w]         = id_ex_in.valid[w];  // FIXME: squash instr after branch taken
        end
    endgenerate

    // Branch feedback and predictor update logic
    logic found_target;
    always_comb begin
        branch_taken = 1'b0;
        branch_target = `XLEN'h0;
        bp_update = 1'b0;
        bp_actual_taken = 1'b0;
        bp_actual_target = `XLEN'h0;
        bp_inst_pc = `XLEN'h0;
        found_target = 1'b0;
        
        // Process instructions in-order, stopping at first branch
        for (int w = 0; w < `ISSUE_WIDTH; w++) begin
            if (!found_target && id_ex_in.valid[w] && 
               (id_ex_in.cond_branch[w] || id_ex_in.uncond_branch[w])) begin
                
                branch_taken = ex_mem_out.take_branch[w];
                branch_target = (id_ex_in.inst[w][6:0] == `RV32_JALR_OP) ? 
                              {ex_mem_out.alu_result[w][`XLEN-1:1], 1'b0} :
                              id_ex_in.PC[w] + `RV32_signext_Bimm(id_ex_in.inst[w]);

                // Predictor update signals
                bp_update = 1'b1;
                bp_actual_taken = branch_taken;
                bp_actual_target = branch_target;
                bp_inst_pc = id_ex_in.PC[w];
                
                found_target = 1'b1;
            end
        end
    end
endmodule

//module ex_stage(
//	input clock,               // system clock
//	input reset,               // system reset
//	input ID_EX_PACKET   id_ex_packet_in,
//	output EX_MEM_PACKET ex_packet_out
//);
//	// Pass-throughs
//	assign ex_packet_out.NPC = id_ex_packet_in.NPC;
//	assign ex_packet_out.rs2_value = id_ex_packet_in.rs2_value;
//	assign ex_packet_out.rd_mem = id_ex_packet_in.rd_mem;
//	assign ex_packet_out.wr_mem = id_ex_packet_in.wr_mem;
//	assign ex_packet_out.dest_reg_idx = id_ex_packet_in.dest_reg_idx;
//	assign ex_packet_out.halt = id_ex_packet_in.halt;
//	assign ex_packet_out.illegal = id_ex_packet_in.illegal;
//	assign ex_packet_out.csr_op = id_ex_packet_in.csr_op;
//	assign ex_packet_out.valid = id_ex_packet_in.valid;
//	assign ex_packet_out.mem_size = id_ex_packet_in.inst.r.funct3;

//	logic [`XLEN-1:0] opa_mux_out, opb_mux_out;
//	logic brcond_result;
//	//
//	// ALU opA mux
//	//
//	always_comb begin
//		opa_mux_out = `XLEN'hdeadfbac;
//		case (id_ex_packet_in.opa_select)
//			OPA_IS_RS1:  opa_mux_out = id_ex_packet_in.rs1_value;
//			OPA_IS_NPC:  opa_mux_out = id_ex_packet_in.NPC;
//			OPA_IS_PC:   opa_mux_out = id_ex_packet_in.PC;
//			OPA_IS_ZERO: opa_mux_out = 0;
//		endcase
//	end

//	 //
//	 // ALU opB mux
//	 //
//	always_comb begin
//		// Default value, Set only because the case isnt full.  If you see this
//		// value on the output of the mux you have an invalid opb_select
//		opb_mux_out = `XLEN'hfacefeed;
//		case (id_ex_packet_in.opb_select)
//			OPB_IS_RS2:   opb_mux_out = id_ex_packet_in.rs2_value;
//			OPB_IS_I_IMM: opb_mux_out = `RV32_signext_Iimm(id_ex_packet_in.inst);
//			OPB_IS_S_IMM: opb_mux_out = `RV32_signext_Simm(id_ex_packet_in.inst);
//			OPB_IS_B_IMM: opb_mux_out = `RV32_signext_Bimm(id_ex_packet_in.inst);
//			OPB_IS_U_IMM: opb_mux_out = `RV32_signext_Uimm(id_ex_packet_in.inst);
//			OPB_IS_J_IMM: opb_mux_out = `RV32_signext_Jimm(id_ex_packet_in.inst);
//		endcase 
//	end

//	//
//	// instantiate the ALU
//	//
//	alu alu_0 (// Inputs
//		.opa(opa_mux_out),
//		.opb(opb_mux_out),
//		.func(id_ex_packet_in.alu_func),

//		// Output
//		.result(ex_packet_out.alu_result)
//	);

//	 //
//	 // instantiate the branch condition tester
//	 //
//	brcond brcond (// Inputs
//		.rs1(id_ex_packet_in.rs1_value), 
//		.rs2(id_ex_packet_in.rs2_value),
//		.func(id_ex_packet_in.inst.b.funct3), // inst bits to determine check

//		// Output
//		.cond(brcond_result)
//	);

//	 // ultimate "take branch" signal:
//	 //	unconditional, or conditional and the condition is true
//	assign ex_packet_out.take_branch = id_ex_packet_in.uncond_branch
//		                          | (id_ex_packet_in.cond_branch & brcond_result);

//endmodule // module ex_stage
`endif // __EX_STAGE_V__
