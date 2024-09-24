`timescale 1ns / 1ps

module ProgramCounter_tb;

    // Inputs
    reg clk;
    reg reset;
    reg [31:0] pc_in;

    // Outputs
    wire [31:0] pc_out;

    // Instantiate the Unit Under Test (UUT)
    ProgramCounter uut (
        .clk(clk),
        .reset(reset),
        .pc_in(pc_in),
        .pc_out(pc_out)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #10 clk = ~clk; // 50 MHz clock
    end

    // Test sequence
    initial begin
        // Initialize Inputs
        reset = 0;
        pc_in = 0;

        // Apply reset
        #5;
        reset = 1;
        #10;
        reset = 0;

        // Test with some values
        pc_in = 32'h00000001; // Arbitrary value
        #20;
        
        pc_in = 32'h00000002;
        #20;

        pc_in = 32'h00000003;
        #20;

        // Apply reset again
        reset = 1;
        #10;
        reset = 0;

        // Test with new values after reset
        pc_in = 32'h00000010;
        #20;

        pc_in = 32'h00000020;
        #20;

        // Finish the simulation
        $finish;
    end

    // Monitor outputs
    initial begin
        $monitor("At time %t, pc_in = %h, pc_out = %h", $time, pc_in, pc_out);
    end

endmodule
