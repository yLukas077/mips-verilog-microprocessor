`timescale 1ns / 1ps

module ALU_tb;

    // Inputs
    reg [31:0] srcA;
    reg [31:0] srcB;
    reg [3:0] alu_control;

    // Outputs
    wire [31:0] alu_result;
    wire zero;

    // Instantiate the Unit Under Test (UUT)
    ALU uut (
        .srcA(srcA),
        .srcB(srcB),
        .alu_control(alu_control),
        .alu_result(alu_result),
        .zero(zero)
    );

    // Test sequence
    initial begin
        // Initialize Inputs
        srcA = 32'd0;
        srcB = 32'd0;
        alu_control = 4'b0000;

        // Test ADD operation
        srcA = 32'd10;
        srcB = 32'd5;
        alu_control = 4'b0010; // ALU control for addition
        #10;
        $display("ADD: srcA = %d, srcB = %d, alu_result = %d, zero = %b", srcA, srcB, alu_result, zero);

        // Test SUB operation
        srcA = 32'd10;
        srcB = 32'd5;
        alu_control = 4'b0110; // ALU control for subtraction
        #10;
        $display("SUB: srcA = %d, srcB = %d, alu_result = %d, zero = %b", srcA, srcB, alu_result, zero);

        // Test zero result
        srcA = 32'd5;
        srcB = 32'd5;
        alu_control = 4'b0110; // ALU control for subtraction
        #10;
        $display("SUB (Zero Result): srcA = %d, srcB = %d, alu_result = %d, zero = %b", srcA, srcB, alu_result, zero);

        // Test default case
        srcA = 32'd10;
        srcB = 32'd5;
        alu_control = 4'b0000; // Default case
        #10;
        $display("Default: srcA = %d, srcB = %d, alu_result = %d, zero = %b", srcA, srcB, alu_result, zero);

        // Finish the simulation
        $finish;
    end

endmodule
