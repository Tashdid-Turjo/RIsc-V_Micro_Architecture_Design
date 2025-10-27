`include "1.Program_Counter.v"
`include "2.0.Instruction_Memory.v"
`include "2.1.Adder.v"
`include "3.Control_Unit.v"
`include "4.Register_File.v"
`include "21.Mux(2x1).v"

module S_C_T(CLK, RST);
    input CLK, RST;

    // wire declaration
    wire [31:0] PC_InstrMem;    // 1
    wire [31:0] InstrMem_CU;    // 2
    wire [31:0] PC_plus_4;      // 1a
    wire [31:0] s1out_b;        // 3a




    Program_Counter Program_Counter(
                    .clk(CLK),
                    .rst(RST),
                    .pc_in(),
                    .pc_out(PC_InstrMem)
    );

    Instruction_Memory Instruction_Memory(
                    .instr_mem_in(PC_InstrMem),
                    .instr_mem_out(),
                    .rst(rst)
    );

    Adder_4 Adder_4(
                    .adder_in(PC_InstrMem),
                    .const(32'd4),
                    .adder_out(PC_plus_4)
    );

    Control_Unit Control_Unit(
                    .opcode(InstrMem_CU[6:0]),  // 2a
                    .funct3(InstrMem_CU[14:12]),// 2a
                    .funct7(InstrMem_CU[30]),   // 2a. Here, only 30th bit, cz, for almost all the instruction's R-Type's funct7 25-31 bits are 0. Except in some cases where 30th bit is 1.
                    .ALU_Ctrl(),
                    .A_select(),
                    .dm_read(),
                    .B_select(),
                    .wd_src(),
                    .Mask(),
                    .PC_src(),
                    .store_select(),
                    .imm_select(),
                    .dm_read(),
                    .dm_write(),
                    .reg_write()
    );

    Register_File Register_File(
                    .rs1(InstrMem_CU[29:15]),   // 2b
                    .rs2(InstrMem_CU[24:20]),   // 2c
                    .rd(InstrMem_CU[11:7]),     // 2d
                    .clk(), 
                    .rst(), 
                    .wr_reg_file(), 
                    .reg_write(), 
                    .s1_out(PC_plus_4),                  // 3a
                    .s2_out()                   // 3b
    );

    Mux RegisterFile_Mux_ALUCtrl(
                    .a(PC_plus_4),
                    .b(),
                    .s(),
                    .c()
    );

endmodule

// Architecture's register file and mux that's attached with register file has been finished till now.