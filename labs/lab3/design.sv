// Code your design here
`include "mux2to1.v"
module mux4to1(input d3,d2,d1,d0,s1,s0,output y);
  wire mux1out, mux0out;
  
  mux2to1
  m0(d0,d1,s0,mux0out),
  m1(d2,d3,s0,mux1out),
  m2(mux0out,mux1out,s1,y);
endmodule
