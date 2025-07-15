///////////////////////////////////////////////////////////////////////////////
//                                                                           //
//  Modulename : supermem.v                                                  //
//                                                                           //
// Description : This is a clock-based latency, pipelined memory with        //
//               3 buses (address in, data in, data out) and a limit         //
//               on the number of outstanding memory operations allowed      //
//               at any time.                                                //
//                                                                           // 
///////////////////////////////////////////////////////////////////////////////

`ifndef __SUPERMEM_V__
`define __SUPERMEM_V__

`timescale 1ns/100ps

`include "sys_defs.svh"


module supermem (
    input         clk,              // Memory clock

    // Instruction Memory Ports (ISSUE_WIDTH-way)
    input  [`ISSUE_WIDTH-1:0] [1:0]   proc2Imem_command, 
    input  [`ISSUE_WIDTH-1:0] [`XLEN-1:0] proc2Imem_addr,
    output logic [`ISSUE_WIDTH-1:0] [3:0] mem2Iproc_response,
    output logic [`ISSUE_WIDTH-1:0] [63:0] mem2Iproc_data,
    output logic [`ISSUE_WIDTH-1:0] [3:0] mem2Iproc_tag,

    // Data Memory Ports (ISSUE_WIDTH-way)
    input  [`ISSUE_WIDTH-1:0] [1:0]   proc2Dmem_command,
    input  [`ISSUE_WIDTH-1:0] [`XLEN-1:0] proc2Dmem_addr,
    input  [`ISSUE_WIDTH-1:0] [63:0] proc2Dmem_data,
    output logic [`ISSUE_WIDTH-1:0] [3:0] mem2Dproc_response,
    output logic [`ISSUE_WIDTH-1:0] [63:0] mem2Dproc_data,
    output logic [`ISSUE_WIDTH-1:0] [3:0] mem2Dproc_tag,

    `ifndef CACHE_MODE
        input MEM_SIZE [`ISSUE_WIDTH-1:0] proc2Dmem_size
    `endif
);

    // Define number of tags per port
    `define NUM_MEM_TAGS_PER_PORT (`NUM_MEM_TAGS / `ISSUE_WIDTH)

    // Instruction Memory and State
    logic [63:0] instr_memory  [`MEM_64BIT_LINES - 1:0];
    logic [63:0] instr_loaded_data     [`ISSUE_WIDTH-1:0][`NUM_MEM_TAGS_PER_PORT:1];
    logic [`NUM_MEM_TAGS_PER_PORT:1] [15:0] instr_cycles_left[`ISSUE_WIDTH-1:0];
    logic [`NUM_MEM_TAGS_PER_PORT:1]        instr_waiting_for_bus[`ISSUE_WIDTH-1:0];

    // Data Memory and State
    logic [63:0] data_memory   [`MEM_64BIT_LINES - 1:0];
    logic [63:0] data_loaded_data      [`ISSUE_WIDTH-1:0][`NUM_MEM_TAGS_PER_PORT:1];
    logic [`NUM_MEM_TAGS_PER_PORT:1] [15:0] data_cycles_left[`ISSUE_WIDTH-1:0];
    logic [`NUM_MEM_TAGS_PER_PORT:1]        data_waiting_for_bus[`ISSUE_WIDTH-1:0];
    
    `ifndef CACHE_MODE
    EXAMPLE_CACHE_BLOCK c;
    `endif

    // Instruction Memory Access
    always @(negedge clk) begin
        // Step 1: Decrement cycles_left for active tags
        for (int w=0; w<`ISSUE_WIDTH; w++) begin
            for (int t=1; t<=`NUM_MEM_TAGS_PER_PORT; t++) begin
                if (instr_cycles_left[w][t] > 0) 
                    instr_cycles_left[w][t] <= instr_cycles_left[w][t] - 1;
            end
        end

        // Step 2: Initialize outputs
        for (int w=0; w<`ISSUE_WIDTH; w++) begin
            mem2Iproc_response[w] = 0;
            mem2Iproc_tag[w] = 0;
            mem2Iproc_data[w] = 64'bx;
        end

        // Step 3: Handle completed loads
        for (int w=0; w<`ISSUE_WIDTH; w++) begin
            for (int t=1; t<=`NUM_MEM_TAGS_PER_PORT; t++) begin
                if (instr_cycles_left[w][t]==0 && instr_waiting_for_bus[w][t]) begin
                    mem2Iproc_tag[w] = t;
                    mem2Iproc_data[w] = instr_loaded_data[w][t];
                    instr_waiting_for_bus[w][t] = 0;
                    break; // One response per port per cycle
                end
            end
        end

        // Step 4: Handle new requests
        for (int w=0; w<`ISSUE_WIDTH; w++) begin
            if (proc2Imem_command[w] != BUS_NONE) begin
                if (proc2Imem_command[w] == BUS_LOAD) begin
                    if (proc2Imem_addr[w][2:0]==3'b0 && proc2Imem_addr[w]<`MEM_SIZE_IN_BYTES) begin
                        integer free_tag = 0;
                        for (int t=1; t<=`NUM_MEM_TAGS_PER_PORT; t++) begin
                            if (instr_cycles_left[w][t]==0 && !instr_waiting_for_bus[w][t]) begin
                                free_tag = t;
                                break;
                            end
                        end
                        if (free_tag) begin
                            mem2Iproc_response[w] = free_tag;
                            instr_loaded_data[w][free_tag] = instr_memory[proc2Imem_addr[w][`XLEN-1:3]];
                            instr_cycles_left[w][free_tag] = `MEM_LATENCY_IN_CYCLES;
                            instr_waiting_for_bus[w][free_tag] = 1;
                        end
                    end
                end
                // No store support for instruction memory
            end
        end
    end

    // Data Memory Access
    always @(negedge clk) begin
        // Step 1: Decrement cycles_left for active tags
        for (int w=0; w<`ISSUE_WIDTH; w++) begin
            for (int t=1; t<=`NUM_MEM_TAGS_PER_PORT; t++) begin
                if (data_cycles_left[w][t] > 0) 
                    data_cycles_left[w][t] <= data_cycles_left[w][t] - 1;
            end
        end

        // Step 2: Initialize outputs
        for (int w=0; w<`ISSUE_WIDTH; w++) begin
            mem2Dproc_response[w] = 0;
            mem2Dproc_tag[w] = 0;
            mem2Dproc_data[w] = 64'bx;
        end

        // Step 3: Handle completed loads
        for (int w=0; w<`ISSUE_WIDTH; w++) begin
            for (int t=1; t<=`NUM_MEM_TAGS_PER_PORT; t++) begin
                if (data_cycles_left[w][t]==0 && data_waiting_for_bus[w][t]) begin
                    mem2Dproc_tag[w] = t;
                    mem2Dproc_data[w] = data_loaded_data[w][t];
                    data_waiting_for_bus[w][t] = 0;
                    break; // One response per port per cycle
                end
            end
        end

        // Step 4: Handle new requests
        for (int w=0; w<`ISSUE_WIDTH; w++) begin
            if (proc2Dmem_command[w] != BUS_NONE && proc2Dmem_addr[w]<`MEM_SIZE_IN_BYTES) begin
                integer free_tag = 0;
                for (int t=1; t<=`NUM_MEM_TAGS_PER_PORT; t++) begin
                    if (data_cycles_left[w][t]==0 && !data_waiting_for_bus[w][t]) begin
                        free_tag = t;
                        break;
                    end
                end
                if (free_tag) begin
                    mem2Dproc_response[w] = free_tag;
                    data_cycles_left[w][free_tag] = `MEM_LATENCY_IN_CYCLES;
                    
                    if (proc2Dmem_command[w] == BUS_LOAD) begin
                        data_waiting_for_bus[w][free_tag] = 1;
`ifndef CACHE_MODE
                        // Byte-level access handling
                        c.byte_level = data_memory[proc2Dmem_addr[w][`XLEN-1:3]];
                        c.half_level = data_memory[proc2Dmem_addr[w][`XLEN-1:3]];
                        c.word_level = data_memory[proc2Dmem_addr[w][`XLEN-1:3]];
                        case (proc2Dmem_size[w])
                            BYTE: data_loaded_data[w][free_tag] = {56'b0, c.byte_level[proc2Dmem_addr[w][2:0]]};
                            HALF: begin
                                if (proc2Dmem_addr[w][0] == 0)
                                    data_loaded_data[w][free_tag] = {48'b0, c.half_level[proc2Dmem_addr[w][2:1]]};
                                else mem2Dproc_response[w] = 0; // Unaligned
                            end
                            WORD: begin
                                if (proc2Dmem_addr[w][1:0] == 0)
                                    data_loaded_data[w][free_tag] = {32'b0, c.word_level[proc2Dmem_addr[w][2]]};
                                else mem2Dproc_response[w] = 0; // Unaligned
                            end
                            DOUBLE: begin
                                if (proc2Dmem_addr[w][2:0] == 0)
                                    data_loaded_data[w][free_tag] = data_memory[proc2Dmem_addr[w][`XLEN-1:3]];
                                else mem2Dproc_response[w] = 0; // Unaligned
                            end
                        endcase
`else
                        data_loaded_data[w][free_tag] = data_memory[proc2Dmem_addr[w][`XLEN-1:3]];
`endif
                    end 
                    else begin // Store
                        data_waiting_for_bus[w][free_tag] = 0;
`ifndef CACHE_MODE
                        c.byte_level = data_memory[proc2Dmem_addr[w][`XLEN-1:3]];
                        c.half_level = data_memory[proc2Dmem_addr[w][`XLEN-1:3]];
                        c.word_level = data_memory[proc2Dmem_addr[w][`XLEN-1:3]];
                        case (proc2Dmem_size[w])
                            BYTE: begin
                                c.byte_level[proc2Dmem_addr[w][2:0]] = proc2Dmem_data[w][7:0];
                                data_memory[proc2Dmem_addr[w][`XLEN-1:3]] = c.byte_level;
                            end
                            HALF: begin
                                if (proc2Dmem_addr[w][0] == 0) begin
                                    c.half_level[proc2Dmem_addr[w][2:1]] = proc2Dmem_data[w][15:0];
                                    data_memory[proc2Dmem_addr[w][`XLEN-1:3]] = c.half_level;
                                end else mem2Dproc_response[w] = 0; // Unaligned
                            end
                            WORD: begin
                                if (proc2Dmem_addr[w][1:0] == 0) begin
                                    c.word_level[proc2Dmem_addr[w][2]] = proc2Dmem_data[w][31:0];
                                    data_memory[proc2Dmem_addr[w][`XLEN-1:3]] = c.word_level;
                                end else mem2Dproc_response[w] = 0; // Unaligned
                            end
                            DOUBLE: begin
                                if (proc2Dmem_addr[w][2:0] == 0)
                                    data_memory[proc2Dmem_addr[w][`XLEN-1:3]] = proc2Dmem_data[w];
                                else mem2Dproc_response[w] = 0; // Unaligned
                            end
                        endcase
`else
                        data_memory[proc2Dmem_addr[w][`XLEN-1:3]] = proc2Dmem_data[w];
`endif
                    end
                end
            end
        end
    end

    // Initialization
    initial begin
        // Instruction memory initialization
        for (int i=0; i<`MEM_64BIT_LINES; i++) 
            instr_memory[i] = 64'h0;
        for (int w=0; w<`ISSUE_WIDTH; w++) begin
            for (int t=1; t<=`NUM_MEM_TAGS_PER_PORT; t++) begin
                instr_loaded_data[w][t] = 64'bx;
                instr_cycles_left[w][t] = 16'd0;
                instr_waiting_for_bus[w][t] = 1'b0;
            end
        end

        // Data memory initialization
        for (int i=0; i<`MEM_64BIT_LINES; i++) 
            data_memory[i] = 64'h0;
        for (int w=0; w<`ISSUE_WIDTH; w++) begin
            for (int t=1; t<=`NUM_MEM_TAGS_PER_PORT; t++) begin
                data_loaded_data[w][t] = 64'bx;
                data_cycles_left[w][t] = 16'd0;
                data_waiting_for_bus[w][t] = 1'b0;
            end
        end

        // Output initialization
        for (int w=0; w<`ISSUE_WIDTH; w++) begin
            mem2Iproc_response[w] = 4'd0;
            mem2Iproc_tag[w] = 4'd0;
            mem2Iproc_data[w] = 64'bx;
            mem2Dproc_response[w] = 4'd0;
            mem2Dproc_tag[w] = 4'd0;
            mem2Dproc_data[w] = 64'bx;
        end
    end

endmodule
`endif //__MEM_V__


//module mem (
//	input         clk,              // Memory clock
//	input  [`XLEN-1:0] proc2mem_addr,    // address for current command
//	//support for memory model with byte level addressing
//	input  [63:0] proc2mem_data,    // address for current command
//`ifndef CACHE_MODE
//	input  MEM_SIZE proc2mem_size, //BYTE, HALF, WORD or DOUBLE
//`endif
//	input  [1:0]   proc2mem_command, // `BUS_NONE `BUS_LOAD or `BUS_STORE
	
//	output logic  [3:0] mem2proc_response,// 0 = can't accept, other=tag of transaction
//	output logic [63:0] mem2proc_data,    // data resulting from a load
//	output logic  [3:0] mem2proc_tag     // 0 = no value, other=tag of transaction
//  );


//	logic [63:0] next_mem2proc_data;
//	logic  [3:0] next_mem2proc_response, next_mem2proc_tag;
	
//	logic [63:0]                    unified_memory  [`MEM_64BIT_LINES - 1:0];
//	logic [63:0]                    loaded_data     [`NUM_MEM_TAGS:1];
//	logic [`NUM_MEM_TAGS:1]  [15:0] cycles_left;
//	logic [`NUM_MEM_TAGS:1]         waiting_for_bus;
	
//	logic acquire_tag;
//	logic bus_filled;
	

//// Implement the Memory function
//`ifdef CACHE_MODE
//	wire valid_address = (proc2mem_addr[2:0]==3'b0) &
//	                     (proc2mem_addr<`MEM_SIZE_IN_BYTES);

//	always @(negedge clk) begin
//		next_mem2proc_tag      = 4'b0;
//		next_mem2proc_response = 4'b0;
//		next_mem2proc_data     = 64'bx;
//		bus_filled             = 1'b0;
//		acquire_tag            = ((proc2mem_command == BUS_LOAD) ||
//		                          (proc2mem_command == BUS_STORE)) && valid_address;
		
//		for(int i=1;i<=`NUM_MEM_TAGS;i=i+1) begin
//			if(cycles_left[i]>16'd0) begin
//				cycles_left[i] = cycles_left[i]-16'd1;
			
//			end else if(acquire_tag && !waiting_for_bus[i]) begin
//				next_mem2proc_response = i;
//				acquire_tag            = 1'b0;
//				cycles_left[i]         = `MEM_LATENCY_IN_CYCLES; 
//				                          // must add support for random lantencies
//				                          // though this could be done via a non-number
//				                          // definition for this macro
				
//				if(proc2mem_command == BUS_LOAD) begin
//					waiting_for_bus[i] = 1'b1;
//					loaded_data[i]     = unified_memory[proc2mem_addr[`XLEN-1:3]];
//				end else begin
//					unified_memory[proc2mem_addr[`XLEN-1:3]]=proc2mem_data;
//				end
//			end
			
//			if((cycles_left[i]==16'd0) && waiting_for_bus[i] && !bus_filled) begin
//					bus_filled         = 1'b1;
//					next_mem2proc_tag  = i;
//					next_mem2proc_data = loaded_data[i];
//					waiting_for_bus[i] = 1'b0;
//			end
//		end
//		mem2proc_response <= `SD next_mem2proc_response;
//		mem2proc_data     <= `SD next_mem2proc_data;
//		mem2proc_tag      <= `SD next_mem2proc_tag;
//	end
//`else
//    wire valid_address = (proc2mem_addr<`MEM_SIZE_IN_BYTES);
//	EXAMPLE_CACHE_BLOCK c;
//    // temporary wires for byte level selection because verilog does not support variable range selection
//	always @(negedge clk) begin
//		next_mem2proc_tag      = 4'b0;
//		next_mem2proc_response = 4'b0;
//		next_mem2proc_data     = 64'bx;
//		bus_filled             = 1'b0;
//		acquire_tag            = ((proc2mem_command == BUS_LOAD) ||
//		                          (proc2mem_command == BUS_STORE)) && valid_address;
		
//		for(int i=1;i<=`NUM_MEM_TAGS;i=i+1) begin
//			if(cycles_left[i]>16'd0) begin
//				cycles_left[i] = cycles_left[i]-16'd1;
			
//			end else if(acquire_tag && !waiting_for_bus[i]) begin
//				next_mem2proc_response = i;
//				acquire_tag            = 1'b0;
//				cycles_left[i]         = `MEM_LATENCY_IN_CYCLES; 
//				                          // must add support for random lantencies
//				                          // though this could be done via a non-number
//				                          // definition for this macro
//				//filling up these temp variables
//				c.byte_level = unified_memory[proc2mem_addr[`XLEN-1:3]];
//				c.half_level = unified_memory[proc2mem_addr[`XLEN-1:3]];
//				c.word_level = unified_memory[proc2mem_addr[`XLEN-1:3]];

//				if(proc2mem_command == BUS_LOAD) begin
//					waiting_for_bus[i] = 1'b1;
//					loaded_data[i]     = unified_memory[proc2mem_addr[`XLEN-1:3]];
//                	case (proc2mem_size) 
//                        BYTE: begin
//							loaded_data[i] = {56'b0, c.byte_level[proc2mem_addr[2:0]]};
//                        end
//                        HALF: begin
//							assert(proc2mem_addr[0] == 0);
//							loaded_data[i] = {48'b0, c.half_level[proc2mem_addr[2:1]]};
//                        end
//                        WORD: begin
//							assert(proc2mem_addr[1:0] == 0);
//							loaded_data[i] = {32'b0, c.word_level[proc2mem_addr[2]]};
//                        end
//						DOUBLE:
//							loaded_data[i] = unified_memory[proc2mem_addr[`XLEN-1:3]];
//					endcase

//				end else begin
//					case (proc2mem_size) 
//                        BYTE: begin
//							c.byte_level[proc2mem_addr[2:0]] = proc2mem_data[7:0];
//                            unified_memory[proc2mem_addr[`XLEN-1:3]] = c.byte_level;
//                        end
//                        HALF: begin
//							assert(proc2mem_addr[0] == 0);
//							c.half_level[proc2mem_addr[2:1]] = proc2mem_data[15:0];
//                            unified_memory[proc2mem_addr[`XLEN-1:3]] = c.half_level;
//                        end
//                        WORD: begin
//							assert(proc2mem_addr[1:0] == 0);
//							c.word_level[proc2mem_addr[2]] = proc2mem_data[31:0];
//                            unified_memory[proc2mem_addr[`XLEN-1:3]] = c.word_level;
//                        end
//                        default: begin
//							assert(proc2mem_addr[1:0] == 0);
//							c.byte_level[proc2mem_addr[2]] = proc2mem_data[31:0];
//                            unified_memory[proc2mem_addr[`XLEN-1:3]] = c.word_level;
//                        end
//					endcase
//				end
//			end
			
//			if((cycles_left[i]==16'd0) && waiting_for_bus[i] && !bus_filled) begin
//					bus_filled         = 1'b1;
//					next_mem2proc_tag  = i;
//					next_mem2proc_data = loaded_data[i];
//					waiting_for_bus[i] = 1'b0;
//			end
//		end
//		mem2proc_response <= `SD next_mem2proc_response;
//		mem2proc_data     <= `SD next_mem2proc_data;
//		mem2proc_tag      <= `SD next_mem2proc_tag;
//	end
//`endif //CACHE_MODE
//	// Initialise the entire memory
//	initial begin
//		for(int i=0; i<`MEM_64BIT_LINES; i=i+1) begin
//			unified_memory[i] = 64'h0;
//		end
//		mem2proc_data=64'bx;
//		mem2proc_tag=4'd0;
//		mem2proc_response=4'd0;
//		for(int i=1;i<=`NUM_MEM_TAGS;i=i+1) begin
//			loaded_data[i]=64'bx;
//			cycles_left[i]=16'd0;
//			waiting_for_bus[i]=1'b0;
//		end
//	end

//endmodule    // module mem
//`endif //__MEM_V__
