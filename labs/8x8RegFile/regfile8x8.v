`include "mux8to1.v"
`include "decoder3to8.v"
`include "reg8.v"
module regfile8x8(input clk,
                  input we3,
                  input [2:0] ra1, ra2, wa3,
                  input [7:0] wd3,
                  output [7:0] rd1, rd2);
  wire [7:0] we,e;
  wire [7:0] q0, q1, q2, q3, q4, q5, q6, q7;
  
  decoder3to8
  d38(wa3,we);
  
  and
  a0(e[0],we[0],we3),
  a0(e[1],we[1],we3),
  a0(e[2],we[2],we3),
  a0(e[3],we[3],we3),
  a0(e[4],we[4],we3),
  a0(e[5],we[5],we3),
  a0(e[6],we[6],we3),
  a0(e[7],we[7],we3);
  
  reg8
  r0(clk, e[0], wd3, q0),
  r1(clk, e[1], wd3, q1),
  r2(clk, e[2], wd3, q2),
  r3(clk, e[3], wd3, q3),
  r4(clk, e[4], wd3, q4),
  r5(clk, e[5], wd3, q5),
  r6(clk, e[6], wd3, q6),
  r7(clk, e[7], wd3, q7);
  
  mux8to1
  m0(q0,q1,q2,q3,q4,q5,q6,q7,ra1,rd1),
  m1(q0,q1,q2,q3,q4,q5,q6,q7,ra2,rd2);
endmodule
