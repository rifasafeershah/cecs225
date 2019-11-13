module and8(input [7:0] a,b,
            output [7:0] y);
  and
  a0(y[0],a[0],b[0]),
  a1(y[1],a[1],b[1]),
  a2(y[2],a[2],b[2]),
  a3(y[3],a[3],b[3]),
  a4(y[4],a[4],b[4]),
  a5(y[5],a[5],b[5]),
  a6(y[6],a[6],b[6]),
  a7(y[7],a[7],b[7]);
endmodule
