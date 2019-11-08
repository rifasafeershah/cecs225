module mux4to1tester;
  reg d3, d2, d1, d0, s1, s0;
  wire y;
  
  mux4to1 dut(d3, d2, d1, d0, s1, s0, y);
  integer i;
  initial begin
    $display("Mux 4 to 1 tester!");
    d0 = 1'b1;	d1 = 1'b0;
    d2 = 1'bx;	d3 = 1'b1;
    $display("\tTest case\td3\td2\td1\td0\t|\ts1\ts0\t|\ty");
    for(i = 0; i < 4; i = i +1)
      begin
        {s1, s0}=i;
        #1 $display("%d\t\t%b\t%b\t%b\t%b\t|\t%b\t%b\t|\t%b",i,d3,d2,d1,d0,s1,s0,y);
      end
    $finish;
  end
endmodule
