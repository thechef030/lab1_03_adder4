module adder_4bit(input wire [3:0] a,b, output wire [3:0] s, output wire cout);
  assign {cout,s} = {1'b0,a} + {1'b0,b};
endmodule
