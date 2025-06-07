`timescale 1ns/100ps

module riscv_test;

    // Clock and reset
    logic clk;
    logic rst;
    logic [31:0] sum;

    // Interface signals
    logic [31:0] instr_bus[3];
    logic [31:0] mem_resp[3];
    logic [31:0] reg_rdata[6];
    logic [31:0] reg_wdata[3];
    logic [31:0] pc_next[3];
    logic [31:0] wb_data[3];
    logic [31:0] mem_req_addr[3];
    logic [31:0] mem_req_data[3];
    logic        mem_req_valid[3];

    // Clock generation
    initial clk = 0;
    always #5 clk = ~clk;

    // DUT instantiation
    riscv dut (
        .clk(clk),
        .rst(rst),
        .instr_bus(instr_bus),
        .mem_resp(mem_resp),
        .reg_rdata(reg_rdata),
        .reg_wdata(reg_wdata),
        .pc_next(pc_next),
        .wb_data(wb_data),
        .mem_req_addr(mem_req_addr),
        .mem_req_data(mem_req_data),
        .mem_req_valid(mem_req_valid)
    );

    // Simple mock ADD instruction (no decoding logic, symbolic only)
    function [31:0] make_add_instr(int rs1, int rs2, int rd);
        return {7'b0110011, rs2[4:0], rs1[4:0], 3'b000, rd[4:0], 7'b0000000}; // ADD opcode
    endfunction

    // Expected sum calculation function (sum of expected results)
    function automatic [31:0] expected_sum();
        // For your test input:
        // r10 = r0 + r1 = 10 + 20 = 30
        // r11 = r2 + r3 = 30 + 40 = 70
        // r12 = r4 + r5 = 50 + 60 = 110
        return 32'd30 + 32'd70 + 32'd110; // = 210
    endfunction

    initial begin
        // Initial reset
        rst = 1;
        instr_bus = '{default: 32'h00000013};  // NOP
        mem_resp = '{default: 32'h0};
        reg_rdata = '{default: 32'h0};

        #15 rst = 0;

        // Set register read values
        reg_rdata[0] = 32'd10; // r0
        reg_rdata[1] = 32'd20; // r1
        reg_rdata[2] = 32'd30; // r2
        reg_rdata[3] = 32'd40; // r3
        reg_rdata[4] = 32'd50; // r4
        reg_rdata[5] = 32'd60; // r5

        // Assign mock ADD instructions to instr_bus
        instr_bus[0] = make_add_instr(0, 1, 10);  // r10 = r0 + r1
        instr_bus[1] = make_add_instr(2, 3, 11);  // r11 = r2 + r3
        instr_bus[2] = make_add_instr(4, 5, 12);  // r12 = r4 + r5

        // Wait some cycles for the pipeline to process
        repeat (10) begin
            #10;

            // Calculate sum of wb_data outputs this cycle
            sum = 32'd0;
            for (int i = 0; i < 3; i++) begin
                sum += wb_data[i];
            end

            // Compare to expected sum
            if (sum == expected_sum()) begin
                $display("Cycle %0t: PASS! wb_data sum = %0d", $time, sum);
            end else begin
                $display("Cycle %0t: FAIL! wb_data sum = %0d, expected %0d", $time, sum, expected_sum());
            end
        end

        $finish;
    end

endmodule
