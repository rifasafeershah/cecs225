`include "alu8.v"
module alutester;
  reg [7:0] a,b; reg [2:0] funct_sel;
  wire [7:0] result; wire zero;
  integer i;
  
  alu8 uut(funct_sel,a,b,zero,result);
  
  initial begin
    b=8'b00001111; a=8'b01011010;
    for(i = 0; i < 8; i = i + 1) begin
      funct_sel=i; test_case;
    end
    a=8'b00001111; b=8'b01011010; i = i - 1;
    test_case;
    $finish;
  end
  
  task test_case;
    begin
      #1;
      case(i)
        3'b000: $display("\nTesting the AND function");
        3'b001: $display("\nTesting the OR function");
        3'b010: $display("\nTesting Addition");
        3'b110: $display("\nTesting Subtraction");
        3'b111: $display("\nTesting Set Less Than Function");
        default: $display("\nInvalid Function Select Code!");
      endcase
      if(i == 2) i = 5;
      $display("a = %b, b = %b, result = %b, zero = %b",a,b,result,zero);
    end
  endtask
endmodule
