`timescale 1ns/100ps

`include "sys_defs.svh"

//
// Decode an instruction: given instruction bits IR produce the
// appropriate datapath control signals.
//
// This is a *combinational* module (basically a PLA).
//
module decoder(
	input [31:0] inst,
	input valid_inst_in,  // ignore inst when low, outputs will
	                      // reflect noop (except valid_inst)
	
	output ALU_OPA_SELECT opa_select,
	output ALU_OPB_SELECT opb_select,
	output DEST_REG_SEL   dest_reg, // mux selects
	output ALU_FUNC       alu_func,
	output logic rd_mem, wr_mem, cond_branch, uncond_branch,
	output logic csr_op,      // used for CSR operations
	output logic halt,        // non-zero on a halt
	output logic illegal,     // non-zero on an illegal instruction
	output logic valid_inst   // for counting valid instructions executed
);

	always_comb begin
		// Default control values. These are equivalent to a noop.
		opa_select = OPA_IS_RS1;
		opb_select = OPB_IS_RS2;
		alu_func = ALU_ADD;
		dest_reg = DEST_NONE;
		csr_op = `FALSE;
		rd_mem = `FALSE;
		wr_mem = `FALSE;
		cond_branch = `FALSE;
		uncond_branch = `FALSE;
		halt = `FALSE;
		illegal = `FALSE;
        valid_inst = `FALSE; // Default to invalid

		if(valid_inst_in) begin
            valid_inst = `TRUE; // Assume valid if input is valid, override on illegal
			casez (inst) 
				`RV32_LUI: begin
					dest_reg   = DEST_RD;
					opa_select = OPA_IS_ZERO;
					opb_select = OPB_IS_U_IMM;
				end
				`RV32_AUIPC: begin
					dest_reg   = DEST_RD;
					opa_select = OPA_IS_PC;
					opb_select = OPB_IS_U_IMM;
				end
				`RV32_JAL: begin
					dest_reg      = DEST_RD;
					opa_select    = OPA_IS_PC;
					opb_select    = OPB_IS_J_IMM;
					uncond_branch = `TRUE;
				end
				`RV32_JALR: begin
					dest_reg      = DEST_RD;
					opa_select    = OPA_IS_RS1;
					opb_select    = OPB_IS_I_IMM;
					uncond_branch = `TRUE;
				end
				`RV32_BEQ, `RV32_BNE, `RV32_BLT, `RV32_BGE,
				`RV32_BLTU, `RV32_BGEU: begin
					opa_select  = OPA_IS_PC;
					opb_select  = OPB_IS_B_IMM;
					cond_branch = `TRUE;
				end
				`RV32_LB, `RV32_LH, `RV32_LW,
				`RV32_LBU, `RV32_LHU: begin
					dest_reg   = DEST_RD;
					opb_select = OPB_IS_I_IMM;
					rd_mem     = `TRUE;
				end
				`RV32_SB, `RV32_SH, `RV32_SW: begin
					opb_select = OPB_IS_S_IMM;
					wr_mem     = `TRUE;
				end
				`RV32_ADDI: begin
					dest_reg   = DEST_RD;
					opb_select = OPB_IS_I_IMM;
				end
				`RV32_SLTI: begin
					dest_reg   = DEST_RD;
					opb_select = OPB_IS_I_IMM;
					alu_func   = ALU_SLT;
				end
				`RV32_SLTIU: begin
					dest_reg   = DEST_RD;
					opb_select = OPB_IS_I_IMM;
					alu_func   = ALU_SLTU;
				end
				`RV32_ANDI: begin
					dest_reg   = DEST_RD;
					opb_select = OPB_IS_I_IMM;
					alu_func   = ALU_AND;
				end
				`RV32_ORI: begin
					dest_reg   = DEST_RD;
					opb_select = OPB_IS_I_IMM;
					alu_func   = ALU_OR;
				end
				`RV32_XORI: begin
					dest_reg   = DEST_RD;
					opb_select = OPB_IS_I_IMM;
					alu_func   = ALU_XOR;
				end
				`RV32_SLLI: begin
					dest_reg   = DEST_RD;
					opb_select = OPB_IS_I_IMM;
					alu_func   = ALU_SLL;
				end
				`RV32_SRLI: begin
					dest_reg   = DEST_RD;
					opb_select = OPB_IS_I_IMM;
					alu_func   = ALU_SRL;
				end
				`RV32_SRAI: begin
					dest_reg   = DEST_RD;
					opb_select = OPB_IS_I_IMM;
					alu_func   = ALU_SRA;
				end
				`RV32_ADD: begin
					dest_reg   = DEST_RD;
				end
				`RV32_SUB: begin
					dest_reg   = DEST_RD;
					alu_func   = ALU_SUB;
				end
				`RV32_SLT: begin
					dest_reg   = DEST_RD;
					alu_func   = ALU_SLT;
				end
				`RV32_SLTU: begin
					dest_reg   = DEST_RD;
					alu_func   = ALU_SLTU;
				end
				`RV32_AND: begin
					dest_reg   = DEST_RD;
					alu_func   = ALU_AND;
				end
				`RV32_OR: begin
					dest_reg   = DEST_RD;
					alu_func   = ALU_OR;
				end
				`RV32_XOR: begin
					dest_reg   = DEST_RD;
					alu_func   = ALU_XOR;
				end
				`RV32_SLL: begin
					dest_reg   = DEST_RD;
					alu_func   = ALU_SLL;
				end
				`RV32_SRL: begin
					dest_reg   = DEST_RD;
					alu_func   = ALU_SRL;
				end
				`RV32_SRA: begin
					dest_reg   = DEST_RD;
					alu_func   = ALU_SRA;
				end
				`RV32_MUL: begin
					dest_reg   = DEST_RD;
					alu_func   = ALU_MUL;
				end
				`RV32_MULH: begin
					dest_reg   = DEST_RD;
					alu_func   = ALU_MULH;
				end
				`RV32_MULHSU: begin
					dest_reg   = DEST_RD;
					alu_func   = ALU_MULHSU;
				end
				`RV32_MULHU: begin
					dest_reg   = DEST_RD;
					alu_func   = ALU_MULHU;
				end
				`RV32_CSRRW, `RV32_CSRRS, `RV32_CSRRC: begin
					csr_op = `TRUE;
				end
				`WFI: begin
					halt = `TRUE;
				end
				default: begin
                    illegal = `TRUE;
                    valid_inst = `FALSE; // Invalid instruction
                end
		    endcase
		end
	end
endmodule


module id_stage (
    input  logic              clk, rst,

    // ---- IF/ID input ----
    input  IF_ID_PACKET       if_id_in,

    // ---- scoreboard feedback ----
    output logic              issue_valid [`ISSUE_WIDTH-1:0],
    output logic [4:0]        issue_rs1   [`ISSUE_WIDTH-1:0],
    output logic [4:0]        issue_rs2   [`ISSUE_WIDTH-1:0],

    // ---- regfile interface ----
    output logic [4:0]        rf_rs1_idx  [`ISSUE_WIDTH-1:0],
    output logic [4:0]        rf_rs2_idx  [`ISSUE_WIDTH-1:0],
    input  XLEN_t             rf_rs1_val  [`ISSUE_WIDTH-1:0],
    input  XLEN_t             rf_rs2_val  [`ISSUE_WIDTH-1:0],

    // ---- ID/EX output ----
    output ID_EX_PACKET       id_ex_out
);

    //----------------------------------------------------------
    // Per-lane decode
    //----------------------------------------------------------
    genvar w;
    generate for (w = 0; w < `ISSUE_WIDTH; w++) begin : G_DEC
        
        logic is_valid_inst;
        DEST_REG_SEL dest_reg_select;

        // ---- Register index extraction ----
        assign rf_rs1_idx[w] = if_id_in.inst[w][19:15];
        assign rf_rs2_idx[w] = if_id_in.inst[w][24:20];

        // ---- Decoder instance ----
        decoder u_dec (
            .inst          (if_id_in.inst[w]),
            .valid_inst_in (if_id_in.valid[w]),
            .opa_select    (id_ex_out.opa_select[w]),
            .opb_select    (id_ex_out.opb_select[w]),
            .dest_reg      (dest_reg_select),
            .alu_func      (id_ex_out.alu_func[w]),
            .rd_mem        (id_ex_out.rd_mem[w]),
            .wr_mem        (id_ex_out.wr_mem[w]),
            .cond_branch   (id_ex_out.cond_branch[w]),
            .uncond_branch (id_ex_out.uncond_branch[w]),
            .csr_op        (id_ex_out.csr_op[w]),
            .halt          (id_ex_out.halt[w]),
            .illegal       (id_ex_out.illegal[w]),
            .valid_inst    (is_valid_inst)
        );

        // ---- Destination register index mux ----
        always_comb begin
            case (dest_reg_select)
                DEST_RD:   id_ex_out.dest_reg_idx[w] = if_id_in.inst[w][11:7];
                DEST_NONE: id_ex_out.dest_reg_idx[w] = `ZERO_REG;
                default:   id_ex_out.dest_reg_idx[w] = `ZERO_REG; 
            endcase
        end

        // ---- Pass-through signals ----
        assign id_ex_out.rs1_value[w] = rf_rs1_val[w];
        assign id_ex_out.rs2_value[w] = rf_rs2_val[w];
        assign id_ex_out.NPC[w]       = if_id_in.NPC[w];
        assign id_ex_out.PC[w]        = if_id_in.PC[w];
        assign id_ex_out.inst[w]      = if_id_in.inst[w];

        // FIX: Correctly assign mem_size from the instruction's funct3 field.
        // This is used by load/store instructions in the MEM stage.
        assign id_ex_out.mem_size[w] = if_id_in.inst[w][14:12]; 

        // ---- Validity and Scoreboard signals ----
        assign id_ex_out.valid[w] = is_valid_inst;
        assign issue_valid[w]     = is_valid_inst;
        assign issue_rs1[w]       = is_valid_inst ? rf_rs1_idx[w] : `ZERO_REG;
        assign issue_rs2[w]       = is_valid_inst ? rf_rs2_idx[w] : `ZERO_REG;

    end endgenerate

endmodule
