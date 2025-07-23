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
`include "ISA.svh"

module id_stage_with_branch_prediction (
    input  logic          clk, rst,

    // ---- IF/ID input ----
    input  IF_ID_PACKET_BP   if_id_in,

    // ---- NEW ID/EX input ----
    input  ID_EX_PACKET_BP   id_ex_in,

    // ---- scoreboard feedback ----
    output logic [`ISSUE_WIDTH-1:0]         issue_valid_rs1,
    output logic [`ISSUE_WIDTH-1:0]         issue_valid_rs2,
    output logic [`ISSUE_WIDTH-1:0]         issue_valid_rd,
//    output logic [`ISSUE_WIDTH-1:0][4:0]    issue_rs1,
//    output logic [`ISSUE_WIDTH-1:0][4:0]    issue_rs2,
    output logic [`ISSUE_WIDTH-1:0][4:0]    issue_rd,

    // ---- regfile interface ----
    output logic [`ISSUE_WIDTH-1:0][4:0]            rf_rs1_idx,
    output logic [`ISSUE_WIDTH-1:0][4:0]            rf_rs2_idx,
//    input  XLEN_t [`ISSUE_WIDTH-1:0]        rf_rs1_val,
//    input  XLEN_t [`ISSUE_WIDTH-1:0]        rf_rs2_val,
    input  logic [`ISSUE_WIDTH-1:0][`XLEN-1:0]      rf_rs1_val,
    input  logic [`ISSUE_WIDTH-1:0][`XLEN-1:0]      rf_rs2_val,

    // ---- ID/EX output ----
    // Seperated into 2 packets to handle intra-lane stall
    output ID_EX_PACKET_BP             id_ex_out,
    output logic [`ISSUE_WIDTH-1:0] forward,
//    output ID_EX_PACKET   id_ex_forward_out,
//    output ID_EX_PACKET   id_ex_stall_out,

//    // New inputs for stall signals
//    input  logic [`ISSUE_WIDTH-1:0] stall;
    // New inputs for stall signals
    input  logic                     stall,
    input  logic                     flush,
    // New outputs  for kill signals
    output logic [`ISSUE_WIDTH-1:0]  kill
);
    ID_EX_PACKET_BP   id_ex_out;

    //----------------------------------------------------------
    // 1) Per-lane decode
    //----------------------------------------------------------
    genvar w;
    generate for (w = 0; w < `ISSUE_WIDTH; w++) begin : G_DEC
        DEST_REG_SEL dest_reg_select;
        
        // ---- Intermediate wires for decoder outputs ----
        ALU_OPA_SELECT  opa_select_int;
        ALU_OPB_SELECT  opb_select_int;
        ALU_FUNC        alu_func_int;
        logic        rd_mem_int;
        logic        wr_mem_int;
        logic        cond_branch_int;
        logic        uncond_branch_int;
        logic        csr_op_int;
        logic        halt_int;
        logic        illegal_int;
        logic        valid_inst_int;
        
        // ---- Register index extraction ----
//        assign rf_rs1_idx[w] = stall ? id_ex_in.rs1_idx[w] : if_id_in.inst[w].r.rs1;
//        assign rf_rs2_idx[w] = stall ? id_ex_in.rs2_idx[w] : if_id_in.inst[w].r.rs2;
        assign rf_rs1_idx[w] = id_ex_out.rs1_idx[w];
        assign rf_rs2_idx[w] = id_ex_out.rs2_idx[w];
    
        // ---- Pass read values straight through ----
        assign id_ex_out.rs1_value[w] = rf_rs1_val[w];
        assign id_ex_out.rs2_value[w] = rf_rs2_val[w];

        // ---- Decoder instance ----
        decoder u_dec (
            .inst           (if_id_in.inst[w]),
            .valid_inst_in  (if_id_in.valid[w] && !stall),
            // Outputs
            .opa_select     (opa_select_int),
            .opb_select     (opb_select_int),
            .dest_reg       (dest_reg_select),
            .alu_func       (alu_func_int),
            .rd_mem         (rd_mem_int),
            .wr_mem         (wr_mem_int),
            .cond_branch    (cond_branch_int),
            .uncond_branch  (uncond_branch_int),
            .csr_op         (csr_op_int),
            .halt           (halt_int),
            .illegal        (illegal_int),
            .valid_inst     (valid_inst_int)
        );
    
        // ---- Output muxes with stall logic ----
        assign id_ex_out.rs1_idx[w] = stall ? id_ex_in.rs1_idx[w] : if_id_in.inst[w].r.rs1;
        assign id_ex_out.rs2_idx[w] = stall ? id_ex_in.rs2_idx[w] : if_id_in.inst[w].r.rs2;
        assign id_ex_out.opa_select[w] = stall ? id_ex_in.opa_select[w] : opa_select_int;
        assign id_ex_out.opb_select[w] = stall ? id_ex_in.opb_select[w] : opb_select_int;
        assign id_ex_out.alu_func[w] = stall ? id_ex_in.alu_func[w] : alu_func_int;
        assign id_ex_out.rd_mem[w] = stall ? id_ex_in.rd_mem[w] : rd_mem_int;
        assign id_ex_out.wr_mem[w] = stall ? id_ex_in.wr_mem[w] : wr_mem_int;
        assign id_ex_out.cond_branch[w] = stall ? id_ex_in.cond_branch[w] : cond_branch_int;
        assign id_ex_out.uncond_branch[w] = stall ? id_ex_in.uncond_branch[w] : uncond_branch_int;
        assign id_ex_out.csr_op[w] = stall ? id_ex_in.csr_op[w] : csr_op_int;
        assign id_ex_out.halt[w] = stall ? id_ex_in.halt[w] : halt_int;
        assign id_ex_out.illegal[w] = stall ? id_ex_in.illegal[w] : illegal_int;
        assign id_ex_out.valid[w] = flush ? 1'b0 :  // if flush, squash the instr
                                    stall ? id_ex_in.valid[w] : valid_inst_int;
        // ---- Pass through branch predictor metadata ----
        assign id_ex_out.provider_component[w] = stall ? id_ex_in.provider_component[w] : if_id_in.provider_component[w];
        assign id_ex_out.indices[w]            = stall ? id_ex_in.indices[w]            : if_id_in.indices[w];
        assign id_ex_out.ghist_snapshot[w]     = stall ? id_ex_in.ghist_snapshot[w]     : if_id_in.ghist_snapshot[w];

        // ---- Destination register selection ----
        always_comb begin
            if (stall) begin
                id_ex_out.dest_reg_idx[w] = id_ex_in.dest_reg_idx[w];
            end else begin
                case (dest_reg_select)
                    DEST_RD:    id_ex_out.dest_reg_idx[w] = if_id_in.inst[w].r.rd;
                    DEST_NONE:  id_ex_out.dest_reg_idx[w] = `ZERO_REG;
                    default:    id_ex_out.dest_reg_idx[w] = `ZERO_REG; 
                endcase
            end
        end
    
        // ---- Pipeline passthrough with stall logic ----
        assign id_ex_out.inst[w] = stall ? id_ex_in.inst[w] : if_id_in.inst[w];
        assign id_ex_out.NPC[w] = stall ? id_ex_in.NPC[w] : if_id_in.NPC[w];
        assign id_ex_out.PC[w] = stall ? id_ex_in.PC[w] : if_id_in.PC[w];

        // ---- Lane-local outputs ----
        logic rs1_dependency;
        logic rs2_dependency;
        logic scheduled_forward;
        assign rs1_dependency = (id_ex_out.opa_select[w] == OPA_IS_RS1 | id_ex_out.cond_branch[w]);
        assign rs2_dependency = (id_ex_out.opb_select[w] == OPB_IS_RS2 | id_ex_out.cond_branch[w]);
        assign scheduled_forward = id_ex_out.valid[w] & forward[w];
        assign issue_valid_rs1[w] = scheduled_forward & rs1_dependency;
        assign issue_valid_rs2[w] = scheduled_forward & rs2_dependency;
        assign issue_valid_rd [w] = scheduled_forward;
        assign issue_rd[w] = id_ex_out.dest_reg_idx[w];
    end endgenerate

        // Forwarding stalling logic
//    always_comb begin
//        for (int i = 0; i < `ISSUE_WIDTH; i++) begin
//            if (stall[i])
//                id_ex_out.valid[i] = 1'b0;
//            else
//                id_ex_out.valid[i] = if_id_in.valid[w];
//        end
//    end

    //----------------------------------------------------------
    // 2) Simple intra-group RAW/WAW kill (optional)
    //----------------------------------------------------------
    integer i, j;
    always_comb begin
        kill = '0;
        for (i = 1; i < `ISSUE_WIDTH; i++) begin
            for (j = 0; j < i; j++) begin
                if (id_ex_out.valid[i] & id_ex_out.valid[j]) begin
                    // logic rd_conflict = (id_ex_out.dest_reg_idx[i] == id_ex_out.dest_reg_idx[j] && id_ex_out.dest_reg_idx[i] != 0);
                    if (
                        (rf_rs1_idx[i] == id_ex_out.dest_reg_idx[j] && id_ex_out.dest_reg_idx[j] != `ZERO_REG) ||
                        (rf_rs2_idx[i] == id_ex_out.dest_reg_idx[j] && id_ex_out.dest_reg_idx[j] != `ZERO_REG)
                    )
                        kill[i] = 1'b1;
                 end
            end
        end
    end

    // intra-lane hazards stall logic
    logic kill_start;
	always_comb begin
	   kill_start = 1'b0;
	   for (int i = 0; i < `ISSUE_WIDTH; i++) begin
	       if (kill[i])
                kill_start = 1'b1;

//            // id_ex_stall_packet keeps track of the stalled instructions
//            id_ex_stall_out.valid[i] = kill_start & id_ex_stall_out.valid[i];

//            // id_ex_packer keeps track of the forwarded instructions
//            id_ex_forward_out.valid[i] = ~kill_start & id_ex_forward_out.valid[i];
	           forward[i] = ~kill_start;
	   end
	end

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
