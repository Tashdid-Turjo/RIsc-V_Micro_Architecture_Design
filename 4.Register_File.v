module Register_File (rs1, rs2, rd, clk, rst, wr_reg_file, reg_write, s1_out, s2_out);
    input  [31:0] rs1, rs2, rd;         // source1 address, source2 address, destination address.
    input         clk, rst, reg_write;  // reg_write -> write enable.
    input         wr_reg_file;          // ?? not sure how many bits ??
    output [31:0] s1_out, s2_out;       // source1 output(3a) & source2 output(3b).
    
    // Memory Creation
    reg [31:0] Registers [31:0];

    // read functionality
    assign s1_out = (rst == 0) ? 32'h00000000 : Registers[rs1];
    assign s2_out = (rst == 0) ? 32'h00000000 : Registers[rs2];

    // write functionality
    always @(posedge clk)
        begin
            if(reg_write == 1)
                begin
                    Registers[rd] <= wr_reg_file;
                end
        end

endmodule