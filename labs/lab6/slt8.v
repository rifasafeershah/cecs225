module slt8(input [7:0] a,b, output reg [7:0] y);
  always @(*)
    begin
      if(a < b) y = 8'b0000_0001;
      else y = 8'b0000_0000;
    end
endmodule
