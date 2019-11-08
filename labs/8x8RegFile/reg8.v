`include "flop.v"
`include "mux2to1.v"
module reg8(input clk, enable, input [7:0] d, output [7:0] q);
  wire [7:0] muxout;
  mux2to1
  m0(q[0],d[0],enable,muxout[0]),
  m1(q[1],d[1],enable,muxout[1]),
  m2(q[2],d[2],enable,muxout[2]),
  m3(q[3],d[3],enable,muxout[3]),
  m4(q[4],d[4],enable,muxout[4]),
  m5(q[5],d[5],enable,muxout[5]),
  m6(q[6],d[6],enable,muxout[6]),
  m7(q[7],d[7],enable,muxout[7]);
  
  flop
  dff0(clk,muxout[0],q[0]),
  dff1(clk,muxout[1],q[1]),
  dff2(clk,muxout[2],q[2]),
  dff3(clk,muxout[3],q[3]),
  dff4(clk,muxout[4],q[4]),
  dff5(clk,muxout[5],q[5]),
  dff6(clk,muxout[6],q[6]),
  dff7(clk,muxout[7],q[7]);
endmodule
