/////////////////////////////////////////////////////////////////////////
//                                                                     //
//                                                                     //
//   Modulename :  testbench.v                                         //
//                                                                     //
//  Description :  Testbench module for the verisimple pipeline;       //
//                 Enhanced with branch prediction accuracy tracking   //
//                                                                     //
/////////////////////////////////////////////////////////////////////////

`timescale 1ns/100ps

import "DPI-C" function void print_header(string str);
import "DPI-C" function void print_cycles();
import "DPI-C" function void print_stage(string div, int inst, int npc, int valid_inst);
import "DPI-C" function void print_reg(int wb_reg_wr_data_out_hi, int wb_reg_wr_data_out_lo,
                                       int wb_reg_wr_idx_out, int wb_reg_wr_en_out);
import "DPI-C" function void print_membus(int proc2mem_command, int mem2proc_response,
                                          int proc2mem_addr_hi, int proc2mem_addr_lo,
						 			     int proc2mem_data_hi, int proc2mem_data_lo);
import "DPI-C" function void print_close();

module testbench;

    // variables used in the testbench
    logic        clock;
    logic        reset;
    logic [31:0] clock_count;
    logic [31:0] instr_count;
    logic [63:0] debug_counter;  // counter for timeout
    
    // Branch prediction accuracy tracking variables
    logic [31:0] total_branches;
    logic [31:0] correct_predictions;
    logic [31:0] incorrect_predictions;
    real         prediction_accuracy;
    
    // Superscalar memory interfaces
    // Instruction Cache Interface
    logic [`ISSUE_WIDTH-1:0] [1:0]          proc2Icache_command; 
    logic [`ISSUE_WIDTH-1:0] [`XLEN-1:0]    proc2Icache_addr;
    logic [`ISSUE_WIDTH-1:0] [3:0]          mem2Icache_response;
    logic [`ISSUE_WIDTH-1:0] [63:0]         mem2Icache_data;
    logic [`ISSUE_WIDTH-1:0] [3:0]          mem2Icache_tag;
    
    // Data Cache Interface
    logic [`ISSUE_WIDTH-1:0] [1:0]   proc2Dcache_command;
    logic [`ISSUE_WIDTH-1:0] [`XLEN-1:0]    proc2Dcache_addr;
    logic [`ISSUE_WIDTH-1:0] [63:0]         proc2Dcache_data;
    logic [`ISSUE_WIDTH-1:0] [3:0]          mem2Dcache_response;
    logic [`ISSUE_WIDTH-1:0] [63:0]         mem2Dcache_data;
    logic [`ISSUE_WIDTH-1:0] [3:0]          mem2Dcache_tag;
`ifndef CACHE_MODE
    MEM_SIZE [`ISSUE_WIDTH-1:0]      proc2Dcache_size;
`endif

    logic  [$clog2(`ISSUE_WIDTH+1)-1:0] pipeline_completed_insts;
    EXCEPTION_CODE   pipeline_error_status;
    
    // Branch prediction accuracy signals - these need to be connected to your pipeline
    // You'll need to add these outputs to your pipeline module
    logic [`ISSUE_WIDTH-1:0] branch_resolved;     // Signal indicating a branch was resolved
    logic [`ISSUE_WIDTH-1:0] branch_mispredicted; // Signal indicating branch was mispredicted
    logic [`ISSUE_WIDTH-1:0] branch_taken;        // Actual branch outcome
    logic [`ISSUE_WIDTH-1:0] branch_predicted;    // Predicted branch outcome

    // Instantiate the Pipeline
    pipeline_bp core(
        // Inputs
        .clk                (clock),
        .rst                (reset),
        
        // I-cache Interface
        .proc2Icache_command(proc2Icache_command),
        .proc2Icache_addr   (proc2Icache_addr),
        .mem2Icache_response(mem2Icache_response),
        .mem2Icache_data    (mem2Icache_data),
        .mem2Icache_tag     (mem2Icache_tag),
        
        // D-cache Interface
        .proc2Dcache_command(proc2Dcache_command),
        .proc2Dcache_addr   (proc2Dcache_addr),
        .proc2Dcache_data   (proc2Dcache_data),
`ifndef CACHE_MODE
        .proc2Dcache_size   (proc2Dcache_size),
`endif
        .mem2Dcache_response(mem2Dcache_response),
        .mem2Dcache_data    (mem2Dcache_data),
        .mem2Dcache_tag     (mem2Dcache_tag),
        
        .pipeline_completed_insts(pipeline_completed_insts),
        .pipeline_error_status(pipeline_error_status)
        
        // Branch prediction accuracy outputs - ADD THESE TO YOUR PIPELINE MODULE
        // .branch_resolved(branch_resolved),
        // .branch_mispredicted(branch_mispredicted),
        // .branch_taken(branch_taken),
        // .branch_predicted(branch_predicted)
    );
    
    // Instantiate the Instruction Memory
    passthru_mem mem (
        // Inputs
        .clk               (clock),
        .proc2Imem_command  (proc2Icache_command),
        .proc2Imem_addr     (proc2Icache_addr),

        // Outputs
        .mem2Iproc_response (mem2Icache_response),
        .mem2Iproc_data     (mem2Icache_data),
        .mem2Iproc_tag      (mem2Icache_tag),

        // Inputs
        .proc2Dmem_command  (proc2Dcache_command),
        .proc2Dmem_addr     (proc2Dcache_addr),
        .proc2Dmem_data     (proc2Dcache_data),

        // Outputs
        .mem2Dproc_response (mem2Dcache_response),
        .mem2Dproc_data     (mem2Dcache_data),
        .mem2Dproc_tag      (mem2Dcache_tag),
        
        `ifndef CACHE_MODE
        .proc2Dmem_size     (proc2Dcache_size)
        `endif
    );
    
    // Generate System Clock
    always begin
        #(`VERILOG_CLOCK_PERIOD/2.0);
        clock = ~clock;
    end
    
    // Task to display # of elapsed clock edges
    task show_clk_count;
        real cpi;
        
        begin
            cpi = (clock_count + 1.0) / instr_count;
            $display("@@  %0d cycles / %0d instrs = %f CPI\n@@",
                      clock_count+1, instr_count, cpi);
            $display("@@  %4.2f ns total time to execute\n@@\n",
                      clock_count*`VERILOG_CLOCK_PERIOD);
        end
    endtask  // task show_clk_count 
    
    // Task to display branch prediction accuracy
    task show_bp_accuracy;
        begin
            if (total_branches > 0) begin
                prediction_accuracy = (correct_predictions * 100.0) / total_branches;
                $display("@@");
                $display("@@  Branch Prediction Statistics:");
                $display("@@  Total Branches:        %0d", total_branches);
                $display("@@  Correct Predictions:   %0d", correct_predictions);
                $display("@@  Incorrect Predictions: %0d", incorrect_predictions);
                $display("@@  Prediction Accuracy:   %0.2f%%", prediction_accuracy);
                $display("@@");
            end else begin
                $display("@@  No branch instructions executed");
            end
        end
    endtask  // task show_bp_accuracy
    
    // Simulate memory
    string program_name = "testbench1.mem";

    task automatic load_program;
        $readmemh(program_name, mem.instr_memory);
    endtask

    task automatic clear_dmem;
        for (int i=0; i<`MEM_64BIT_LINES; i++)
            mem.data_memory[i] = 64'h0;
    endtask

    // Task to display memory contents
    task show_mem_with_decimal;
        input [31:0] start_addr;
        input [31:0] end_addr;
        int showing_data;
        begin
            $display("@@@");
            showing_data=0;
            for(int k=start_addr;k<=end_addr; k=k+1)
                if (mem.data_memory[k] != 0) begin
                    $display("@@@ dmem[%5d] = %x : %0d", k*8, mem.data_memory[k], 
                                                        mem.data_memory[k]);
                    showing_data=1;
                end else if(showing_data!=0) begin
                    $display("@@@");
                    showing_data=0;
                end
            $display("@@@");
        end
    endtask  // task show_mem_with_decimal
    
    initial begin
        $dumpvars;
    
        clock = 1'b0;
        reset = 1'b0;
        debug_counter = 0;
        clock_count = 0;
        
        // Initialize branch prediction tracking variables
        total_branches = 0;
        correct_predictions = 0;
        incorrect_predictions = 0;
        prediction_accuracy = 0.0;
        
        // Pulse the reset signal
        $display("@@\n@@\n@@  %t  Asserting System reset......", $realtime);
        reset = 1'b1;
        @(posedge clock);
        @(posedge clock);
        
        // Load program into instruction memory
        load_program();
        // Initialize data memory to zeros
        clear_dmem();
        
        @(posedge clock);
        @(posedge clock);
        `SD;
        // This reset is at an odd time to avoid the pos & neg clock edges
        
        reset = 1'b0;
        $display("@@  %t  Deasserting System reset......\n@@\n@@", $realtime);
    end

    // Cycle counter
    always @(posedge clock) begin
        if(reset) begin
            clock_count <= `SD 0;
            instr_count <= `SD 0;
        end else begin
            clock_count <= `SD (clock_count + 1);
            instr_count <= `SD (instr_count + pipeline_completed_insts);
        end
    end  
    
    // Branch prediction accuracy tracking logic
    always @(posedge clock) begin
        if (reset) begin
            total_branches <= `SD 0;
            correct_predictions <= `SD 0;
            incorrect_predictions <= `SD 0;
        end else begin
            // Count resolved branches across all issue slots
            for (int i = 0; i < `ISSUE_WIDTH; i++) begin
                if (branch_resolved[i]) begin
                    total_branches <= `SD total_branches + 1;
                    
                    // Check if prediction was correct
                    if (branch_mispredicted[i]) begin
                        incorrect_predictions <= `SD incorrect_predictions + 1;
                        // Optional: Display misprediction information
                        $display("@@  Cycle %0d: Branch misprediction detected (slot %0d)", 
                                clock_count, i);
                    end else begin
                        correct_predictions <= `SD correct_predictions + 1;
                    end
                end
            end
        end
    end
    
    // Optional: Real-time branch prediction accuracy display
    always @(posedge clock) begin
        if (!reset && total_branches > 0 && (total_branches % 100 == 0)) begin
            // Display accuracy every 100 branches
            prediction_accuracy = (correct_predictions * 100.0) / total_branches;
            $display("@@  Cycle %0d: Current BP Accuracy: %0.2f%% (%0d/%0d)", 
                    clock_count, prediction_accuracy, correct_predictions, total_branches);
        end
    end
    
    // Timeout and termination logic
    always @(negedge clock) begin
        if(reset) begin
            $display("@@\n@@  %t : System STILL at reset, can't show anything\n@@",
                     $realtime);
            debug_counter <= 0;
        end else begin
            `SD;
            `SD;
            
            // Terminate simulation after timeout
            if(pipeline_error_status != NO_ERROR || debug_counter > 50000000) begin
                $display("@@@ Unified Memory contents hex on left, decimal on right: ");
                show_mem_with_decimal(0,`MEM_64BIT_LINES - 1); 
                // 8Bytes per line, 16kB total
                
                $display("@@  %t : System halted\n@@", $realtime);
                
                case(pipeline_error_status)
                    LOAD_ACCESS_FAULT:  
                        $display("@@@ System halted on memory error");
                    HALTED_ON_WFI:          
                        $display("@@@ System halted on WFI instruction");
                    ILLEGAL_INST:
                        $display("@@@ System halted on illegal instruction");
                    default: 
                        $display("@@@ System halted on unknown error code %x", 
                            pipeline_error_status);
                endcase
                $display("@@@\n@@");

                // Count the completed instr from the final cycle
                instr_count = (instr_count + pipeline_completed_insts);
                show_clk_count;
                
                // Display branch prediction accuracy statistics
                show_bp_accuracy;
                
                #100 $finish;
            end
            debug_counter <= debug_counter + 1;
        end
    end 

endmodule  // module testbench