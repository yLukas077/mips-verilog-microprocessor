`timescale 1ns / 1ps

module InstructionMemory_tb;

    // Inputs
    reg [31:0] PC;

    // Outputs
    wire [31:0] instruction;

    // Instantiate the Unit Under Test (UUT)
    InstructionMemory uut (
        .PC(PC),
        .instruction(instruction)
    );

    // Test sequence
    initial begin
        // Initialize Inputs
        PC = 0;

        // Wait for some time to ensure initialization
        #10;

        // Test different values of PC
        PC = 32'h00000000; // Should access memory[0]
        #10;
        $display("PC = %h, instruction = %h", PC, instruction);

        PC = 32'h00000004; // Should access memory[1]
        #10;
        $display("PC = %h, instruction = %h", PC, instruction);

        PC = 32'h00000008; // Should access memory[2]
        #10;
        $display("PC = %h, instruction = %h", PC, instruction);

        PC = 32'h0000000C; // Should access memory[3]
        #10;
        $display("PC = %h, instruction = %h", PC, instruction);

        // Test out of range addresses
        PC = 32'h00000040; // Should be outside the memory range
        #10;
        $display("PC = %h, instruction = %h", PC, instruction);

        // Finish the simulation
        $finish;
    end

endmodule
