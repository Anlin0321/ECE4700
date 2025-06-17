`timescale 1ns/1ps

module branch_predictor_tb ();

    
    reg clk = 0;
    reg reset = 1;
    always #5 clk = ~clk; 

    
    reg [31:0] pc;
    reg branch_taken_actual; 
    reg is_branch;
    reg [31:0] actual_target_from_ex; 
    wire prediction;         
    wire [31:0] pred_target; 

    
    integer total_branches = 0;
    integer correct_predictions = 0;
    real accuracy;

    
    branch_predictor uut (
        .clk(clk),
        .reset(reset),  
        .pc(pc),
        .branch_taken(branch_taken_actual),
        .is_branch(is_branch),
        .actual_target_from_ex(actual_target_from_ex), 
        .prediction(prediction),
        .pred_target(pred_target)
    );

    
    initial begin
        
        reset = 1;
        #20 reset = 0;

        
        $display("=== Testing Loop Branch ===");
        test_loop_branch(100); 

        
        $display("=== Testing Random Branch ===");
        test_random_branch(100);

        
        $display("=== Testing Indirect Jump ===");
        test_indirect_jump(100);

        
        accuracy = (real'(correct_predictions) / total_branches) * 100;
        $display("\n=== Final Accuracy: %.2f%% (%0d/%0d) ===", 
                accuracy, correct_predictions, total_branches);
        $finish;
    end

    

    
    task test_loop_branch(input integer iterations);
        pc = 32'h8000_0000;
        is_branch = 1;
        actual_target_from_ex = 32'h8000_0010; 
        for (integer i = 0; i <= iterations; i++) begin
            branch_taken_actual = (i < iterations) ? 1 : 0; 
            #10;
            check_prediction();
            $display("PC=%h, Actual=%b, Pred=%b, Target=%h", 
                    pc, branch_taken_actual, prediction, pred_target);
        end
    endtask

    
    task test_random_branch(input integer num_branches);
        pc = 32'h9000_0000;
        is_branch = 1;
        actual_target_from_ex = 32'h9000_0010; 
        for (integer i = 0; i < num_branches; i++) begin
            pc = pc + 4;
            branch_taken_actual = $random % 2; 
            #10;
            check_prediction();
            $display("PC=%h, Actual=%b, Pred=%b", 
                    pc, branch_taken_actual, prediction);
        end
    endtask

    
    task test_indirect_jump(input integer num_calls);
        pc = 32'hA000_0000;
        is_branch = 1;
        for (integer i = 0; i < num_calls; i++) begin
            branch_taken_actual = 1;
            
            case (i)
                0: actual_target_from_ex = 32'hA000_0100;
                1: actual_target_from_ex = 32'hA000_0200;
                2: actual_target_from_ex = 32'hA000_0300;
            endcase
            #10;
            check_prediction();
            $display("PC=%h, Actual Target=%h, Pred Target=%h", 
                    pc, actual_target_from_ex, pred_target);
            pc = actual_target_from_ex;
        end
    endtask

    
    task check_prediction();
        total_branches += 1;
        if (prediction === branch_taken_actual) begin
            correct_predictions += 1;
        end
        
        if (branch_taken_actual && (pred_target !== actual_target_from_ex)) begin
            $display("ERROR: Target Mismatch!");
        end
    endtask

endmodule