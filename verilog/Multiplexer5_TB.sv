`timescale 1ns / 1ps

module Multiplexer5_tb;

    // Inputs
    reg [4:0] in0;
    reg [4:0] in1;
    reg sel;

    // Outputs
    wire [4:0] out;

    // Instantiate the Unit Under Test (UUT)
    Multiplexer5 uut (
        .in0(in0),
        .in1(in1),
        .sel(sel),
        .out(out)
    );

    // Test sequence
    initial begin
        // Test case 1: sel = 0, output should be in0
        in0 = 5'd15;  // Binary: 01111
        in1 = 5'd25;  // Binary: 11001
        sel = 0;
        #10;
        $display("sel = %b, in0 = %d, in1 = %d, out = %d", sel, in0, in1, out); // Expected out = 15

        // Test case 2: sel = 1, output should be in1
        sel = 1;
        #10;
        $display("sel = %b, in0 = %d, in1 = %d, out = %d", sel, in0, in1, out); // Expected out = 25

        // Test case 3: Test with different values
        in0 = 5'd3;   // Binary: 00011
        in1 = 5'd31;  // Binary: 11111
        sel = 0;
        #10;
        $display("sel = %b, in0 = %d, in1 = %d, out = %d", sel, in0, in1, out); // Expected out = 3

        sel = 1;
        #10;
        $display("sel = %b, in0 = %d, in1 = %d, out = %d", sel, in0, in1, out); // Expected out = 31

        // Test case 4: Test with all zeros
        in0 = 5'd0;  // Binary: 00000
        in1 = 5'd0;  // Binary: 00000
        sel = 0;
        #10;
        $display("sel = %b, in0 = %d, in1 = %d, out = %d", sel, in0, in1, out); // Expected out = 0

        sel = 1;
        #10;
        $display("sel = %b, in0 = %d, in1 = %d, out = %d", sel, in0, in1, out); // Expected out = 0

        // Test case 5: Test with maximum value for 5-bit
        in0 = 5'd31;  // Binary: 11111
        in1 = 5'd16;  // Binary: 10000
        sel = 0;
        #10;
        $display("sel = %b, in0 = %d, in1 = %d, out = %d", sel, in0, in1, out); // Expected out = 31

        sel = 1;
        #10;
        $display("sel = %b, in0 = %d, in1 = %d, out = %d", sel, in0, in1, out); // Expected out = 16

        // Finish the simulation
        $finish;
    end

endmodule
