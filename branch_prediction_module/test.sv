`timescale 1ns/1ps

module branch_predictor_tb ();

    // ---------- Clock and Reset Signals ----------
    reg clk = 0;
    reg reset = 1;
    always #5 clk = ~clk; // 100MHz clock

    // ---------- Branch Predictor Interface ----------
    reg [31:0] pc;
    reg branch_taken_actual; // Actual branch result
    reg is_branch;
    reg [31:0] actual_target_from_ex; // Added this missing signal
    wire prediction;         // Prediction direction
    wire [31:0] pred_target; // Predicted target

    // ---------- Test Statistics ----------
    integer total_branches = 0;
    integer correct_predictions = 0;
    real accuracy;

    // ---------- Instantiate Unit Under Test ----------
    branch_predictor uut (
        .clk(clk),
        .reset(reset),  // Fixed typo: was reset -> reset
        .pc(pc),
        .branch_taken(branch_taken_actual),
        .is_branch(is_branch),
        .actual_target_from_ex(actual_target_from_ex), // Added this connection
        .prediction(prediction),
        .pred_target(pred_target)
    );

    // ---------- Main Test Logic ----------
    initial begin
        // Initialization
        reset = 1;
        #20 reset = 0;

        // Test 1: Simple Loop (Regular Pattern)
        $display("=== Testing Loop Branch ===");
        test_loop_branch(100); // Loop 4 times

        // Test 2: Random Branch (Random Pattern)
        $display("=== Testing Random Branch ===");
        test_random_branch(100);

        // Test 3: Indirect Jump (Simulating Function Calls)
        $display("=== Testing Indirect Jump ===");
        test_indirect_jump(100);

        // Output accuracy
        accuracy = (real'(correct_predictions) / total_branches) * 100;
        $display("\n=== Final Accuracy: %.2f%% (%0d/%0d) ===", 
                accuracy, correct_predictions, total_branches);
        $finish;
    end

    // ---------- Test Task Definitions ----------

    // Test 1: Loop Branch (Fixed Iterations)
    task test_loop_branch(input integer iterations);
        pc = 32'h8000_0000;
        is_branch = 1;
        actual_target_from_ex = 32'h8000_0010; // Set target address
        for (integer i = 0; i <= iterations; i++) begin
            branch_taken_actual = (i < iterations) ? 1 : 0; // Last iteration doesn't jump
            #10;
            check_prediction();
            $display("PC=%h, Actual=%b, Pred=%b, Target=%h", 
                    pc, branch_taken_actual, prediction, pred_target);
        end
    endtask

    // Test 2: Random Branch (Random Pattern)
    task test_random_branch(input integer num_branches);
        pc = 32'h9000_0000;
        is_branch = 1;
        actual_target_from_ex = 32'h9000_0010; // Set target address
        for (integer i = 0; i < num_branches; i++) begin
            pc = pc + 4;
            branch_taken_actual = $random % 2; // Randomly generate 0 or 1
            #10;
            check_prediction();
            $display("PC=%h, Actual=%b, Pred=%b", 
                    pc, branch_taken_actual, prediction);
        end
    endtask

    // Test 3: Indirect Jump (Simulating Function Calls)
    task test_indirect_jump(input integer num_calls);
        pc = 32'hA000_0000;
        is_branch = 1;
        for (integer i = 0; i < num_calls; i++) begin
            branch_taken_actual = 1;
            // Simulate jumps to different targets
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

    // ---------- Prediction Result Check ----------
    task check_prediction();
        total_branches += 1;
        if (prediction === branch_taken_actual) begin
            correct_predictions += 1;
        end
        // Optional: Check target address (if BTB is enabled)
        if (branch_taken_actual && (pred_target !== actual_target_from_ex)) begin
            $display("ERROR: Target Mismatch!");
        end
    endtask

endmodule