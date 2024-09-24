`timescale 1ns / 1ps

module AluDecoder_tb;

    // Inputs
    reg [5:0] funct;
    reg [1:0] alu_op;

    // Outputs
    wire [3:0] alu_control;

    // Instantiate the Unit Under Test (UUT)
    AluDecoder uut (
        .funct(funct),
        .alu_op(alu_op),
        .alu_control(alu_control)
    );

    // Test sequence
    initial begin
        // Initialize Inputs
        funct = 6'b000000;
        alu_op = 2'b00;

        // Test ALU control for ALU_OP = 2'b00
        #10;
        $display("ALU_OP = %b, funct = %b, alu_control = %b", alu_op, funct, alu_control);

        // Test ALU control for ALU_OP = 2'b01
        alu_op = 2'b01;
        #10;
        $display("ALU_OP = %b, funct = %b, alu_control = %b", alu_op, funct, alu_control);

        // Test ALU control for ALU_OP = 2'b10 with funct = 6'b100000
        alu_op = 2'b10;
        funct = 6'b100000; // ADD
        #10;
        $display("ALU_OP = %b, funct = %b, alu_control = %b", alu_op, funct, alu_control);

        // Test ALU control for ALU_OP = 2'b10 with funct = 6'b100010
        funct = 6'b100010; // SUB
        #10;
        $display("ALU_OP = %b, funct = %b, alu_control = %b", alu_op, funct, alu_control);

        // Test ALU control for ALU_OP = 2'b10 with unknown funct
        funct = 6'b111111; // Unknown funct
        #10;
        $display("ALU_OP = %b, funct = %b, alu_control = %b", alu_op, funct, alu_control);

        // Test ALU control for unknown ALU_OP
        alu_op = 2'b11;
        funct = 6'b000000; // Arbitrary funct
        #10;
        $display("ALU_OP = %b, funct = %b, alu_control = %b", alu_op, funct, alu_control);

        // Finish the simulation
        $finish;
    end

endmodule
