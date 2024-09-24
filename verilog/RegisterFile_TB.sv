`timescale 1ns / 1ps

module RegisterFile_tb;

    // Inputs
    reg clk;
    reg we3;
    reg [4:0] ra1, ra2, wa3;
    reg [31:0] wd3;

    // Outputs
    wire [31:0] rd1;
    wire [31:0] rd2;

    // Instantiate the Unit Under Test (UUT)
    RegisterFile uut (
        .clk(clk),
        .we3(we3),
        .ra1(ra1),
        .ra2(ra2),
        .wa3(wa3),
        .wd3(wd3),
        .rd1(rd1),
        .rd2(rd2)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #10 clk = ~clk; // 50 MHz clock
    end

    // Test sequence
    initial begin
        // Initialize Inputs
        we3 = 0;
        ra1 = 5'd0;
        ra2 = 5'd1;
        wa3 = 5'd0;
        wd3 = 32'd0;

        // Wait for global reset
        #20;

        // Write data to register 5
        we3 = 1;
        wa3 = 5'd5; // Write to register 5
        wd3 = 32'h12345678; // Arbitrary data
        #20; // Wait for write to complete

        // Read from register 5
        we3 = 0;
        ra1 = 5'd5; // Read from register 5
        ra2 = 5'd1; // Read from register 1 (should be 0)
        #20;
        $display("After writing: ra1 = %d, rd1 = %h, ra2 = %d, rd2 = %h", ra1, rd1, ra2, rd2);

        // Write to another register
        we3 = 1;
        wa3 = 5'd10; // Write to register 10
        wd3 = 32'hDEADBEEF; // Arbitrary data
        #20; // Wait for write to complete

        // Read from new register
        we3 = 0;
        ra1 = 5'd10; // Read from register 10
        ra2 = 5'd5;  // Read from register 5
        #20;
        $display("After second write: ra1 = %d, rd1 = %h, ra2 = %d, rd2 = %h", ra1, rd1, ra2, rd2);

        // Test with multiple reads
        ra1 = 5'd10; // Read from register 10
        ra2 = 5'd0;  // Read from register 0 (should be 0)
        #20;
        $display("Multiple reads: ra1 = %d, rd1 = %h, ra2 = %d, rd2 = %h", ra1, rd1, ra2, rd2);

        // Finish the simulation
        $finish;
    end

endmodule
