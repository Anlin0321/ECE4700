`timescale 1ns/1ps

module branch_predictor_tb ();

    // ---------- 时钟和复位信号 ----------
    reg clk = 0;
    reg reset = 1;
    always #5 clk = ~clk; // 100MHz时钟

    // ---------- 分支预测器接口 ----------
    reg [31:0] pc;
    reg branch_taken_actual; // 实际分支结果
    reg is_branch;
    wire prediction;         // 预测方向
    wire [31:0] pred_target; // 预测目标

    // ---------- 测试统计 ----------
    integer total_branches = 0;
    integer correct_predictions = 0;
    real accuracy;

    // ---------- 实例化被测模块 ----------
    branch_predictor uut (
        .clk(clk),
        .reset(reset),
        .pc(pc),
        .branch_taken(branch_taken_actual),
        .is_branch(is_branch),
        .prediction(prediction),
        .pred_target(pred_target)
    );

    // ---------- 测试主逻辑 ----------
    initial begin
        // 初始化
        reset = 1;
        #20 reset = 0;

        // 测试1：简单循环（规律性分支）
        $display("=== Testing Loop Branch ===");
        test_loop_branch(4); // 循环4次

        // 测试2：不规则分支（随机模式）
        $display("=== Testing Random Branch ===");
        test_random_branch(20);

        // 测试3：间接跳转（模拟虚函数调用）
        $display("=== Testing Indirect Jump ===");
        test_indirect_jump(3);

        // 输出准确率
        accuracy = (real'(correct_predictions) / total_branches) * 100;
        $display("\n=== Final Accuracy: %.2f%% (%0d/%0d) ===", 
                accuracy, correct_predictions, total_branches);
        $finish;
    end

    // ---------- 测试任务定义 ----------

    // 测试1：循环分支（固定迭代次数）
    task test_loop_branch(input integer iterations);
        pc = 32'h8000_0000;
        is_branch = 1;
        for (integer i = 0; i <= iterations; i++) begin
            branch_taken_actual = (i < iterations) ? 1 : 0; // 最后一次不跳转
            #10;
            check_prediction();
            $display("PC=%h, Actual=%b, Pred=%b, Target=%h", 
                    pc, branch_taken_actual, prediction, pred_target);
        end
    endtask

    // 测试2：不规则分支（随机模式）
    task test_random_branch(input integer num_branches);
        pc = 32'h9000_0000;
        is_branch = 1;
        for (integer i = 0; i < num_branches; i++) begin
            pc = pc + 4;
            branch_taken_actual = $random % 2; // 随机生成0或1
            #10;
            check_prediction();
            $display("PC=%h, Actual=%b, Pred=%b", 
                    pc, branch_taken_actual, prediction);
        end
    endtask

    // 测试3：间接跳转（模拟虚函数调用）
    task test_indirect_jump(input integer num_calls);
        pc = 32'hA000_0000;
        is_branch = 1;
        for (integer i = 0; i < num_calls; i++) begin
            branch_taken_actual = 1;
            // 模拟跳转到不同目标
            case (i)
                0: branch_target = 32'hA000_0100;
                1: branch_target = 32'hA000_0200;
                2: branch_target = 32'hA000_0300;
            endcase
            #10;
            check_prediction();
            $display("PC=%h, Actual Target=%h, Pred Target=%h", 
                    pc, branch_target, pred_target);
            pc = branch_target;
        end
    endtask

    // ---------- 预测结果检查 ----------
    task check_prediction();
        total_branches += 1;
        if (prediction === branch_taken_actual) begin
            correct_predictions += 1;
        end
        // 可选：检查目标地址（如果BTB使能）
        if (branch_taken_actual && (pred_target !== branch_target)) begin
            $display("ERROR: Target Mismatch!");
        end
    endtask

endmodule