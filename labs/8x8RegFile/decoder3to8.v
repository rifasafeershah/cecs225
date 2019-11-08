module decoder3to8(input [2:0] a,
                   output reg [7:0] d);
  always @(*)
    case(a)
      3'b000:	d = 8'b0000_0001;
      3'b001:	d = 8'b0000_0010;
      3'b010:	d = 8'b0000_0100;
      3'b011:	d = 8'b0000_1000;
      3'b100:	d = 8'b0001_0000;
      3'b101:	d = 8'b0010_0000;
      3'b110:	d = 8'b0100_0000;
      3'b111:	d = 8'b1000_0000;
      default:	d = 8'bx;
    endcase
endmodule
