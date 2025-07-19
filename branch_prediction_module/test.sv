`timescale 1ns/1ps

module branch_predictor_tb();

    // Clock and Reset
    reg clk = 0;
    reg reset = 1;
    always #5 clk = ~clk; 

    // Interface Signals
    reg [31:0] pc;
    wire [31:0] instruction;
    reg branch_taken_actual;      
    reg is_branch_actual;         
    wire prediction;              
    wire is_branch_predicted;     

    // Statistics
    integer total_instructions = 0;
    integer total_branches = 0;
    integer correct_predictions = 0;
    integer correct_branch_detection = 0;
    real accuracy;

    // Register File
    reg [31:0] reg_file [0:31];
    wire [31:0] rs1 = reg_file[instruction[19:15]];
    wire [31:0] rs2 = reg_file[instruction[24:20]];

    // Instruction Memory
    instr_mem imem (
        .clk(clk),
        .addr(pc),
        .instruction(instruction)
    );

    // Data Memory
    data_mem dmem (
        .clk(clk),
        .addr(mem_addr),
        .write_en(mem_we),
        .write_data(rs2),
        .read_data(mem_rdata)
    );

    // Branch Predictor
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

    // Execution Signals
    reg [31:0] next_pc;
    reg [31:0] target_address;
    reg branch_taken;
    reg [31:0] mem_addr;
    reg mem_we;
    wire [31:0] mem_rdata;
    reg [4:0] write_rd;
    reg reg_we;
    reg [31:0] write_data;

    initial begin
        // Initialize Register File
        for (int i = 0; i < 32; i++) begin
            reg_file[i] = 0;
        end
        
        // Initialize Control Signals
        pc = 0;
        branch_taken_actual = 0;
        is_branch_actual = 0;
        mem_we = 0;
        reg_we = 0;
        
        // Reset Sequence
        reset = 1;
        #20 reset = 0;
        
        $display("\n=== Starting Test ===");
        
        // Run simulation
        while (1) begin
            #10; // Wait for combinational logic
            
            // Check for unknown instruction (should not happen after initialization)
            if (instruction === 32'hxxxxxxxx) begin
                $display("Unknown instruction at PC=%h. Halting simulation.", pc);
                break;
            end
            
            // Check for program completion
            if (instruction === 32'h00000000) begin
                $display("Program completed at PC=%h", pc);
                break;
            end
            
            // Execute instruction
            execute_instruction();
            
            // Update PC
            pc = next_pc;
            total_instructions++;
            
            // Safety break
            if (total_instructions > 1_000_000) begin
                $display("Timeout at 1,000,000 instructions");
                break;
            end
        end
        
        // Calculate statistics
        if (total_branches > 0) begin
            accuracy = (real'(correct_predictions) / total_branches) * 100;
        end else begin
            accuracy = -1;
        end
        
        $display("\n=== Results ===");
        $display("Total Instructions: %0d", total_instructions);
        $display("Branch Prediction Accuracy: %.2f%%, (%d / %d)", accuracy, correct_predictions, total_branches);
        $finish;
    end

    // Execute current instruction
    task execute_instruction();
        automatic reg [6:0] opcode = instruction[6:0];
        automatic reg [2:0] funct3 = instruction[14:12];
        automatic reg [6:0] funct7 = instruction[31:25];
        automatic reg [31:0] imm;
        
        // Default values
        next_pc = pc + 4;
        branch_taken = 0;
        mem_we = 0;
        reg_we = 0;
        write_rd = 0;
        write_data = 0;
        is_branch_actual = 0;
        branch_taken_actual = 0;
        mem_addr = 0;
        
        case (opcode)
            // LUI
            7'b0110111: begin
                write_rd = instruction[11:7];
                write_data = {instruction[31:12], 12'b0};
                reg_we = 1;
            end
            
            // AUIPC
            7'b0010111: begin
                write_rd = instruction[11:7];
                write_data = pc + {instruction[31:12], 12'b0};
                reg_we = 1;
            end
            
            // JAL
            7'b1101111: begin
                imm = {{12{instruction[31]}}, instruction[19:12], instruction[20], instruction[30:21], 1'b0};
                target_address = pc + imm;
                write_rd = instruction[11:7];
                write_data = pc + 4;
                reg_we = 1;
                branch_taken = 1;
                is_branch_actual = 1;
            end
            
            // JALR
            7'b1100111: begin
                imm = {{20{instruction[31]}}, instruction[31:20]};
                target_address = (rs1 + imm) & ~32'd1;
                write_rd = instruction[11:7];
                write_data = pc + 4;
                reg_we = 1;
                branch_taken = 1;
                is_branch_actual = 1;
            end
            
            // Branch
            7'b1100011: begin
                imm = {{20{instruction[31]}}, instruction[7], instruction[30:25], instruction[11:8], 1'b0};
                target_address = pc + imm;
                is_branch_actual = 1;
                
                case (funct3)
                    3'b000: branch_taken = (rs1 == rs2);  // BEQ
                    3'b001: branch_taken = (rs1 != rs2);  // BNE
                    3'b100: branch_taken = ($signed(rs1) < $signed(rs2));  // BLT
                    3'b101: branch_taken = ($signed(rs1) >= $signed(rs2)); // BGE
                    3'b110: branch_taken = (rs1 < rs2);   // BLTU
                    3'b111: branch_taken = (rs1 >= rs2);  // BGEU
                endcase
            end
            
            // Load
            7'b0000011: begin
                imm = {{20{instruction[31]}}, instruction[31:20]};
                mem_addr = rs1 + imm;
                write_rd = instruction[11:7];
                reg_we = 1;
                
                case (funct3)
                    3'b010: write_data = mem_rdata;  // LW
                    // Add other load types as needed
                endcase
            end
            
            // Store
            7'b0100011: begin
                imm = {{20{instruction[31]}}, instruction[31:25], instruction[11:7]};
                mem_addr = rs1 + imm;
                mem_we = 1;
                
                case (funct3)
                    3'b010: mem_we = 1;  // SW
                    // Add other store types as needed
                endcase
            end
            
            // ALU operations
            7'b0010011, 7'b0110011: begin // ALUI/ALU
                write_rd = instruction[11:7];
                reg_we = 1;
                
                if (opcode == 7'b0010011) // Immediate
                    imm = {{20{instruction[31]}}, instruction[31:20]};
                
                case (funct3)
                    3'b000: write_data = (opcode == 7'b0010011) ? (rs1 + imm) : (rs1 + rs2); // ADD/ADDI
                    3'b001: write_data = rs1 << (opcode == 7'b0010011 ? instruction[24:20] : rs2[4:0]); // SLL/SLLI
                    3'b010: write_data = ($signed(rs1) < $signed(opcode == 7'b0010011 ? imm : rs2)); // SLT/SLTI
                    3'b011: write_data = (rs1 < (opcode == 7'b0010011 ? imm : rs2)); // SLTU/SLTIU
                    3'b100: write_data = rs1 ^ (opcode == 7'b0010011 ? imm : rs2); // XOR/XORI
                    3'b101: write_data = (instruction[30] ? $signed(rs1) >>> (opcode == 7'b0010011 ? instruction[24:20] : rs2[4:0]) 
                                             : rs1 >> (opcode == 7'b0010011 ? instruction[24:20] : rs2[4:0])); // SRA/SRL/SRAI/SRLI
                    3'b110: write_data = rs1 | (opcode == 7'b0010011 ? imm : rs2); // OR/ORI
                    3'b111: write_data = rs1 & (opcode == 7'b0010011 ? imm : rs2); // AND/ANDI
                endcase
            end
        endcase
        
        // Update branch taken
        if (is_branch_actual) begin
            branch_taken_actual = branch_taken;
            if (branch_taken) next_pc = target_address;
        end
        
        // Update register file
        if (reg_we && write_rd != 0) begin
            reg_file[write_rd] = write_data;
        end
        
        // Check prediction results
        check_results();
    endtask

    // Check prediction results
    task check_results();
        // Branch detection check (only when actual is known)
        if (is_branch_actual !== 1'bx) begin
            if (is_branch_predicted === is_branch_actual) begin
                correct_branch_detection += 1;
            end else begin
                $display("Mismatch at PC=%h: Expected is_branch=%b, Got=%b",
                         pc, is_branch_actual, is_branch_predicted);
            end
        end
        
        // Branch prediction check (only when actual taken is known)
        if (is_branch_actual) begin
            if (branch_taken_actual !== 1'bx) begin
                total_branches += 1;
                if (prediction === branch_taken_actual) begin
                    correct_predictions += 1;
                    $display("Predict at PC=%h: Actual=%b, Predicted=%b",
                             pc, branch_taken_actual, prediction);
                end else begin
                    $display("Mispredict at PC=%h: Actual=%b, Predicted=%b",
                             pc, branch_taken_actual, prediction);
                end
            end
        end
//        if (prediction == 1'b1) begin
//            $display("predicted taken");
//        end
    endtask

endmodule

// Instruction Memory
module instr_mem(
    input clk,
    input [31:0] addr,
    output reg [31:0] instruction
);
    reg [31:0] rom [0:65535];
    
    initial begin
        // Initialize entire ROM to NOP (0x00000013)
        for (integer i = 0; i <= 65535; i++) begin
            rom[i] = 32'h00000013;
        end
        $readmemh("deep_nesting.hex", rom);
    end
    
    always @(posedge clk) begin
        instruction <= rom[addr[31:2]];
    end
endmodule

// Data Memory
module data_mem(
    input clk,
    input [31:0] addr,
    input write_en,
    input [31:0] write_data,
    output reg [31:0] read_data
);
    reg [31:0] mem [0:65535];
    
    // Initialize all memory to zero
    initial begin
        for (integer i = 0; i <= 65535; i++) begin
            mem[i] = 32'b0;
        end
    end
    
    // Read path
    always @(posedge clk) begin
        read_data <= mem[addr[31:2]];
    end
    
    // Write path
    always @(posedge clk) begin
        if (write_en) begin
            mem[addr[31:2]] <= write_data;
        end
    end
endmodule