/////////////////////////////////////////////////////////////////////////
//                                                                     //
//   Modulename :  id_stage.v                                          //
//                                                                     //
//  Description :  instruction decode (ID) stage of the pipeline;      // 
//                 decode the instruction fetch register operands, and // 
//                 compute immediate operand (if applicable)           // 
//                                                                     //
/////////////////////////////////////////////////////////////////////////


`timescale 1ns/100ps

`include "sys_defs.svh"


//  // Decode an instruction: given instruction bits IR produce the
//  // appropriate datapath control signals.
//  //
//  // This is a *combinational* module (basically a PLA).
//  //
//module decoder(

//	//input [31:0] inst,
//	//input valid_inst_in,  // ignore inst when low, outputs will
//	                      // reflect noop (except valid_inst)
//	//see sys_defs.svh for definition
//	input IF_ID_PACKET if_packet,
	
//	output ALU_OPA_SELECT opa_select,
//	output ALU_OPB_SELECT opb_select,
//	output DEST_REG_SEL   dest_reg, // mux selects
//	output ALU_FUNC       alu_func,
//	output logic rd_mem, wr_mem, cond_branch, uncond_branch,
//	output logic csr_op,    // used for CSR operations, we only used this as 
//	                        //a cheap way to get the return code out
//	output logic halt,      // non-zero on a halt
//	output logic illegal,    // non-zero on an illegal instruction
//	output logic valid_inst  // for counting valid instructions executed
//	                        // and for making the fetch stage die on halts/
//	                        // keeping track of when to allow the next
//	                        // instruction out of fetch
//	                        // 0 for HALT and illegal instructions (die on halt)

//);

//	INST inst;
//	logic valid_inst_in;
	
//	assign inst          = if_packet.inst;
//	assign valid_inst_in = if_packet.valid;
//	assign valid_inst    = valid_inst_in & ~illegal;
	
//	always_comb begin
//		// default control values:
//		// - valid instructions must override these defaults as necessary.
//		//	 opa_select, opb_select, and alu_func should be set explicitly.
//		// - invalid instructions should clear valid_inst.
//		// - These defaults are equivalent to a noop
//		// * see sys_defs.vh for the constants used here
//		opa_select = OPA_IS_RS1;
//		opb_select = OPB_IS_RS2;
//		alu_func = ALU_ADD;
//		dest_reg = DEST_NONE;
//		csr_op = `FALSE;
//		rd_mem = `FALSE;
//		wr_mem = `FALSE;
//		cond_branch = `FALSE;
//		uncond_branch = `FALSE;
//		halt = `FALSE;
//		illegal = `FALSE;
//		if(valid_inst_in) begin
//			casez (inst) 
//				`RV32_LUI: begin
//					dest_reg   = DEST_RD;
//					opa_select = OPA_IS_ZERO;
//					opb_select = OPB_IS_U_IMM;
//				end
//				`RV32_AUIPC: begin
//					dest_reg   = DEST_RD;
//					opa_select = OPA_IS_PC;
//					opb_select = OPB_IS_U_IMM;
//				end
//				`RV32_JAL: begin
//					dest_reg      = DEST_RD;
//					opa_select    = OPA_IS_PC;
//					opb_select    = OPB_IS_J_IMM;
//					uncond_branch = `TRUE;
//				end
//				`RV32_JALR: begin
//					dest_reg      = DEST_RD;
//					opa_select    = OPA_IS_RS1;
//					opb_select    = OPB_IS_I_IMM;
//					uncond_branch = `TRUE;
//				end
//				`RV32_BEQ, `RV32_BNE, `RV32_BLT, `RV32_BGE,
//				`RV32_BLTU, `RV32_BGEU: begin
//					opa_select  = OPA_IS_PC;
//					opb_select  = OPB_IS_B_IMM;
//					cond_branch = `TRUE;
//				end
//				`RV32_LB, `RV32_LH, `RV32_LW,
//				`RV32_LBU, `RV32_LHU: begin
//					dest_reg   = DEST_RD;
//					opb_select = OPB_IS_I_IMM;
//					rd_mem     = `TRUE;
//				end
//				`RV32_SB, `RV32_SH, `RV32_SW: begin
//					opb_select = OPB_IS_S_IMM;
//					wr_mem     = `TRUE;
//				end
//				`RV32_ADDI: begin
//					dest_reg   = DEST_RD;
//					opb_select = OPB_IS_I_IMM;
//				end
//				`RV32_SLTI: begin
//					dest_reg   = DEST_RD;
//					opb_select = OPB_IS_I_IMM;
//					alu_func   = ALU_SLT;
//				end
//				`RV32_SLTIU: begin
//					dest_reg   = DEST_RD;
//					opb_select = OPB_IS_I_IMM;
//					alu_func   = ALU_SLTU;
//				end
//				`RV32_ANDI: begin
//					dest_reg   = DEST_RD;
//					opb_select = OPB_IS_I_IMM;
//					alu_func   = ALU_AND;
//				end
//				`RV32_ORI: begin
//					dest_reg   = DEST_RD;
//					opb_select = OPB_IS_I_IMM;
//					alu_func   = ALU_OR;
//				end
//				`RV32_XORI: begin
//					dest_reg   = DEST_RD;
//					opb_select = OPB_IS_I_IMM;
//					alu_func   = ALU_XOR;
//				end
//				`RV32_SLLI: begin
//					dest_reg   = DEST_RD;
//					opb_select = OPB_IS_I_IMM;
//					alu_func   = ALU_SLL;
//				end
//				`RV32_SRLI: begin
//					dest_reg   = DEST_RD;
//					opb_select = OPB_IS_I_IMM;
//					alu_func   = ALU_SRL;
//				end
//				`RV32_SRAI: begin
//					dest_reg   = DEST_RD;
//					opb_select = OPB_IS_I_IMM;
//					alu_func   = ALU_SRA;
//				end
//				`RV32_ADD: begin
//					dest_reg   = DEST_RD;
//				end
//				`RV32_SUB: begin
//					dest_reg   = DEST_RD;
//					alu_func   = ALU_SUB;
//				end
//				`RV32_SLT: begin
//					dest_reg   = DEST_RD;
//					alu_func   = ALU_SLT;
//				end
//				`RV32_SLTU: begin
//					dest_reg   = DEST_RD;
//					alu_func   = ALU_SLTU;
//				end
//				`RV32_AND: begin
//					dest_reg   = DEST_RD;
//					alu_func   = ALU_AND;
//				end
//				`RV32_OR: begin
//					dest_reg   = DEST_RD;
//					alu_func   = ALU_OR;
//				end
//				`RV32_XOR: begin
//					dest_reg   = DEST_RD;
//					alu_func   = ALU_XOR;
//				end
//				`RV32_SLL: begin
//					dest_reg   = DEST_RD;
//					alu_func   = ALU_SLL;
//				end
//				`RV32_SRL: begin
//					dest_reg   = DEST_RD;
//					alu_func   = ALU_SRL;
//				end
//				`RV32_SRA: begin
//					dest_reg   = DEST_RD;
//					alu_func   = ALU_SRA;
//				end
//				`RV32_MUL: begin
//					dest_reg   = DEST_RD;
//					alu_func   = ALU_MUL;
//				end
//				`RV32_MULH: begin
//					dest_reg   = DEST_RD;
//					alu_func   = ALU_MULH;
//				end
//				`RV32_MULHSU: begin
//					dest_reg   = DEST_RD;
//					alu_func   = ALU_MULHSU;
//				end
//				`RV32_MULHU: begin
//					dest_reg   = DEST_RD;
//					alu_func   = ALU_MULHU;
//				end
//				`RV32_CSRRW, `RV32_CSRRS, `RV32_CSRRC: begin
//					csr_op = `TRUE;
//				end
//				`WFI: begin
//					halt = `TRUE;
//				end
//				default: illegal = `TRUE;

//		endcase // casez (inst)
//		end // if(valid_inst_in)
//	end // always
//endmodule // decoder


module id_stage (
    input  logic          clk, rst,

    // ---- IF/ID input ----
    input  IF_ID_PACKET   if_id_in,

    // ---- scoreboard feedback ----
    output logic          issue_valid [`ISSUE_WIDTH-1:0],
    output logic [4:0]    issue_rs1   [`ISSUE_WIDTH-1:0],
    output logic [4:0]    issue_rs2   [`ISSUE_WIDTH-1:0],

    // ---- regfile interface ----
    output logic [4:0]    rf_rs1_idx  [`ISSUE_WIDTH-1:0],
    output logic [4:0]    rf_rs2_idx  [`ISSUE_WIDTH-1:0],
    input  XLEN_t         rf_rs1_val  [`ISSUE_WIDTH-1:0],
    input  XLEN_t         rf_rs2_val  [`ISSUE_WIDTH-1:0],

    // ---- ID/EX output ----
    output ID_EX_PACKET   id_ex_out
);

    //----------------------------------------------------------
    // 1) Per-lane decode
    //----------------------------------------------------------
    genvar w;
    generate for (w = 0; w < `ISSUE_WIDTH; w++) begin : G_DEC

        // ---- Register index extraction (always needed) ----
        assign rf_rs1_idx[w] = if_id_in.inst[w][19:15];
        assign rf_rs2_idx[w] = if_id_in.inst[w][24:20];
        assign id_ex_out.dest_reg_idx[w] = if_id_in.inst[w][11:7];

        // ---- Pass read values straight through ----
        assign id_ex_out.rs1_value[w] = rf_rs1_val[w];
        assign id_ex_out.rs2_value[w] = rf_rs2_val[w];

        // ---- Decoder instance ----
        decoder u_dec (
            .inst           (if_id_in.inst[w]),
            .valid_inst_in  (if_id_in.valid[w]),
            .opa_select     (id_ex_out.opa_select[w]),
            .opb_select     (id_ex_out.opb_select[w]),
            .dest_reg       (/* unused here */),
            .alu_func       (/* unused here */),
            .rd_mem         (id_ex_out.rd_mem[w]),
            .wr_mem         (id_ex_out.wr_mem[w]),
            .cond_branch    (),
            .uncond_branch  (),
            .csr_op         (id_ex_out.csr_op[w]),
            .halt           (id_ex_out.halt[w]),
            .illegal        (id_ex_out.illegal[w]),
            .valid_inst     ()
        );

        // ---- Other simple fields ----
        assign id_ex_out.mem_size[w] = 3'd0; // change if you add byte/half ops

        // ---- NPC / PC passthrough ----
        assign id_ex_out.NPC[w] = if_id_in.NPC[w];
        assign id_ex_out.PC [w] = if_id_in.PC [w];

        // ---- Lane-local valid (no intra-group squashes yet) ----
        assign id_ex_out.valid[w] = if_id_in.valid[w];
        assign issue_valid[w]     = id_ex_out.valid[w];
        assign issue_rs1  [w]     = rf_rs1_idx[w];
        assign issue_rs2  [w]     = rf_rs2_idx[w];
    end endgenerate

    //----------------------------------------------------------
    // 2) Simple intra-group RAW/WAW kill (optional)
    //----------------------------------------------------------
    logic [`ISSUE_WIDTH-1:0] kill;
    integer i, j;
    always_comb begin
        kill = '0;
        for (i = 1; i < `ISSUE_WIDTH; i++) begin
            for (j = 0; j < i; j++) begin
                if ( id_ex_out.valid[i] &&
                     ( (rf_rs1_idx[i] == id_ex_out.dest_reg_idx[j] && id_ex_out.dest_reg_idx[j] != 0) ||
                       (rf_rs2_idx[i] == id_ex_out.dest_reg_idx[j] && id_ex_out.dest_reg_idx[j] != 0) ||
                       (id_ex_out.dest_reg_idx[i] == id_ex_out.dest_reg_idx[j] && id_ex_out.dest_reg_idx[i] != 0) ) )
                    kill[i] = 1'b1;
            end
        end
    end

    // apply kill mask
    generate for (w = 0; w < `ISSUE_WIDTH; w++) begin : G_KILL
        always_comb begin
            if (kill[w]) begin
                id_ex_out.valid[w]   = 1'b0;
                issue_valid   [w]    = 1'b0;
            end
        end
    end endgenerate
endmodule

//module id_stage(         
//	input         clock,              // system clock
//	input         reset,              // system reset
//	input         wb_reg_wr_en_out,    // Reg write enable from WB Stage
//	input  [4:0] wb_reg_wr_idx_out,  // Reg write index from WB Stage
//	input  [`XLEN-1:0] wb_reg_wr_data_out,  // Reg write data from WB Stage
//	input  IF_ID_PACKET if_id_packet_in,
	
//	output ID_EX_PACKET id_packet_out
//);

//    assign id_packet_out.inst = if_id_packet_in.inst;
//    assign id_packet_out.NPC  = if_id_packet_in.NPC;
//    assign id_packet_out.PC   = if_id_packet_in.PC;
//	DEST_REG_SEL dest_reg_select; 

//	// Instantiate the register file used by this pipeline
//	regfile regf_0 (
//		.rda_idx(if_id_packet_in.inst.r.rs1),
//		.rda_out(id_packet_out.rs1_value), 

//		.rdb_idx(if_id_packet_in.inst.r.rs2),
//		.rdb_out(id_packet_out.rs2_value),

//		.wr_clk(clock),
//		.wr_en(wb_reg_wr_en_out),
//		.wr_idx(wb_reg_wr_idx_out),
//		.wr_data(wb_reg_wr_data_out)
//	);

//	// instantiate the instruction decoder
//	decoder decoder_0 (
//		.if_packet(if_id_packet_in),	 
//		// Outputs
//		.opa_select(id_packet_out.opa_select),
//		.opb_select(id_packet_out.opb_select),
//		.alu_func(id_packet_out.alu_func),
//		.dest_reg(dest_reg_select),
//		.rd_mem(id_packet_out.rd_mem),
//		.wr_mem(id_packet_out.wr_mem),
//		.cond_branch(id_packet_out.cond_branch),
//		.uncond_branch(id_packet_out.uncond_branch),
//		.csr_op(id_packet_out.csr_op),
//		.halt(id_packet_out.halt),
//		.illegal(id_packet_out.illegal),
//		.valid_inst(id_packet_out.valid)
//	);

//	// mux to generate dest_reg_idx based on
//	// the dest_reg_select output from decoder
//	always_comb begin
//		case (dest_reg_select)
//			DEST_RD:    id_packet_out.dest_reg_idx = if_id_packet_in.inst.r.rd;
//			DEST_NONE:  id_packet_out.dest_reg_idx = `ZERO_REG;
//			default:    id_packet_out.dest_reg_idx = `ZERO_REG; 
//		endcase
//	end
   
//endmodule // module id_stage
