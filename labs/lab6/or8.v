module or8(input [7:0] a,b,
            output [7:0] y);
  or
  o0(y[0],a[0],b[0]),
  o1(y[1],a[1],b[1]),
  o2(y[2],a[2],b[2]),
  o3(y[3],a[3],b[3]),
  o4(y[4],a[4],b[4]),
  o5(y[5],a[5],b[5]),
  o6(y[6],a[6],b[6]),
  o7(y[7],a[7],b[7]);
endmodule
