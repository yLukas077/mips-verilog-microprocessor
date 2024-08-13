module SignExtend(
    input [15:0] a,
    output reg [31:0] y
);
  
    assign y = {{16{a[15]}}, a};
  
endmodule
