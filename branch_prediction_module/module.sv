module branch_predictor (
    input wire clk,
    input wire reset,
    input wire [31:0] pc,          // 当前指令PC
    input wire branch_taken,       // 实际分支结果（来自EX阶段）
    input wire is_branch,          // 当前指令是否是分支
    output wire prediction,        // 预测方向（1=TAKEN, 0=NOT TAKEN）
    output wire [31:0] pred_target // 预测目标地址（可选）
);

    // ---------- 子模块信号声明 ----------
    wire loop_prediction;
    wire tage_prediction;
    wire use_loop_pred;

    // ---------- 实例化子模块 ----------
    loop_predictor loop_predictor_inst (
        .clk(clk),
        .reset(reset),
        .pc(pc),
        .branch_taken(branch_taken),
        .is_branch(is_branch),
        .prediction(loop_prediction)
    );

    tage_predictor tage_predictor_inst (
        .clk(clk),
        .reset(reset),
        .pc(pc),
        .branch_taken(branch_taken),
        .is_branch(is_branch),
        .prediction(tage_prediction)
    );

    // ---------- 预测选择逻辑 ----------
    // 优先使用Loop Predictor（如果检测到循环）
    assign use_loop_pred = (loop_predictor_inst.loop_detected);
    assign prediction = use_loop_pred ? loop_prediction : tage_prediction;

    // ---------- 目标地址预测（可选） ----------
    // 此处可添加BTB（Branch Target Buffer）模块
    wire btb_hit;
    wire [31:0] btb_target;

    // ---------- 实例化BTB ----------
    btb btb_inst (
        .clk(clk),
        .reset(reset),
        .pc(pc),
        .actual_target(actual_target_from_ex), // 来自EX阶段
        .is_branch(is_branch),
        .branch_taken(branch_taken),
        .pred_target(btb_target),
        .btb_hit(btb_hit)
    );

    // ---------- 预测目标逻辑 ----------
    assign pred_target = (prediction && btb_hit) ? btb_target : pc + 4;

endmodule


module tage_predictor (
    input wire clk,
    input wire reset,
    input wire [31:0] pc,
    input wire branch_taken,
    input wire is_branch,
    output wire prediction
);

    // ---------- 参数配置 ----------
    parameter NUM_TABLES = 4;      // 4个历史长度表（简化版）
    parameter HISTORY_LEN [0:3] = '{1, 2, 4, 8}; // 几何级数历史长度

    // ---------- 全局历史寄存器 ----------
    reg [63:0] global_history;
    always @(posedge clk) begin
        if (reset) 
            global_history <= 0;
        else if (is_branch)
            global_history <= {global_history[62:0], branch_taken};
    end

    // ---------- TAGE表定义 ----------
    reg [1:0] tage_tables [0:NUM_TABLES-1][0:1023]; // 10-bit索引，2-bit饱和计数器

    // ---------- 预测逻辑 ----------
    wire [NUM_TABLES-1:0] tag_matches;
    wire [1:0] table_predictions [0:NUM_TABLES-1];
    wire [3:0] selected_table;     // 选择最匹配的表

    // 并行查询所有表
    generate
        for (genvar i = 0; i < NUM_TABLES; i++) begin
            // 计算索引和Tag（简化：PC XOR 历史片段）
            wire [9:0] index = pc[9:0] ^ global_history[HISTORY_LEN[i]-1:0];
            wire [15:0] tag = pc[25:10] ^ global_history[63:48];
            
            // 检查Tag匹配
            assign tag_matches[i] = (tage_tables[i][index][1:0] == tag[1:0]);
            assign table_predictions[i] = tage_tables[i][index][2:1]; // 2-bit预测
            
            // 更新逻辑（在EX阶段确认分支结果后）
            always @(posedge clk) begin
                if (is_branch && tag_matches[i]) begin
                    // 更新饱和计数器
                    if (branch_taken && (tage_tables[i][index][2:1] < 2'b11))
                        tage_tables[i][index][2:1] <= tage_tables[i][index][2:1] + 1;
                    else if (!branch_taken && (tage_tables[i][index][2:1] > 2'b00))
                        tage_tables[i][index][2:1] <= tage_tables[i][index][2:1] - 1;
                end
            end
        end
    endgenerate

    // 选择最长的匹配历史表
    assign selected_table = (tag_matches[3] ? 3 : 
                           (tag_matches[2] ? 2 : 
                           (tag_matches[1] ? 1 : 0)));

    // 输出预测结果（最高位为方向）
    assign prediction = table_predictions[selected_table][1];

endmodule


module loop_predictor (
    input wire clk,
    input wire reset,
    input wire [31:0] pc,
    input wire branch_taken,
    input wire is_branch,
    output wire prediction,
    output wire loop_detected
);

    // ---------- 循环状态记录 ----------
    reg [31:0] loop_pc;            // 循环开始的PC
    reg [15:0] loop_count;         // 当前迭代次数
    reg [15:0] loop_max;           // 总迭代次数（学习得到）
    reg loop_active;               // 是否处于循环中

    assign loop_detected = loop_active;
    assign prediction = (loop_active && (loop_count < loop_max)) ? 1'b1 : 1'b0;

    always @(posedge clk) begin
        if (reset) begin
            loop_active <= 0;
            loop_count <= 0;
        end else if (is_branch) begin
            // 检测循环模式（简化：连续两次相同PC的TAKEN→NOT TAKEN）
            if (!loop_active && branch_taken) begin
                loop_pc <= pc;
                loop_count <= 1;
            end else if (loop_active && (pc == loop_pc)) begin
                if (branch_taken)
                    loop_count <= loop_count + 1;
                else begin
                    loop_max <= loop_count;
                    loop_count <= 0;
                end
            end
            // 激活循环预测
            loop_active <= (loop_max > 0) && (pc == loop_pc);
        end
    end
endmodule

module btb (
    input wire clk,
    input wire reset,
    input wire [31:0] pc,          // 当前指令PC
    input wire [31:0] actual_target, // 实际目标地址（来自EX阶段）
    input wire is_branch,           // 当前指令是否是分支
    input wire branch_taken,        // 实际分支方向
    output wire [31:0] pred_target, // 预测的目标地址
    output wire btb_hit             // BTB是否命中
);
    parameter BTB_ENTRIES = 64;        // BTB条目数（建议2的幂次）
    parameter BTB_INDEX_BITS = 6;      // log2(BTB_ENTRIES)
    parameter TAG_BITS = 20;           // 标签位宽（PC高位）
    // ---------- BTB表结构 ----------
    reg [TAG_BITS-1:0] tag [0:BTB_ENTRIES-1];  // 标签（PC高位）
    reg [31:0] target [0:BTB_ENTRIES-1];       // 目标地址
    reg valid [0:BTB_ENTRIES-1];               // 有效位

    // ---------- 索引计算 ----------
    wire [BTB_INDEX_BITS-1:0] index = pc[BTB_INDEX_BITS+1:2]; // 忽略PC低2位（对齐）
    wire [TAG_BITS-1:0] current_tag = pc[31:32-TAG_BITS];     // 提取PC高位作为Tag

    // ---------- 查询逻辑 ----------
    assign btb_hit = (valid[index] && (tag[index] == current_tag));
    assign pred_target = btb_hit ? target[index] : pc + 4;    // 未命中时默认PC+4

    // ---------- 更新逻辑 ----------
    always @(posedge clk) begin
        if (reset) begin
            for (integer i = 0; i < BTB_ENTRIES; i++) begin
                valid[i] <= 0;
                tag[i] <= 0;
                target[i] <= 0;
            end
        end 
        else if (is_branch && branch_taken) begin
            // 更新BTB条目（无论是否命中）
            tag[index] <= current_tag;
            target[index] <= actual_target;
            valid[index] <= 1'b1;
        end
    end

endmodule