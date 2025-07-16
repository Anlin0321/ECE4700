`ifndef __PASSTHRU_MEM_V__
`define __PASSTHRU_MEM_V__

`timescale 1ns/100ps

`include "sys_defs.svh"

module passthru_mem #(
    parameter MEM_WORDS = `MEM_64BIT_LINES
)(
    input  logic              clk,
    // instruction side
    input  logic [`ISSUE_WIDTH-1:0][1:0]   proc2Imem_command,
    input  logic [`ISSUE_WIDTH-1:0][`XLEN-1:0] proc2Imem_addr,
    output logic [`ISSUE_WIDTH-1:0][3:0]   mem2Iproc_response,
    output logic [`ISSUE_WIDTH-1:0][63:0]  mem2Iproc_data,
    output logic [`ISSUE_WIDTH-1:0][3:0]   mem2Iproc_tag,
    // data   side
    input  logic [`ISSUE_WIDTH-1:0][1:0]   proc2Dmem_command,
    input  logic [`ISSUE_WIDTH-1:0][`XLEN-1:0] proc2Dmem_addr,
    input  logic [`ISSUE_WIDTH-1:0][63:0]  proc2Dmem_data,
    output logic [`ISSUE_WIDTH-1:0][3:0]   mem2Dproc_response,
    output logic [`ISSUE_WIDTH-1:0][63:0]  mem2Dproc_data,
    output logic [`ISSUE_WIDTH-1:0][3:0]   mem2Dproc_tag
);

    logic [63:0] instr_mem [0:MEM_WORDS-1];
    logic [63:0] data_mem  [0:MEM_WORDS-1];

    // combinational, zero latency
    always_comb begin
        for (int w=0; w<`ISSUE_WIDTH; w++) begin
            // instruction port
            if (proc2Imem_command[w]==BUS_LOAD && 
                proc2Imem_addr[w] < `MEM_SIZE_IN_BYTES) begin
                mem2Iproc_response[w] = w+1;        // tag = lane+1 (never 0)
                mem2Iproc_tag[w]      = w+1;
                mem2Iproc_data[w]     = instr_mem[proc2Imem_addr[w][`XLEN-1:3]];
            end else begin
                mem2Iproc_response[w] = 0;
                mem2Iproc_tag[w]      = 0;
                mem2Iproc_data[w]     = 'x;
            end

            // data port
            if (proc2Dmem_command[w]==BUS_LOAD && 
                proc2Dmem_addr[w] < `MEM_SIZE_IN_BYTES) begin
                mem2Dproc_response[w] = w+8;        // keep tags distinct
                mem2Dproc_tag[w]      = w+8;
                mem2Dproc_data[w]     = data_mem[proc2Dmem_addr[w][`XLEN-1:3]];
            end else if (proc2Dmem_command[w]==BUS_STORE && 
                         proc2Dmem_addr[w] < `MEM_SIZE_IN_BYTES) begin
                mem2Dproc_response[w] = w+8;
                mem2Dproc_tag[w]      = w+8;
                mem2Dproc_data[w]     = 'x; // For store, data out is undefined
            end else begin
                mem2Dproc_response[w] = 0;
                mem2Dproc_tag[w]      = 0;
                mem2Dproc_data[w]     = 'x;
            end
        end
    end

    // Handle writes for the data port (synchronous)
    always_ff @(negedge clk) begin
        for (int w=0; w<`ISSUE_WIDTH; w++) begin
            if (proc2Dmem_command[w]==BUS_STORE && 
                proc2Dmem_addr[w] < `MEM_SIZE_IN_BYTES) begin
                data_mem[proc2Dmem_addr[w][`XLEN-1:3]] <= proc2Dmem_data[w];
            end
        end
    end

    // Initialize memories
    initial begin
        for (int i=0; i<MEM_WORDS; i++) begin
            instr_mem[i] = 64'h0;
            data_mem[i] = 64'h0;
        end
    end
endmodule
`endif // __PASSTHRU_MEM_V__