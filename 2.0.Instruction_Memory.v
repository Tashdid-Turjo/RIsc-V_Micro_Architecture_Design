// At the same time, program counter's output will go to-
// Instruction Memory & Adder parallely.
module Instruction_Memory(instr_mem_in, instr_mem_out, rst);
    input [31:0] instr_mem_in;
    input rst;
    output [31:0] instr_mem_out;

    // Memory creation
    reg [31:0] Mem [1023:0];
    
    assign instr_mem_out = (rst == 1'b0) ? 32'h00000000 : Mem[instr_mem_in[31:2]];

endmodule