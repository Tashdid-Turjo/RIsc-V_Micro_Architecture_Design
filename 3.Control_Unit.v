module Control_Unit(opcode, funct3, funct7, ALU_Ctrl, A_select, dm_read, B_select, wd_src, Mask, PC_src, store_select, imm_select, dm_select, dm_write, reg_write);
    input [6:0]   opcode;
    input [2:0]   funct3; // In the paper, it said funct3 -> 12 to 14th bits. As here just 3 bits, so we wrote [2:0] bits.
    input         funct7;
    output [3:0]  ALU_Ctrl; 
    output A_select;
    output dm_read;
    output B_select;
    output wd_src;
    output Mask;
    output PC_src;
    output store_select;
    output imm_select;
    output dm_select;
    output dm_write;
    output reg_write;


endmodule