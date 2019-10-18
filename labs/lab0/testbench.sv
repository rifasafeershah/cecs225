// Code your testbench here
// or browse Examples
module adderTester;
  reg [3:0] a, b;
  wire [3:0] sum;
  
  adder4bit a4(a, b, sum);
  
  initial begin
    $display("Testing 4-bit adder");
    $display("Test case 1");
    a = 4'b0011; #3
    b = 4'b0010; #2
    #1;
    $display("\tA = %b\tB = %b\tSUM = %b",a,b,sum); #5
    
    $display("Test case 2");
    a = 4'b0100; #4
    b = 4'b0110; #6
    #1;
    $display("\tA = %b\tB = %b\tSUM = %b",a,b,sum); #10
    
    $display("Test case 3");
    a = 4'b1000; #8
    b = 4'b0101; #5
    #1;
    $display("\tA = %b\tB = %b\tSUM = %b",a,b,sum); #13
    
    $display("Test case 4");
    a = 4'b0011; #3
    b = 4'b1100; #12
    #1;
    $display("\tA = %b\tB = %b\tSUM = %b",a,b,sum); #15
    
    $display("Test case 5");
    a = 4'b0111; #7
    b = 4'b1011; #11
    #1;
    $display("\tA = %b\tB = %b\tSUM = %b",a,b,sum); #18
    $finish;
  end
endmodule
