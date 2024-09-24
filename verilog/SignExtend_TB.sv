`timescale 1ns / 1ps

module SignExtend_tb;

    // Inputs
    reg [15:0] a;

    // Outputs
    wire [31:0] y;

    // Instantiate the Unit Under Test (UUT)
    SignExtend uut (
        .a(a),
        .y(y)
    );

    // Test sequence
    initial begin
        // Test with a positive number
        a = 16'h000A; // 0000 0000 0000 1010
        #10;
        $display("a = %h, y = %h", a, y); // Expected y = 0000 0000 0000 0000 0000 0000 0000 1010

        // Test with a negative number (using hexadecimal for clarity)
        a = 16'hFFF6; // 1111 1111 1111 0110 (which is -10 in decimal)
        #10;
        $display("a = %h, y = %h", a, y); // Expected y = 1111 1111 1111 1111 1111 1111 1111 0110

        // Test with zero
        a = 16'h0000; // 0000 0000 0000 0000
        #10;
        $display("a = %h, y = %h", a, y); // Expected y = 0000 0000 0000 0000 0000 0000 0000 0000

        // Test with maximum positive value
        a = 16'h7FFF; // 0111 1111 1111 1111
        #10;
        $display("a = %h, y = %h", a, y); // Expected y = 0000 0000 0000 0000 0111 1111 1111 1111

        // Test with maximum negative value
        a = 16'h8000; // 1000 0000 0000 0000
        #10;
        $display("a = %h, y = %h", a, y); // Expected y = 1111 1111 1111 1111 1000 0000 0000 0000

        // Finish the simulation
        $finish;
    end

endmodule
