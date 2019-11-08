`include "regfile8x8.v"
module regfiletester;
  reg clk, we3;	reg [2:0] ra1, ra2, wa3;
  reg [7:0] wd3; wire[7:0] rd1, rd2;
  integer i;
  regfile8x8 uut(clk,we3,ra1,ra2,wa3,wd3,rd1,rd2);
  always #5 clk = ~clk;
  initial begin
    clk = 1'b1; we3 = 1'b0;
    $display("Initial register contents");
    register_dump; we3 = 1'b1;
    for(i = 0; i < 9; i = i + 1)
      begin
        @(negedge clk) wd3 = 16*i; wa3 = i; ra1 = i;
        $display("register %d gets 0x%h",wa3,wd3);
      end
    we3 = 1'b0;
    $display("\nFinal register contents");
    register_dump;
    $finish;
  end
  task register_dump;
    for(i = 0; i < 8; i = i + 2)
      begin
        @(negedge clk)
        ra1 = i; ra2 = i+1;
        @(posedge clk) #1
        $display("register %d contains the value 0x%h",ra1,rd1);
        $display("register %d contains the value 0x%h",ra2,rd2);
      end
  endtask
endmodule
