`timescale 1ns / 1ps

module Adder_tb;

    // Inputs
    reg [31:0] a;
    reg [31:0] b;

    // Outputs
    wire [31:0] y;

    // Instantiate the Unit Under Test (UUT)
    Adder uut (
        .a(a),
        .b(b),
        .y(y)
    );

    // Test sequence
    initial begin
        // Test case 1: Simple addition
        a = 32'd15;
        b = 32'd25;
        #10;
        $display("a = %d, b = %d, y = %d", a, b, y); // Expected y = 40

        // Test case 2: Adding zeros
        a = 32'd0;
        b = 32'd0;
        #10;
        $display("a = %d, b = %d, y = %d", a, b, y); // Expected y = 0

        // Test case 3: Adding large numbers
        a = 32'd100000;
        b = 32'd500000;
        #10;
        $display("a = %d, b = %d, y = %d", a, b, y); // Expected y = 600000

        // Test case 4: Adding maximum 32-bit values
        a = 32'h7FFFFFFF; // Maximum positive value
        b = 32'h00000001; // Small positive number
        #10;
        $display("a = %h, b = %h, y = %h", a, b, y); // Expected y = 80000000 (overflow case)

        // Test case 5: Adding smaller values
        a = 32'h00000001; // Small positive number
        b = 32'h00000002; // Small positive number
        #10;
        $display("a = %h, b = %h, y = %h", a, b, y); // Expected y = 00000003

        // Test case 6: Adding values to check boundary conditions
        a = 32'h0000FFFF; // Maximum 16-bit value
        b = 32'h00010000; // Boundary value to check carry
        #10;
        $display("a = %h, b = %h, y = %h", a, b, y); // Expected y = 00010000 + 0000FFFF = 00010000

        // Finish the simulation
        $finish;
    end

endmodule
