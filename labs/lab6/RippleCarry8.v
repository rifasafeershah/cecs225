`include "RippleCarry4.v"
module RippleCarry8(input cin, input [7:0] a, b, output [7:0] s, output cout);
  
  wire cout3;
  
  RippleCarry4
  rc40(cin, a[3:0], b[3:0], s[3:0], cout3),
  rc41(cout3, a[7:4], b[7:4], s[7:4],cout);
  
endmodule
