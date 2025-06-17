module branch_predictor (
    input wire clk,
    input wire reset,
    input wire [31:0] pc,               
    input wire [31:0] instruction,      
    input wire branch_taken_actual,     
    input wire is_branch_actual,        
    output wire prediction,             
    output wire is_branch_predicted      
);

    
    wire [6:0] opcode = instruction[6:0];
    wire is_branch_inst = (opcode == 7'b1100011); 
    wire is_jal_inst = (opcode == 7'b1101111);    
    wire is_jalr_inst = (opcode == 7'b1100111);   
    
    
    assign is_branch_predicted = is_branch_inst | is_jal_inst | is_jalr_inst;

    
    wire loop_prediction;
    wire tage_prediction;
    wire use_loop_pred;

    
    loop_predictor loop_predictor_inst (
        .clk(clk),
        .reset(reset),
        .pc(pc),
        .branch_taken(branch_taken_actual),
        .is_branch(is_branch_actual),
        .prediction(loop_prediction),
        .loop_detected(use_loop_pred)
    );

    tage_predictor tage_predictor_inst (
        .clk(clk),
        .reset(reset),
        .pc(pc),
        .branch_taken(branch_taken_actual),
        .is_branch(is_branch_actual),
        .prediction(tage_prediction)
    );

    
    
    wire unconditional_taken = is_jal_inst | is_jalr_inst;
    
    
    
    assign prediction = unconditional_taken ? 1'b1 : 
                       (use_loop_pred ? loop_prediction : tage_prediction);

endmodule


module tage_predictor (
    input wire clk,
    input wire reset,
    input wire [31:0] pc,
    input wire branch_taken,
    input wire is_branch,
    output wire prediction
);

    
    parameter NUM_TABLES = 4;      
    parameter int HISTORY_LEN [0:3] = '{1, 2, 4, 8}; 

    
    reg [63:0] global_history;
    always @(posedge clk) begin
        if (reset) 
            global_history <= 0;
        else if (is_branch)
            global_history <= {global_history[62:0], branch_taken};
    end

    
    reg [3:0] tage_tables [0:NUM_TABLES-1][0:1023]; 

    
    wire [NUM_TABLES-1:0] tag_matches;
    wire [1:0] table_predictions [0:NUM_TABLES-1];
    wire [3:0] selected_table;     

    
    generate
        for (genvar i = 0; i < NUM_TABLES; i++) begin
            
            wire [9:0] index = pc[9:0] ^ global_history[HISTORY_LEN[i]-1:0];
            wire [1:0] tag = pc[11:10] ^ global_history[1:0]; 
            
            
            assign tag_matches[i] = (tage_tables[i][index][1:0] == tag);
            assign table_predictions[i] = tage_tables[i][index][3:2]; 
            
            
            always @(posedge clk) begin
                if (is_branch && tag_matches[i]) begin
                    
                    if (branch_taken && (tage_tables[i][index][3:2] < 2'b11))
                        tage_tables[i][index][3:2] <= tage_tables[i][index][3:2] + 1;
                    else if (!branch_taken && (tage_tables[i][index][3:2] > 2'b00))
                        tage_tables[i][index][3:2] <= tage_tables[i][index][3:2] - 1;
                end
                
                else if (is_branch && !tag_matches[i] && selected_table == i) begin
                    tage_tables[i][index][1:0] <= tag;
                    tage_tables[i][index][3:2] <= branch_taken ? 2'b11 : 2'b00;
                end
            end
        end
    endgenerate

    
    assign selected_table = (tag_matches[3] ? 3 : 
                           (tag_matches[2] ? 2 : 
                           (tag_matches[1] ? 1 : 0)));

    
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

    
    reg [31:0] loop_pc;            
    reg [15:0] loop_count;         
    reg [15:0] loop_max;           
    reg loop_active;               

    assign loop_detected = loop_active;
    assign prediction = (loop_active && (loop_count < loop_max)) ? 1'b1 : 1'b0;

    always @(posedge clk) begin
        if (reset) begin
            loop_active <= 0;
            loop_count <= 0;
            loop_max <= 0;
        end else if (is_branch) begin
            
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
            
            loop_active <= (loop_max > 0) && (pc == loop_pc);
        end
    end
endmodule
