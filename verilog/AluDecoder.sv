module AluDecoder(
    input [5:0] funct,
  	input [1:0] alu_op,
  	output reg [3:0] alu_control
);

    always @(*) begin
      	case (alu_op)
            2'b00: alu_control = 3'b010; 
            2'b01: alu_control = 3'b110; 
            2'b10: begin
                case (funct) 
                    6'b100000: alu_control = 3'b010;
                    6'b100010: alu_control = 3'b110; 
                    default: alu_control = 3'bxxx;
                endcase
            end
            default: alu_control = 3'b000;
        endcase
    end
endmodule
