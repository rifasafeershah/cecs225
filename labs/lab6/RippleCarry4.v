`include "fulladder.v"
module RippleCarry4(input cin, input [3:0] a, b, output [3:0] s, output cout);
  wire cout0, cout1, cout2;
  
  fulladder
  fa0(a[0], b[0], cin, cout0, s[0]),
  fa1(a[1], b[1], cout0, cout1, s[1]),
  fa2(a[2], b[2], cout1, cout2, s[2]),
  fa3(a[3], b[3], cout2, cout, s[3]);
  
endmodule
