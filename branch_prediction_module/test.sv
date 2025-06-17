`timescale 1ns/1ps

module branch_predictor_tb();

    
    reg clk = 0;
    reg reset = 1;
    always #5 clk = ~clk; 

    
    reg [31:0] pc;
    reg [31:0] instruction;       
    reg branch_taken_actual;      
    reg is_branch_actual;         
    wire prediction;              
    wire is_branch_predicted;     

    
    integer total_branches = 0;
    integer correct_predictions = 0;
    integer correct_branch_detection = 0;
    real accuracy;
    real detection_accuracy;

    
    branch_predictor uut (
        .clk(clk),
        .reset(reset),
        .pc(pc),
        .instruction(instruction),
        .branch_taken_actual(branch_taken_actual),
        .is_branch_actual(is_branch_actual),
        .prediction(prediction),
        .is_branch_predicted(is_branch_predicted)
    );

    
    initial begin
        
        reset = 1;
        #20 reset = 0;

        $display("\n=== Start testing ===");
        
        
        $display("\n=== Test 1: Fixed Branch===");
        test_conditional_branch(10);

        
        $display("\n=== Test 2: JAL ===");
        test_jal_instructions(5);

        
        $display("\n=== Test3: JALR ===");
        test_jalr_instructions(5);

        
        $display("\n=== Test4: Combined ===");
        test_mixed_instructions(20);

        
        accuracy = (real'(correct_predictions) / total_branches) * 100;
        detection_accuracy = (real'(correct_branch_detection) / total_branches) * 100;
        
        $display("\n=== Results ===");
        $display("Branch Detection Accuracy: %.2f%% (%0d/%0d)", 
                detection_accuracy, correct_branch_detection, total_branches);
        $display("Branch Prediction Accuracy: %.2f%% (%0d/%0d)", 
                accuracy, correct_predictions, total_branches);
        $finish;
    end

    

    
    task test_conditional_branch(input integer num_branches);
        pc = 32'h8000_0000;
        
        instruction = {7'b0, 5'd1, 5'd2, 3'b000, 4'b0, 1'b1, 1'b1, 1'b0, 1'b0, 1'b1, 1'b1}; 
        
        for (integer i = 0; i < num_branches; i++) begin
            pc = pc + 4;
            
            branch_taken_actual = (i < 8) ? 1 : 0;
            is_branch_actual = 1;
            
            #10;
            check_results();
            
            $display("PC=%h | Actual: %b | Predict: %b | Instruction Predicted: %b", 
                    pc, branch_taken_actual, prediction, is_branch_predicted);
        end
    endtask

    
    task test_jal_instructions(input integer num_jumps);
        pc = 32'h9000_0000;
        
        instruction = {12'h100, 5'd1, 7'b1101111}; 
        
        for (integer i = 0; i < num_jumps; i++) begin
            pc = pc + 4;
            branch_taken_actual = 1; 
            is_branch_actual = 1;
            
            #10;
            check_results();
            
            $display("PC=%h | JAL | Predict: %b | Instruction Predicted: %b", 
                    pc, prediction, is_branch_predicted);
        end
    endtask

    
    task test_jalr_instructions(input integer num_jumps);
        pc = 32'hA000_0000;
        
        instruction = {12'h0, 5'd2, 3'b0, 5'd1, 7'b1100111}; 
        
        for (integer i = 0; i < num_jumps; i++) begin
            pc = pc + 4;
            branch_taken_actual = 1; 
            is_branch_actual = 1;
            
            #10;
            check_results();
            
            $display("PC=%h | JALR | Predict: %b | Instruction Predicted: %b", 
                    pc, prediction, is_branch_predicted);
        end
    endtask

    
    task test_mixed_instructions(input integer num_instructions);
        automatic integer branch_counter = 0;
        
        for (integer i = 0; i < num_instructions; i++) begin
            pc = pc + 4;
            
            
            case ($urandom % 4)
                0: begin 
                    instruction = {12'h0, 5'd1, 5'd2, 3'b0, 5'd3, 7'b0110011}; 
                    branch_taken_actual = 0;
                    is_branch_actual = 0;
                end
                1: begin 
                    instruction = {7'b0, 5'd1, 5'd2, 3'b000, 4'b0, 1'b1, 1'b1, 1'b0, 1'b0, 1'b1, 1'b1}; 
                    branch_taken_actual = $random % 2;
                    is_branch_actual = 1;
                    branch_counter++;
                end
                2: begin 
                    instruction = {12'h100, 5'd1, 7'b1101111}; 
                    branch_taken_actual = 1;
                    is_branch_actual = 1;
                    branch_counter++;
                end
                3: begin 
                    instruction = {12'h0, 5'd2, 3'b0, 5'd1, 7'b1100111}; 
                    branch_taken_actual = 1;
                    is_branch_actual = 1;
                    branch_counter++;
                end
            endcase
            
            #10;
            if (is_branch_actual) check_results();
            
            $display("PC=%h | Type: %s | Actual: %b | Predict: %b | Instruction predicted: %b", 
                    pc, get_inst_type(instruction), 
                    branch_taken_actual, prediction, is_branch_predicted);
        end
        
        total_branches += branch_counter;
    endtask

    
    task check_results();
        total_branches += 1;
        
        
        if (is_branch_predicted == is_branch_actual) begin
            correct_branch_detection += 1;
        end else begin
            $display("Error: Fail to detect branch, PC=%h", pc);
        end
        
        
        if (is_branch_actual && (prediction === branch_taken_actual)) begin
            correct_predictions += 1;
        end else if (is_branch_actual) begin
            $display("Error: Wrong prediction, PC=%h Actual: %b Predict: %b", 
                     pc, branch_taken_actual, prediction);
        end
    endtask

    
    function string get_inst_type(input [31:0] inst);
        case (inst[6:0])
            7'b1100011: return "Branch";
            7'b1101111: return "JAL     ";
            7'b1100111: return "JALR    ";
            default:    return "Non-branch  ";
        endcase
    endfunction

endmodule