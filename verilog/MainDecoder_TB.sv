`timescale 1ns / 1ps

module MainDecoder_tb;

    // Inputs
    reg [5:0] op;

    // Outputs
    wire mem_to_reg;
    wire mem_write;
    wire alu_src;
    wire reg_dst;
    wire reg_write;
    wire jump;
    wire branch;
    wire [1:0] alu_op;

    // Instantiate the Unit Under Test (UUT)
    MainDecoder uut (
        .op(op),
        .mem_to_reg(mem_to_reg),
        .mem_write(mem_write),
        .alu_src(alu_src),
        .reg_dst(reg_dst),
        .reg_write(reg_write),
        .jump(jump),
        .branch(branch),
        .alu_op(alu_op)
    );

    // Test sequence
    initial begin
        // Initialize Inputs
        op = 6'b000000; // Example opcode for R-type instructions
        #10;
        $display("Opcode = %b, mem_to_reg = %b, mem_write = %b, alu_src = %b, reg_dst = %b, reg_write = %b, jump = %b, branch = %b, alu_op = %b", 
                 op, mem_to_reg, mem_write, alu_src, reg_dst, reg_write, jump, branch, alu_op);

        // Test I-type instruction (e.g., ADDI)
        op = 6'b001000; // ADDI opcode
        #10;
        $display("Opcode = %b, mem_to_reg = %b, mem_write = %b, alu_src = %b, reg_dst = %b, reg_write = %b, jump = %b, branch = %b, alu_op = %b",
                 op, mem_to_reg, mem_write, alu_src, reg_dst, reg_write, jump, branch, alu_op);

        // Test SW instruction
        op = 6'b101011; // SW opcode
        #10;
        $display("Opcode = %b, mem_to_reg = %b, mem_write = %b, alu_src = %b, reg_dst = %b, reg_write = %b, jump = %b, branch = %b, alu_op = %b",
                 op, mem_to_reg, mem_write, alu_src, reg_dst, reg_write, jump, branch, alu_op);

        // Test Default Case
        op = 6'b111111; // Unknown opcode
        #10;
        $display("Opcode = %b, mem_to_reg = %b, mem_write = %b, alu_src = %b, reg_dst = %b, reg_write = %b, jump = %b, branch = %b, alu_op = %b",
                 op, mem_to_reg, mem_write, alu_src, reg_dst, reg_write, jump, branch, alu_op);

        // Finish the simulation
        $finish;
    end

endmodule
