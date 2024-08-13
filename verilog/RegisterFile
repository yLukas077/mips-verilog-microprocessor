module RegisterFile(
  	input clk,
    input we3,
  	input [4:0] ra1, ra2, wa3,
  	input [31:0] wd3,
  	output reg [31:0] rd1, rd2
);

    reg [31:0] rf[31:0];
	
    initial begin
        integer i;
        for (i = 0; i < 32; i = i + 1) begin
           rf[i] = 32'b0;
        end
    end
  
    always @(posedge clk) begin
      if (we3) begin
        rf[wa3] <= wd3;
      end
    end
	
  always @(we3) begin
        rd1 = rf[ra1];
        rd2 = rf[ra2];
    end
  
endmodule
