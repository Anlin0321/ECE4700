module forwarding_unit #(
    parameter DATA_WIDTH = 32,
    parameter REG_ADDR_WIDTH = 5
)(
    // Pipeline register inputs
    input logic [REG_ADDR_WIDTH-1:0] rs1_addr_id [2:0],  // Source register 1 addresses from ID stage (3 instructions)
    input logic [REG_ADDR_WIDTH-1:0] rs2_addr_id [2:0],  // Source register 2 addresses from ID stage (3 instructions)
    
    // EX stage pipeline registers (3 instructions)
    input logic [REG_ADDR_WIDTH-1:0] rd_addr_ex [2:0],
    input logic [2:0] reg_write_ex,                      // EX stage register write enables
    
    // MEM stage pipeline registers (3 instructions)
    input logic [REG_ADDR_WIDTH-1:0] rd_addr_mem [2:0],
    input logic [2:0] reg_write_mem,                    // MEM stage register write enables
    
    // WB stage pipeline registers (3 instructions)
    input logic [REG_ADDR_WIDTH-1:0] rd_addr_wb [2:0],
    input logic [2:0] reg_write_wb,                      // WB stage register write enables
    
    // Forwarding control outputs
    output logic [1:0] forward_rs1 [2:0],                // Forwarding controls for rs1 (per instruction)
    output logic [1:0] forward_rs2 [2:0]                 // Forwarding controls for rs2 (per instruction)
);

    // Forwarding priority:
    // 1. EX hazard (highest priority)
    // 2. MEM hazard
    // 3. WB hazard (lowest priority)
    
    // For each of the 3 instructions in the ID stage
    for (genvar i = 0; i < 3; i++) begin
        // Forwarding for rs1
        always_comb begin
            forward_rs1[i] = 2'b00; // Default: no forwarding
            
            // Check EX stage forwarding (highest priority)
            for (int j = 0; j < 3; j++) begin
                if (reg_write_ex[j] && (rd_addr_ex[j] != 0) && (rd_addr_ex[j] == rs1_addr_id[i])) begin
                    forward_rs1[i] = 2'b01; // Forward from EX stage
                end
            end
            
            // Check MEM stage forwarding (medium priority)
            for (int j = 0; j < 3; j++) begin
                if (reg_write_mem[j] && (rd_addr_mem[j] != 0) && (rd_addr_mem[j] == rs1_addr_id[i]) && 
                    (forward_rs1[i] == 2'b00)) begin
                    forward_rs1[i] = 2'b10; // Forward from MEM stage
                end
            end
            
            // Check WB stage forwarding (lowest priority)
            for (int j = 0; j < 3; j++) begin
                if (reg_write_wb[j] && (rd_addr_wb[j] != 0) && (rd_addr_wb[j] == rs1_addr_id[i]) && 
                    (forward_rs1[i] == 2'b00)) begin
                    forward_rs1[i] = 2'b11; // Forward from WB stage
                end
            end
        end
        
        // Forwarding for rs2
        always_comb begin
            forward_rs2[i] = 2'b00; // Default: no forwarding
            
            // Check EX stage forwarding (highest priority)
            for (int j = 0; j < 3; j++) begin
                if (reg_write_ex[j] && (rd_addr_ex[j] != 0) && (rd_addr_ex[j] == rs2_addr_id[i])) begin
                    forward_rs2[i] = 2'b01; // Forward from EX stage
                end
            end
            
            // Check MEM stage forwarding (medium priority)
            for (int j = 0; j < 3; j++) begin
                if (reg_write_mem[j] && (rd_addr_mem[j] != 0) && (rd_addr_mem[j] == rs2_addr_id[i]) && 
                    (forward_rs2[i] == 2'b00)) begin
                    forward_rs2[i] = 2'b10; // Forward from MEM stage
                end
            end
            
            // Check WB stage forwarding (lowest priority)
            for (int j = 0; j < 3; j++) begin
                if (reg_write_wb[j] && (rd_addr_wb[j] != 0) && (rd_addr_wb[j] == rs2_addr_id[i]) && 
                    (forward_rs2[i] == 2'b00)) begin
                    forward_rs2[i] = 2'b11; // Forward from WB stage
                end
            end
        end
    end

endmodule
