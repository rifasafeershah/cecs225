// Code your design here
module cout(input a,b,c,
            output cout);
  
  wire x, y, z;
  
  and
  g1(x,a,b);
  and
  g2(y,a,c);
  and
  g3(z,b,c);
  or
  g4(cout,x,y,z);
endmodule
