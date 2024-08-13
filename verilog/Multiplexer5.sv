module Multiplexer5(
  	input [4:0] in0, in1,
    input sel,
    output [4:0] out
);
  
    assign out = sel ? in1 : in0;
  
endmodule
