module ControlUnit(
  	input [5:0] op, funct,
    input zero,
    output mem_to_reg, mem_write, branch, pc_src, alu_src, reg_dst, reg_write,
  	output [3:0] alu_control
);

  	wire [1:0] alu_op;
  
    MainDecoder md(
        .op(op),
      	.mem_to_reg(mem_to_reg),
      	.mem_write(mem_write),
        .branch(branch),
      	.alu_src(alu_src),
      	.reg_dst(reg_dst),
      	.reg_write(reg_write),
      	.alu_op(alu_op)
    );

    AluDecoder ad(
        .funct(funct),
      	.alu_op(alu_op),
      	.alu_control(alu_control)
    );

    assign pc_src = branch & zero;

endmodule

