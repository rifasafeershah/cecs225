module mux8to1_8bit(input [7:0] d0,d1,d2,d3,d4,d5,d6,d7,
                    input [2:0] s,
                    output reg [7:0] y);
  always @(*) begin
    case(s)
      3'b000: y=d0;
      3'b001: y=d1;
      3'b010: y=d2;
      3'b011: y=d3;
      3'b100: y=d4;
      3'b101: y=d5;
      3'b110: y=d6;
      3'b111: y=d7;
      default: y=8'bx;
    endcase
  end
endmodule
