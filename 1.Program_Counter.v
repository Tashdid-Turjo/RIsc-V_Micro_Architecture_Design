module Program_Counter(clk, rst, pc_in, pc_out);
    input clk, rst;
    input [31:0] pc_in;
    output reg [31:0] pc_out;

    always @(posedge clk)
        begin
            if(rst == 0)
                begin
                    pc_out <= 32'h00000000; // reset occurs.
                end
            else
                begin
                    pc_out <= pc_out + 4;
                end
        end

endmodule