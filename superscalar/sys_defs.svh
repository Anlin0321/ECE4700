/////////////////////////////////////////////////////////////////////////
//                                                                     //
//   Modulename :  sys_defs.vh                                         //
//                                                                     //
//  Description :  This file has the macro-defines for macros used in  //
//                 the pipeline design.                                //
//                                                                     //
/////////////////////////////////////////////////////////////////////////


`ifndef __SYS_DEFS_VH__
`define __SYS_DEFS_VH__
//////////////////////////////////////////////
//
// Memory/testbench attribute definitions
//
//////////////////////////////////////////////

`define NUM_MEM_TAGS           8
`define MEM_LATENCY_IN_CYCLES  0

`define MEM_SIZE_IN_BYTES      (64*1024)
`define MEM_64BIT_LINES        (`MEM_SIZE_IN_BYTES/8)

//you can change the clock period to whatever, 10 is just fine
`define VERILOG_CLOCK_PERIOD   10.0

typedef union packed {
    logic [7:0][7:0] byte_level;
    logic [3:0][15:0] half_level;
    logic [1:0][31:0] word_level;
} EXAMPLE_CACHE_BLOCK;

//////////////////////////////////////////////
// Exception codes
// This mostly follows the RISC-V Privileged spec
// except a few add-ons for our infrastructure
// The majority of them won't be used, but it's
// good to know what they are
//////////////////////////////////////////////

typedef enum logic [3:0] {
	INST_ADDR_MISALIGN  = 4'h0,
	INST_ACCESS_FAULT   = 4'h1,
	ILLEGAL_INST        = 4'h2,
	BREAKPOINT          = 4'h3,
	LOAD_ADDR_MISALIGN  = 4'h4,
	LOAD_ACCESS_FAULT   = 4'h5,
	STORE_ADDR_MISALIGN = 4'h6,
	STORE_ACCESS_FAULT  = 4'h7,
	ECALL_U_MODE        = 4'h8,
	ECALL_S_MODE        = 4'h9,
	NO_ERROR            = 4'ha, //a reserved code that we modified for our purpose
	ECALL_M_MODE        = 4'hb,
	INST_PAGE_FAULT     = 4'hc,
	LOAD_PAGE_FAULT     = 4'hd,
	HALTED_ON_WFI       = 4'he, //another reserved code that we used
	STORE_PAGE_FAULT    = 4'hf
} EXCEPTION_CODE;


//////////////////////////////////////////////
//
// Datapath control signals
//
//////////////////////////////////////////////

//
// ALU opA input mux selects
//
typedef enum logic [1:0] {
	OPA_IS_RS1  = 2'h0,
	OPA_IS_NPC  = 2'h1,
	OPA_IS_PC   = 2'h2,
	OPA_IS_ZERO = 2'h3
} ALU_OPA_SELECT;

//
// ALU opB input mux selects
//
typedef enum logic [3:0] {
	OPB_IS_RS2    = 4'h0,
	OPB_IS_I_IMM  = 4'h1,
	OPB_IS_S_IMM  = 4'h2,
	OPB_IS_B_IMM  = 4'h3,
	OPB_IS_U_IMM  = 4'h4,
	OPB_IS_J_IMM  = 4'h5
} ALU_OPB_SELECT;

//
// Destination register select
//
typedef enum logic [1:0] {
	DEST_RD = 2'h0,
	DEST_NONE  = 2'h1
} DEST_REG_SEL;

//
// ALU function code input
// probably want to leave these alone
//
typedef enum logic [4:0] {
	ALU_ADD     = 5'h00,
	ALU_SUB     = 5'h01,
	ALU_SLT     = 5'h02,
	ALU_SLTU    = 5'h03,
	ALU_AND     = 5'h04,
	ALU_OR      = 5'h05,
	ALU_XOR     = 5'h06,
	ALU_SLL     = 5'h07,
	ALU_SRL     = 5'h08,
	ALU_SRA     = 5'h09,
	ALU_MUL     = 5'h0a,
	ALU_MULH    = 5'h0b,
	ALU_MULHSU  = 5'h0c,
	ALU_MULHU   = 5'h0d,
	ALU_DIV     = 5'h0e,
	ALU_DIVU    = 5'h0f,
	ALU_REM     = 5'h10,
	ALU_REMU    = 5'h11
} ALU_FUNC;

//////////////////////////////////////////////
//
// Assorted things it is not wise to change
//
//////////////////////////////////////////////

//
// actually, you might have to change this if you change VERILOG_CLOCK_PERIOD
// JK you don't ^^^
//
`define SD #1


// the RISCV register file zero register, any read of this register always
// returns a zero value, and any write to this register is thrown away
//
`define ZERO_REG 5'd0

//
// Memory bus commands control signals
//
typedef enum logic [1:0] {
	BUS_NONE     = 2'h0,
	BUS_LOAD     = 2'h1,
	BUS_STORE    = 2'h2
} BUS_COMMAND;

`ifndef CACHE_MODE
typedef enum logic [1:0] {
	BYTE = 2'h0,
	HALF = 2'h1,
	WORD = 2'h2,
	DOUBLE = 2'h3
} MEM_SIZE;
`endif
//
// useful boolean single-bit definitions
//
`define FALSE  1'h0
`define TRUE  1'h1


// RISCV ISA SPEC
`define XLEN 32
typedef union packed {
	logic [31:0] inst;
	struct packed {
		logic [6:0] funct7;
		logic [4:0] rs2;
		logic [4:0] rs1;
		logic [2:0] funct3;
		logic [4:0] rd;
		logic [6:0] opcode;
	} r; //register to register instructions
	struct packed {
		logic [11:0] imm;
		logic [4:0]  rs1; //base
		logic [2:0]  funct3;
		logic [4:0]  rd;  //dest
		logic [6:0]  opcode;
	} i; //immediate or load instructions
	struct packed {
		logic [6:0] off; //offset[11:5] for calculating address
		logic [4:0] rs2; //source
		logic [4:0] rs1; //base
		logic [2:0] funct3;
		logic [4:0] set; //offset[4:0] for calculating address
		logic [6:0] opcode;
	} s; //store instructions
	struct packed {
		logic       of; //offset[12]
		logic [5:0] s;   //offset[10:5]
		logic [4:0] rs2;//source 2
		logic [4:0] rs1;//source 1
		logic [2:0] funct3;
		logic [3:0] et; //offset[4:1]
		logic       f;  //offset[11]
		logic [6:0] opcode;
	} b; //branch instructions
	struct packed {
		logic [19:0] imm;
		logic [4:0]  rd;
		logic [6:0]  opcode;
	} u; //upper immediate instructions
	struct packed {
		logic       of; //offset[20]
		logic [9:0] et; //offset[10:1]
		logic       s;  //offset[11]
		logic [7:0] f;	//offset[19:12]
		logic [4:0] rd; //dest
		logic [6:0] opcode;
	} j;  //jump instructions
`ifdef ATOMIC_EXT
	struct packed {
		logic [4:0] funct5;
		logic       aq;
		logic       rl;
		logic [4:0] rs2;
		logic [4:0] rs1;
		logic [2:0] funct3;
		logic [4:0] rd;
		logic [6:0] opcode;
	} a; //atomic instructions
`endif
`ifdef SYSTEM_EXT
	struct packed {
		logic [11:0] csr;
		logic [4:0]  rs1;
		logic [2:0]  funct3;
		logic [4:0]  rd;
		logic [6:0]  opcode;
	} sys; //system call instructions
`endif

} INST; //instruction typedef, this should cover all types of instructions

//
// Basic NOP instruction.  Allows pipline registers to clearly be reset with
// an instruction that does nothing instead of Zero which is really an ADDI x0, x0, 0
//
`define NOP 32'h00000013


//--------------------------------------------------------------
// -- Superscalar parameters
//--------------------------------------------------------------
`define ISSUE_WIDTH  8
`define IW_RANGE     (`ISSUE_WIDTH-1):0
`define PC_RESET     32'h0000_0000

//--------------------------------------------------------------
// -- Instruction container types (all widened to 3-way)
//--------------------------------------------------------------
typedef logic [`XLEN-1:0] XLEN_t;



//////////////////////////////////////////////
//
// IF Packets:
// Data that is exchanged between the IF and the ID stages  
//
//////////////////////////////////////////////

//typedef struct packed {
//	logic valid; // If low, the data in this struct is garbage
//    INST  inst;  // fetched instruction out
//	logic [`XLEN-1:0] NPC; // PC + 4
//	logic [`XLEN-1:0] PC;  // PC 
//} IF_ID_PACKET;

localparam TABLE_SIZE  = 2048;
localparam NUM_TABLES  = 7;
localparam GHIST_WIDTH = 256;

// A helper typedef for the packed indices metadata to keep structs clean
typedef logic [($clog2(TABLE_SIZE) * NUM_TABLES) - 1:0] bp_indices_t;


// --- IF/ID Packet ---
// Carries fetched instructions from IF to ID.
typedef struct {
    INST                inst  [`IW_RANGE];
    XLEN_t              NPC   [`IW_RANGE];
    XLEN_t              PC    [`IW_RANGE];
    logic               valid [`IW_RANGE];

    // Branch Predictor Metadata
    logic [2:0]                 provider_component [`IW_RANGE];
    logic [$bits(bp_indices_t)-1:0] indices [`IW_RANGE];
    logic [GHIST_WIDTH-1:0]     ghist_snapshot [`IW_RANGE];
} IF_ID_PACKET_BP;

typedef struct {
    XLEN_t              NPC [`IW_RANGE];
    XLEN_t              PC [`IW_RANGE];
    XLEN_t              rs1_value [`IW_RANGE];
    XLEN_t              rs2_value [`IW_RANGE];
    logic [4:0]         rs1_idx [`IW_RANGE];
    logic [4:0]         rs2_idx [`IW_RANGE];
    ALU_OPA_SELECT      opa_select [`IW_RANGE];
    ALU_OPB_SELECT      opb_select [`IW_RANGE];
    INST                inst  [`IW_RANGE];
    logic [4:0]         dest_reg_idx [`IW_RANGE];
    ALU_FUNC            alu_func [`IW_RANGE];
    logic               rd_mem [`IW_RANGE];
    logic               wr_mem [`IW_RANGE];
    logic               cond_branch [`IW_RANGE];
    logic               uncond_branch [`IW_RANGE];
    logic               halt [`IW_RANGE];
    logic               illegal [`IW_RANGE];
    logic               csr_op [`IW_RANGE];
    logic               valid [`IW_RANGE];

    // Branch Predictor Metadata
    logic [2:0]                 provider_component [`IW_RANGE];
    logic [$bits(bp_indices_t)-1:0] indices [`IW_RANGE];
    logic [GHIST_WIDTH-1:0]     ghist_snapshot [`IW_RANGE];
} ID_EX_PACKET_BP;

typedef struct {
    XLEN_t              alu_result [`IW_RANGE];
    XLEN_t              NPC        [`IW_RANGE];
    XLEN_t              PC         [`IW_RANGE];
    logic               take_branch [`IW_RANGE];
    XLEN_t              rs2_value  [`IW_RANGE];
    logic               rd_mem     [`IW_RANGE];
    logic               wr_mem     [`IW_RANGE];
    logic [4:0]         dest_reg_idx [`IW_RANGE];
    logic               halt       [`IW_RANGE];
    logic               illegal    [`IW_RANGE];
    logic               csr_op     [`IW_RANGE];
    logic               valid      [`IW_RANGE];
    logic [2:0]         mem_size   [`IW_RANGE];
    logic               cond_branch [`IW_RANGE];

    // Branch Predictor Metadata
    logic [2:0]                 provider_component [`IW_RANGE];
    logic [$bits(bp_indices_t)-1:0] indices [`IW_RANGE];
    logic [GHIST_WIDTH-1:0]     ghist_snapshot [`IW_RANGE];
} EX_MEM_PACKET_BP;


typedef struct {
    logic               valid [`IW_RANGE];
//    logic [31:0]        inst  [`IW_RANGE];
    INST                inst  [`IW_RANGE];
    XLEN_t              NPC   [`IW_RANGE];
    XLEN_t              PC    [`IW_RANGE];
} IF_ID_PACKET;


//////////////////////////////////////////////
//
// ID Packets:
// Data that is exchanged from ID to EX stage
//
//////////////////////////////////////////////

//typedef struct packed {
//	logic [`XLEN-1:0] NPC;   // PC + 4
//	logic [`XLEN-1:0] PC;    // PC

//	logic [`XLEN-1:0] rs1_value;    // reg A value                                  
//	logic [`XLEN-1:0] rs2_value;    // reg B value                                  
	                                                                                
//	ALU_OPA_SELECT opa_select; // ALU opa mux select (ALU_OPA_xxx *)
//	ALU_OPB_SELECT opb_select; // ALU opb mux select (ALU_OPB_xxx *)
//	INST inst;                 // instruction
	
//	logic [4:0] dest_reg_idx;  // destination (writeback) register index      
//	ALU_FUNC    alu_func;      // ALU function select (ALU_xxx *)
//	logic       rd_mem;        // does inst read memory?
//	logic       wr_mem;        // does inst write memory?
//	logic       cond_branch;   // is inst a conditional branch?
//	logic       uncond_branch; // is inst an unconditional branch?
//	logic       halt;          // is this a halt?
//	logic       illegal;       // is this instruction illegal?
//	logic       csr_op;        // is this a CSR operation? (we only used this as a cheap way to get return code)
//	logic       valid;         // is inst a valid instruction to be counted for CPI calculations?
//} ID_EX_PACKET;

//typedef enum logic [1:0] {OPA_RS1, OPA_PC, OPA_ZERO} ALU_OPA_SELECT;
//typedef enum logic [1:0] {OPB_RS2, OPB_IMM, OPB_FOUR} ALU_OPB_SELECT;

typedef struct {
    XLEN_t              NPC          [`IW_RANGE];
    XLEN_t              PC           [`IW_RANGE];

    XLEN_t              rs1_value    [`IW_RANGE];
    XLEN_t              rs2_value    [`IW_RANGE];

    // New fields for register idx
    XLEN_t              rs1_idx      [`IW_RANGE];
    XLEN_t              rs2_idx      [`IW_RANGE];

    ALU_OPA_SELECT      opa_select   [`IW_RANGE];
    ALU_OPB_SELECT      opb_select   [`IW_RANGE];
    INST                inst         [`IW_RANGE];

    logic [4:0]         dest_reg_idx [`IW_RANGE];
    ALU_FUNC            alu_func     [`IW_RANGE];
    logic               rd_mem       [`IW_RANGE];
    logic               wr_mem       [`IW_RANGE];
    logic               cond_branch  [`IW_RANGE];
	logic               uncond_branch[`IW_RANGE];
//    logic [2:0]         mem_size     [`IW_RANGE];
    logic               halt         [`IW_RANGE];
    logic               illegal      [`IW_RANGE];
    logic               csr_op       [`IW_RANGE];
    logic               valid        [`IW_RANGE];
} ID_EX_PACKET;


//typedef struct packed {
//	logic [`XLEN-1:0] alu_result; // alu_result
//	logic [`XLEN-1:0] NPC; //pc + 4
//	logic             take_branch; // is this a taken branch?
//	//pass throughs from decode stage
//	logic [`XLEN-1:0] rs2_value;
//	logic             rd_mem, wr_mem;
//	logic [4:0]       dest_reg_idx;
//	logic             halt, illegal, csr_op, valid;
//	logic [2:0]       mem_size; // byte, half-word or word
//} EX_MEM_PACKET;

typedef struct {
    XLEN_t              alu_result   [`IW_RANGE];
    XLEN_t              NPC          [`IW_RANGE];
    logic               take_branch  [`IW_RANGE];
    XLEN_t              rs2_value    [`IW_RANGE];
    logic               rd_mem       [`IW_RANGE];
    logic               wr_mem       [`IW_RANGE];
    logic [4:0]         dest_reg_idx [`IW_RANGE];
    logic               halt         [`IW_RANGE];
    logic               illegal      [`IW_RANGE];
    logic               csr_op       [`IW_RANGE];
    logic               valid        [`IW_RANGE];
    logic [2:0]         mem_size     [`IW_RANGE];
} EX_MEM_PACKET;

// ----- NEW! MEM/WB -----
typedef struct {
    XLEN_t              NPC          [`IW_RANGE];
    logic               take_branch  [`IW_RANGE];
    XLEN_t              wb_data      [`IW_RANGE];
    logic [4:0]         dest_reg_idx [`IW_RANGE];
    logic               halt         [`IW_RANGE];
    logic               illegal      [`IW_RANGE];
    logic               csr_op       [`IW_RANGE];
    logic               valid        [`IW_RANGE];
} MEM_WB_PACKET;

//--------------------------------------------------------------
//  Helper functions
//--------------------------------------------------------------

function automatic logic [`IW_RANGE] unpacked_and(
    input logic vec1 [`IW_RANGE],
    input logic vec2 [`IW_RANGE]
);
    for (int i = 0; i < `ISSUE_WIDTH; i++) begin
        unpacked_and[i] = vec1[i] & vec2[i];
    end
endfunction

function automatic logic any_valid_packed (input logic [`IW_RANGE] vec);
    automatic logic r;
    r = 1'b0;
    for (int i = 0; i < `ISSUE_WIDTH; i++) begin
        r |= vec[i];
    end
    any_valid_packed = r;
endfunction

function automatic logic any_valid_unpacked (input logic vec [`IW_RANGE]);
    automatic logic r;
    r = 1'b0;
    for (int i = 0; i < `ISSUE_WIDTH; i++) begin
        r |= vec[i];
    end
    any_valid_unpacked = r;
endfunction

function automatic logic [$clog2(`ISSUE_WIDTH+1)-1:0] count_valid(input logic vec [`IW_RANGE]);
    integer i;
    count_valid = 0;
    for (i = 0; i < `ISSUE_WIDTH; i++) begin
        count_valid += vec[i];
    end
endfunction

`endif // __SYS_DEFS_VH__
