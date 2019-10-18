// Code your testbench here
// or browse Examples
`timescale 1ns/100ps
module coutTester();
  reg a, b,c;
  wire cout;
  
  cout dut (a,b,c,cout);
  
  integer i;
  
  initial begin
    $display("Testing the functionality");
    $display("a\tb\tc\t|\tcout");
    $display("--------------------------");
    for (i=0; i<8; i=i+1)
      begin
        {a,b,c} = i;
        #1 $display("%b\t%b\t%b\t|\t%b",a,b,c,cout);
      end
  end
endmodule
