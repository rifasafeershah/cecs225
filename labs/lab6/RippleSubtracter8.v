module RippleSubtracter8(input bin, input [7:0] a, b, output [7:0] d, output bout);
  
  wire [7:0] e;
  xor
  x0(e[0], b[0], bin),
  x1(e[1], b[1], bin),
  x2(e[2], b[2], bin),
  x3(e[3], b[3], bin),
  x4(e[4], b[4], bin),
  x5(e[5], b[5], bin),
  x6(e[6], b[6], bin),
  x7(e[7], b[7], bin);
  
  RippleCarry8
  rs(bin, a, e, d, bout);
  
endmodule
