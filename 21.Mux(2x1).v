module Mux(a, b, s, c);
    input [31:0] a, b;  // 
    input s;            // for selection.
    output [31:0] c;

    assign c = (~s) ? a : b;

endmodule