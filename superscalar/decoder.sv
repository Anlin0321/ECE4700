`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/17/2025 07:49:03 AM
// Design Name: 
// Module Name: decoder
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


`timescale 1ns/100ps
`include "sys_defs.svh"

module decoder (
    input  logic [31:0]    inst,            // one instruction word
    input  logic           valid_inst_in,   // lane-local valid bit

    output ALU_OPA_SELECT  opa_select,
    output ALU_OPB_SELECT  opb_select,
    output DEST_REG_SEL    dest_reg,        // DEST_RD / DEST_RS etc.
    output ALU_FUNC        alu_func,

    output logic           rd_mem, wr_mem,
    output logic           cond_branch, uncond_branch,
    output logic           csr_op,
    output logic           halt,
    output logic           illegal,
    output logic           valid_inst        // lane-local valid out
);
    //------------------------------------------------------------------
    // Local signals
    //------------------------------------------------------------------
    assign valid_inst = valid_inst_in & ~illegal;

    //------------------------------------------------------------------
    // Default (NOP) control settings
    //------------------------------------------------------------------
    always_comb begin
        // ---- SAFE defaults ----
        opa_select   = OPA_IS_RS1;
        opb_select   = OPB_IS_RS2;
        alu_func     = ALU_ADD;
        dest_reg     = DEST_NONE;

        rd_mem       = `FALSE;
        wr_mem       = `FALSE;
        cond_branch  = `FALSE;
        uncond_branch= `FALSE;
        csr_op       = `FALSE;
        halt         = `FALSE;
        illegal      = `FALSE;

        if (valid_inst_in) begin
            // ---- decode ----
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

                // ------- integer immediates --------
                `RV32_ADDI  : begin dest_reg=DEST_RD; opb_select=OPB_IS_I_IMM; end
                `RV32_SLTI  : begin dest_reg=DEST_RD; opb_select=OPB_IS_I_IMM; alu_func=ALU_SLT;  end
                `RV32_SLTIU : begin dest_reg=DEST_RD; opb_select=OPB_IS_I_IMM; alu_func=ALU_SLTU; end
                `RV32_ANDI  : begin dest_reg=DEST_RD; opb_select=OPB_IS_I_IMM; alu_func=ALU_AND;  end
                `RV32_ORI   : begin dest_reg=DEST_RD; opb_select=OPB_IS_I_IMM; alu_func=ALU_OR;   end
                `RV32_XORI  : begin dest_reg=DEST_RD; opb_select=OPB_IS_I_IMM; alu_func=ALU_XOR;  end
                `RV32_SLLI  : begin dest_reg=DEST_RD; opb_select=OPB_IS_I_IMM; alu_func=ALU_SLL;  end
                `RV32_SRLI  : begin dest_reg=DEST_RD; opb_select=OPB_IS_I_IMM; alu_func=ALU_SRL;  end
                `RV32_SRAI  : begin dest_reg=DEST_RD; opb_select=OPB_IS_I_IMM; alu_func=ALU_SRA;  end

                // ------- R-format --------
                `RV32_ADD : begin dest_reg=DEST_RD; end
                `RV32_SUB : begin dest_reg=DEST_RD; alu_func=ALU_SUB; end
                `RV32_SLT : begin dest_reg=DEST_RD; alu_func=ALU_SLT; end
                `RV32_SLTU: begin dest_reg=DEST_RD; alu_func=ALU_SLTU; end
                `RV32_AND : begin dest_reg=DEST_RD; alu_func=ALU_AND; end
                `RV32_OR  : begin dest_reg=DEST_RD; alu_func=ALU_OR;  end
                `RV32_XOR : begin dest_reg=DEST_RD; alu_func=ALU_XOR; end
                `RV32_SLL : begin dest_reg=DEST_RD; alu_func=ALU_SLL; end
                `RV32_SRL : begin dest_reg=DEST_RD; alu_func=ALU_SRL; end
                `RV32_SRA : begin dest_reg=DEST_RD; alu_func=ALU_SRA; end

                // ------- multiply (M-ext) --------
                `RV32_MUL   : begin dest_reg=DEST_RD; alu_func=ALU_MUL;   end
                `RV32_MULH  : begin dest_reg=DEST_RD; alu_func=ALU_MULH;  end
                `RV32_MULHSU: begin dest_reg=DEST_RD; alu_func=ALU_MULHSU;end
                `RV32_MULHU : begin dest_reg=DEST_RD; alu_func=ALU_MULHU; end

                // ------- CSR & system --------
                `RV32_CSRRW, `RV32_CSRRS, `RV32_CSRRC: begin csr_op = `TRUE; dest_reg=DEST_RD; end
                `WFI       : begin halt = `TRUE; end

                default    : illegal = `TRUE;
            endcase
        end
    end // always_comb
endmodule // decoder
