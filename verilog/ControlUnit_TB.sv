`timescale 1ns / 1ps

module ControlUnit_tb;

    // Inputs
    reg [5:0] op;
    reg [5:0] funct;
    reg zero;

    // Outputs
    wire mem_to_reg;
    wire mem_write;
    wire branch;
    wire pc_src;
    wire alu_src;
    wire reg_dst;
    wire reg_write;
    wire jump;
    wire [3:0] alu_control;

    // Instantiate the Unit Under Test (UUT)
    ControlUnit uut (
        .op(op),
        .funct(funct),
        .zero(zero),
        .mem_to_reg(mem_to_reg),
        .mem_write(mem_write),
        .branch(branch),
        .pc_src(pc_src),
        .alu_src(alu_src),
        .reg_dst(reg_dst),
        .reg_write(reg_write),
        .jump(jump),
        .alu_control(alu_control)
    );

    // Test sequence
    initial begin
        // Initialize Inputs
        op = 6'b000000; // Example opcode for R-type instructions
        funct = 6'b100000; // Example funct for ADD
        zero = 0;

        // Wait for some time to ensure initialization
        #10;

        // Test R-type instruction (e.g., ADD)
        op = 6'b000000;
        funct = 6'b100000; // ADD
        zero = 0; // Zero flag set to 0
        #10;
        $display("R-type ADD: mem_to_reg = %b, mem_write = %b, branch = %b, pc_src = %b, alu_src = %b, reg_dst = %b, reg_write = %b, jump = %b, alu_control = %b", 
                 mem_to_reg, mem_write, branch, pc_src, alu_src, reg_dst, reg_write, jump, alu_control);

        // Test LW instruction
        op = 6'b100011; // LW opcode
        funct = 6'b000000; // Not used for LW
        zero = 0;
        #10;
        $display("LW: mem_to_reg = %b, mem_write = %b, branch = %b, pc_src = %b, alu_src = %b, reg_dst = %b, reg_write = %b, jump = %b, alu_control = %b",
                 mem_to_reg, mem_write, branch, pc_src, alu_src, reg_dst, reg_write, jump, alu_control);

        // Test SW instruction
        op = 6'b101011; // SW opcode
        funct = 6'b000000; // Not used for SW
        zero = 0;
        #10;
        $display("SW: mem_to_reg = %b, mem_write = %b, branch = %b, pc_src = %b, alu_src = %b, reg_dst = %b, reg_write = %b, jump = %b, alu_control = %b",
                 mem_to_reg, mem_write, branch, pc_src, alu_src, reg_dst, reg_write, jump, alu_control);

        // Test BEQ instruction
        op = 6'b000100; // BEQ opcode
        funct = 6'b000000; // Not used for BEQ
        zero = 1; // Zero flag set to 1
        #10;
        $display("BEQ: mem_to_reg = %b, mem_write = %b, branch = %b, pc_src = %b, alu_src = %b, reg_dst = %b, reg_write = %b, jump = %b, alu_control = %b",
                 mem_to_reg, mem_write, branch, pc_src, alu_src, reg_dst, reg_write, jump, alu_control);

        // Test JUMP instruction
        op = 6'b000010; // JUMP opcode
        funct = 6'b000000; // Not used for JUMP
        zero = 0;
        #10;
        $display("JUMP: mem_to_reg = %b, mem_write = %b, branch = %b, pc_src = %b, alu_src = %b, reg_dst = %b, reg_write = %b, jump = %b, alu_control = %b",
                 mem_to_reg, mem_write, branch, pc_src, alu_src, reg_dst, reg_write, jump, alu_control);

        // Finish the simulation
        $finish;
    end

endmodule
