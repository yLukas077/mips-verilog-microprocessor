module CPU_MIPS(
    input clk,
    input reset
);
    wire [31:0] pc_in, pc_out;
    wire [31:0] instruction;
    wire branch, mem_to_reg, mem_write, pc_src, alu_src, reg_dst, reg_write;
    wire [3:0] alu_control;
    wire [31:0] srcA, write_data;
    wire zero;
    wire [31:0] alu_result;
    wire [31:0] read_data;
    wire [31:0] sign_immediate;
    wire [31:0] branch_address;
    wire [31:0] pc_plus4;
    wire [31:0] pc_branch;
    wire [31:0] pc_next;
    wire [4:0] write_reg;
    wire [31:0] srcB;
    wire [31:0] result;

    ProgramCounter pc(
        .clk(clk),
        .reset(reset),
        .pc_in(pc_next),
        .pc_out(pc_out)
    );

    InstructionMemory im(
    .PC(pc_out),
    .instruction(instruction)
  );

    ControlUnit cou(
    .op(instruction[31:26]),
    .funct(instruction[5:0]),
    .zero(zero),
    .mem_to_reg(mem_to_reg),
    .mem_write(mem_write),
    .pc_src(pc_src),
    .alu_src(alu_src),
    .reg_dst(reg_dst),
    .reg_write(reg_write),
    .alu_control(alu_control)
  );
  
    RegisterFile rf(
      .clk(clk),
      .we3(reg_write),
      .ra1(instruction[25:21]),
      .ra2(instruction[20:16]),
      .wa3(write_reg),
      .wd3(result),
      .rd1(srcA),
      .rd2(write_data)
    );

    ALU alu(
      .srcA(srcA),
      .srcB(srcB),
      .alu_control(alu_control),
      .alu_result(alu_result),
      .zero(zero)
    );

    DataMemory dm(
      .clk(clk),
      .we(mem_write),
      .address(alu_result),
      .write_data(write_data),
      .read_data(read_data)
    );

    SignExtend se(
      .a(instruction[15:0]),
      .y(sign_immediate)
    );
   
    Adder pa(
      .a(pc_out),
      .b(32'd4),
      .y(pc_plus4)
    );

    Multiplexer32 mc(
      .in0(pc_plus4), 
      .in1(pc_branch), 
      .sel(pc_src), 
      .out(pc_next)
    );

    Multiplexer5 mw(
      .in0(instruction[20:16]), 
      .in1(instruction[15:11]), 
      .sel(reg_dst), 
      .out(write_reg)
    );

    Multiplexer32 ms(
      .in0(write_data), 
      .in1(sign_immediate), 
      .sel(alu_src), 
      .out(srcB)
    );  

    Multiplexer32 mr(
      .in0(alu_result), 
      .in1(read_data), 
      .sel(mem_to_reg), 
      .out(result)
    );

endmodule
