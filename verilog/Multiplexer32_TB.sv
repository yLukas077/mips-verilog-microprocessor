`timescale 1ns / 1ps

module Multiplexer32_tb;

    // Inputs
    reg [31:0] in0;
    reg [31:0] in1;
    reg sel;

    // Outputs
    wire [31:0] out;

    // Instantiate the Unit Under Test (UUT)
    Multiplexer32 uut (
        .in0(in0),
        .in1(in1),
        .sel(sel),
        .out(out)
    );

    // Test sequence
    initial begin
        // Test case 1: sel = 0, output should be in0
        in0 = 32'h0000000F; // Binary: 0000 0000 0000 0000 0000 0000 0000 1111
        in1 = 32'h0000001A; // Binary: 0000 0000 0000 0000 0000 0000 0001 1010
        sel = 0;
        #10;
        $display("sel = %b, in0 = %h, in1 = %h, out = %h", sel, in0, in1, out); // Expected out = 0F

        // Test case 2: sel = 1, output should be in1
        sel = 1;
        #10;
        $display("sel = %b, in0 = %h, in1 = %h, out = %h", sel, in0, in1, out); // Expected out = 1A

        // Test case 3: Test with different values
        in0 = 32'h12345678; // Binary: 0001 0010 0011 0100 0101 0110 0111 1000
        in1 = 32'h87654321; // Binary: 1000 0111 0110 0100 0011 0010 0001 0001
        sel = 0;
        #10;
        $display("sel = %b, in0 = %h, in1 = %h, out = %h", sel, in0, in1, out); // Expected out = 12345678

        sel = 1;
        #10;
        $display("sel = %b, in0 = %h, in1 = %h, out = %h", sel, in0, in1, out); // Expected out = 87654321

        // Test case 4: Test with all zeros
        in0 = 32'h00000000; // Binary: 0000 0000 0000 0000 0000 0000 0000 0000
        in1 = 32'h00000000; // Binary: 0000 0000 0000 0000 0000 0000 0000 0000
        sel = 0;
        #10;
        $display("sel = %b, in0 = %h, in1 = %h, out = %h", sel, in0, in1, out); // Expected out = 00000000

        sel = 1;
        #10;
        $display("sel = %b, in0 = %h, in1 = %h, out = %h", sel, in0, in1, out); // Expected out = 00000000

        // Test case 5: Test with maximum 32-bit values
        in0 = 32'hFFFFFFFF; // Binary: 1111 1111 1111 1111 1111 1111 1111 1111
        in1 = 32'h80000000; // Binary: 1000 0000 0000 0000 0000 0000 0000 0000
        sel = 0;
        #10;
        $display("sel = %b, in0 = %h, in1 = %h, out = %h", sel, in0, in1, out); // Expected out = FFFFFFFF

        sel = 1;
        #10;
        $display("sel = %b, in0 = %h, in1 = %h, out = %h", sel, in0, in1, out); // Expected out = 80000000

        // Finish the simulation
        $finish;
    end

endmodule
