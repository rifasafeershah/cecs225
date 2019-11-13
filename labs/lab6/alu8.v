`include "mux8to1_8bit.v"
`include "slt8.v"
`include "or8.v"
`include "and8.v"
`include "RippleSubtracter8.v"
`include "RippleCarry8.v"

module alu8(input [2:0] funct_sel,
            input [7:0] a,b,
            output zero_flag,
            output [7:0] result);
  wire [7:0] andab, orab, addab, subab, sltab;
  
  and8 and8bit(a,b,andab);
  or8 or8bit(a,b,orab);
  RippleCarry8 rc8(funct_sel[1],a,b, addab,);
  RippleSubtracter8 rs8(funct_sel[2],a,b, subab,);
  slt8 slt8bit(a,b,sltab);
  mux8to1_8bit m8(andab, orab, addab, 8'bx,8'bx,8'bx, subab, sltab, funct_sel,result);
  
  nor nor8(zero_flag, result[0],result[1],result[2],result[3],result[4],result[5],result[6],result[7]);
endmodule
