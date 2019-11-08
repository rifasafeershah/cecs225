module mux2to1(input d0, d1, s, output y);
  wire x, z;
  
  not
  n0(ns,s);
  
  and
  a0(x,d0,ns),
  a1(z,d1,s);
  
  or
  o0(y,z,x);
endmodule
