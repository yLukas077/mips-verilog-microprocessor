module ALU(
  	input [31:0] srcA, srcB,
  	input [3:0] alu_control,
  	output reg [31:0] alu_result,
    output zero
);
    always @(*) begin
      	case (alu_control)
            4'b0010: alu_result = srcA + srcB; 
            4'b0110: alu_result = srcA - srcB; 
            default: alu_result = 0;
        endcase
    end

  	assign zero = (alu_result == 0);
  
endmodule
