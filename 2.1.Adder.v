// At the same time, program counter's output will go to-
// Instruction Memory & Adder parallely.
module Adder_4(adder_in, const, adder_out);
    input [31:0] adder_in, const;   // const = 4
    output [31:0] adder_out;

    assign adder_out = adder_in + const;

endmodule