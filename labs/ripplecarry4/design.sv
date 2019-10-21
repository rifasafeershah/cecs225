`include "halfadder.v"
module fulladder(input a,b,cin,output cout, s);
  wire carrygenerate, carrypropagate, sum1;
  
  halfadder
  h0(a,b,carrygenerate, sum1),
  ha1(sum1, cin, carrypropagate, s);
  
  or
  o1(cout, carrygenerate, carrypropagate);
endmodule
