module ProgramCounter(
    input clk,
    input reset,
  	input [31:0] pc_in,
    output wire [31:0] pc_out
);
  	reg [31:0] data;
  
    always @(posedge clk or posedge reset) begin
        if (reset)
            data <= 0;
        else
            data <= pc_in; 
    end
  
  	assign pc_out = data;
  
endmodule
