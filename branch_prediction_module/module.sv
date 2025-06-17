module branch_predictor (
    input wire clk,
    input wire reset,
    input wire [31:0] pc,          // ��ǰָ��PC
    input wire branch_taken,       // ʵ�ʷ�֧���������EX�׶Σ�
    input wire is_branch,          // ��ǰָ���Ƿ��Ƿ�֧
    input wire [31:0] actual_target_from_ex, // ����EX�׶εķ�֧Ŀ���ַ
    output wire prediction,        // Ԥ�ⷽ��1=TAKEN, 0=NOT TAKEN��
    output wire [31:0] pred_target // Ԥ��Ŀ���ַ����ѡ��
);

    // ---------- ��ģ���ź����� ----------
    wire loop_prediction;
    wire tage_prediction;
    wire use_loop_pred;

    // ---------- ʵ������ģ�� ----------
    loop_predictor loop_predictor_inst (
        .clk(clk),
        .reset(reset),
        .pc(pc),
        .branch_taken(branch_taken),
        .is_branch(is_branch),
        .prediction(loop_prediction),
        .loop_detected(use_loop_pred)  // Connected directly to use_loop_pred
    );

    tage_predictor tage_predictor_inst (
        .clk(clk),
        .reset(reset),
        .pc(pc),
        .branch_taken(branch_taken),
        .is_branch(is_branch),
        .prediction(tage_prediction)
    );

    // ---------- Ԥ��ѡ���߼� ----------
    // ����ʹ��Loop Predictor�������⵽ѭ����
    assign prediction = use_loop_pred ? loop_prediction : tage_prediction;

    // ---------- Ŀ���ַԤ�� ----------
    wire btb_hit;
    wire [31:0] btb_target;

    // ---------- ʵ����BTB ----------
    btb btb_inst (
        .clk(clk),
        .reset(reset),
        .pc(pc),
        .actual_target(actual_target_from_ex),
        .is_branch(is_branch),
        .branch_taken(branch_taken),
        .pred_target(btb_target),
        .btb_hit(btb_hit)
    );

    // ---------- Ԥ��Ŀ���߼� ----------
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

    // ---------- �������� ----------
    parameter NUM_TABLES = 4;      // 4����ʷ���ȱ��򻯰棩
    parameter int HISTORY_LEN [0:3] = '{1, 2, 4, 8}; // ���int��������

    // ---------- ȫ����ʷ�Ĵ��� ----------
    reg [63:0] global_history;
    always @(posedge clk) begin
        if (reset) 
            global_history <= 0;
        else if (is_branch)
            global_history <= {global_history[62:0], branch_taken};
    end

    // ---------- TAGE���� ----------
    reg [3:0] tage_tables [0:NUM_TABLES-1][0:1023]; // 10-bit������2-bit���ͼ�����+2-bit tag

    // ---------- Ԥ���߼� ----------
    wire [NUM_TABLES-1:0] tag_matches;
    wire [1:0] table_predictions [0:NUM_TABLES-1];
    wire [3:0] selected_table;     // ѡ����ƥ��ı�

    // ���в�ѯ���б�
    generate
        for (genvar i = 0; i < NUM_TABLES; i++) begin
            // ����������Tag���򻯣�PC XOR ��ʷƬ�Σ�
            wire [9:0] index = pc[9:0] ^ global_history[HISTORY_LEN[i]-1:0];
            wire [1:0] tag = pc[11:10] ^ global_history[1:0]; // ��tag
            
            // ���Tagƥ��
            assign tag_matches[i] = (tage_tables[i][index][1:0] == tag);
            assign table_predictions[i] = tage_tables[i][index][3:2]; // 2-bitԤ��
            
            // �����߼�����EX�׶�ȷ�Ϸ�֧�����
            always @(posedge clk) begin
                if (is_branch && tag_matches[i]) begin
                    // ���±��ͼ�����
                    if (branch_taken && (tage_tables[i][index][3:2] < 2'b11))
                        tage_tables[i][index][3:2] <= tage_tables[i][index][3:2] + 1;
                    else if (!branch_taken && (tage_tables[i][index][3:2] > 2'b00))
                        tage_tables[i][index][3:2] <= tage_tables[i][index][3:2] - 1;
                end
                // ��������Ŀ
                else if (is_branch && !tag_matches[i] && selected_table == i) begin
                    tage_tables[i][index][1:0] <= tag;
                    tage_tables[i][index][3:2] <= branch_taken ? 2'b11 : 2'b00;
                end
            end
        end
    endgenerate

    // ѡ�����ƥ����ʷ��
    assign selected_table = (tag_matches[3] ? 3 : 
                           (tag_matches[2] ? 2 : 
                           (tag_matches[1] ? 1 : 0)));

    // ���Ԥ���������λΪ����
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

    // ---------- ѭ��״̬��¼ ----------
    reg [31:0] loop_pc;            // ѭ����ʼ��PC
    reg [15:0] loop_count;         // ��ǰ��������
    reg [15:0] loop_max;           // �ܵ���������ѧϰ�õ���
    reg loop_active;               // �Ƿ���ѭ����

    assign loop_detected = loop_active;
    assign prediction = (loop_active && (loop_count < loop_max)) ? 1'b1 : 1'b0;

    always @(posedge clk) begin
        if (reset) begin
            loop_active <= 0;
            loop_count <= 0;
            loop_max <= 0;
        end else if (is_branch) begin
            // ���ѭ��ģʽ���򻯣�����������ͬPC��TAKEN��NOT TAKEN��
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
            // ����ѭ��Ԥ��
            loop_active <= (loop_max > 0) && (pc == loop_pc);
        end
    end
endmodule

module btb (
    input wire clk,
    input wire reset,
    input wire [31:0] pc,          // ��ǰָ��PC
    input wire [31:0] actual_target, // ʵ��Ŀ���ַ������EX�׶Σ�
    input wire is_branch,           // ��ǰָ���Ƿ��Ƿ�֧
    input wire branch_taken,        // ʵ�ʷ�֧����
    output wire [31:0] pred_target, // Ԥ���Ŀ���ַ
    output wire btb_hit             // BTB�Ƿ�����
);
    parameter BTB_ENTRIES = 64;        // BTB��Ŀ��������2���ݴΣ�
    parameter BTB_INDEX_BITS = 6;      // log2(BTB_ENTRIES)
    parameter TAG_BITS = 20;           // ��ǩλ��PC��λ��
    // ---------- BTB��ṹ ----------
    reg [TAG_BITS-1:0] tag [0:BTB_ENTRIES-1];  // ��ǩ��PC��λ��
    reg [31:0] target [0:BTB_ENTRIES-1];       // Ŀ���ַ
    reg valid [0:BTB_ENTRIES-1];               // ��Чλ

    // ---------- �������� ----------
    wire [BTB_INDEX_BITS-1:0] index = pc[BTB_INDEX_BITS+1:2]; // ����PC��2λ�����룩
    wire [TAG_BITS-1:0] current_tag = pc[31:32-TAG_BITS];     // ��ȡPC��λ��ΪTag

    // ---------- ��ѯ�߼� ----------
    assign btb_hit = (valid[index] && (tag[index] == current_tag));
    assign pred_target = btb_hit ? target[index] : pc + 4;    // δ����ʱĬ��PC+4

    // ---------- �����߼� ----------
    always @(posedge clk) begin
        if (reset) begin
            for (integer i = 0; i < BTB_ENTRIES; i++) begin
                valid[i] <= 0;
                tag[i] <= 0;
                target[i] <= 0;
            end
        end 
        else if (is_branch && branch_taken) begin
            // ����BTB��Ŀ�������Ƿ����У�
            tag[index] <= current_tag;
            target[index] <= actual_target;
            valid[index] <= 1'b1;
        end
    end
endmodule