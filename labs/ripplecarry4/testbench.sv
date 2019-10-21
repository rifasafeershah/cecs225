module RippleCarry4Tester();
  
  reg cin;
  reg [3:0] a,b;
  wire [3:0] s;
  wire cout;
  
  RippleCarry4 r(cin,a,b,s,cout);
  
  integer i;
  
  initial begin
    
    $dumpfile("dump.vcd");
    $dumpvars(1);
    
    cin = 0;
    for(i = 0; i < 8; i = i + 1)
      begin
        #1 {a,b} = $random;
        #5 $display("a = %d, b = %d, s = %d, cout = %b",a,b,s,cout);
      end
    $finish;
  end
endmodule
