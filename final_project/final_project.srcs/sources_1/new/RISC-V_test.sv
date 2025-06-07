`timescale 1ns/100ps

module riscv_test;

    // Clock and reset
    logic clk = 0;
    logic rst;

    always #5 clk = ~clk;
    
    logic [31:0] observed_sum;
    logic [31:0] expect_sum;

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
    logic        mem_req_is_load[3];

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
        .mem_req_valid(mem_req_valid),
        .mem_req_is_load(mem_req_is_load)
    );

    // Helper - fixed "ADD" encoding
    function automatic [31:0] make_add_instr (int rs1, int rs2, int rd);
        return {7'b0110011, rs2[4:0], rs1[4:0], 3'b000, rd[4:0], 7'b0000000};
    endfunction

    // Fixed 3-wide instruction window
    initial begin
        instr_bus[0] = make_add_instr(0, 1, 10); // r10 = r0 + r1
        instr_bus[1] = make_add_instr(2, 3, 11); // r11 = r2 + r3
        instr_bus[2] = make_add_instr(4, 5, 12); // r12 = r4 + r5
    end

    typedef int unsigned rv6_t [6];
    localparam int NUM_TESTS = 5;

    const rv6_t test_vec[NUM_TESTS] = '{
        '{ 10, 20,   30,  40,     50,   60 },
        '{  1,  2,    3,   4,      5,    6 },
        '{100,200,  300, 400,    500,  600 },
        '{  0,  0,    0,   0,      0,    0 },
        '{32'hFFFF_FFFF, 32'd1, 32'h8000_0000,
          32'h8000_0000, 32'd1234567890,
          32'd987654321 }
    };

    int pass_cnt = 0;

    initial begin
        mem_resp = '{default:32'd0};

        for (int tc = 0; tc < NUM_TESTS; tc++) begin
            rst = 1;
            #15;
            rst = 0;

            for (int i = 0; i < 6; i++)
                reg_rdata[i] = test_vec[tc][i];

            repeat (8) @(posedge clk);

            for (int i = 0; i < 3; i++)
                observed_sum += wb_data[i];

            assign expect_sum =
                  test_vec[tc][0] + test_vec[tc][1] +
                  test_vec[tc][2] + test_vec[tc][3] +
                  test_vec[tc][4] + test_vec[tc][5];

            if (observed_sum === expect_sum) begin
                $display("[TC%0d] PASS - observed %0d (0x%08h)",
                         tc, observed_sum, observed_sum);
                pass_cnt++;
            end
            else begin
                $display("[TC%0d] *** FAIL ***  observed %0d  expected %0d",
                         tc, observed_sum, expect_sum);
            end

            #20;
        end

        if (pass_cnt == NUM_TESTS)
            $display("ALL %0d TESTS PASSED", NUM_TESTS);
        else
            $display("%0d / %0d TESTS PASSED", pass_cnt, NUM_TESTS);

        $finish;
    end

endmodule
