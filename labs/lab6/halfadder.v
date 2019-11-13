module halfadder(input a, b, output c, s);
  xor x1(s, a, b);
  and a1(c, a, b);
endmodule
