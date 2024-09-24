`timescale 1ns / 1ps

module DataMemory_tb;

    // Inputs
    reg clk;
    reg we;
    reg [31:0] address;
    reg [31:0] write_data;

    // Outputs
    wire [31:0] read_data;

    // Instantiate the Unit Under Test (UUT)
    DataMemory uut (
        .clk(clk),
        .we(we),
        .address(address),
        .write_data(write_data),
        .read_data(read_data)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #10 clk = ~clk; // 50 MHz clock
    end

    // Test sequence
    initial begin
        // Initialize Inputs
        we = 0;
        address = 0;
        write_data = 0;

        // Wait for some time to ensure initialization
        #20;

        // Test writing and reading data
        we = 1;
        address = 32'h00000000; // Write to address 0
        write_data = 32'hA5A5A5A5; // Arbitrary data
        #20; // Wait for write to complete

        we = 0;
        #10;
        address = 32'h00000000; // Read from address 0
        #10;
        $display("Address = %h, Read Data = %h", address, read_data);

        // Write to another address
        we = 1;
        address = 32'h00000004; // Write to address 1
        write_data = 32'h5A5A5A5A; // Arbitrary data
        #20; // Wait for write to complete

        we = 0;
        #10;
        address = 32'h00000004; // Read from address 1
        #10;
        $display("Address = %h, Read Data = %h", address, read_data);

        // Test write-enable and read-enable combination
        we = 1;
        address = 32'h00000008; // Write to address 2
        write_data = 32'hDEADBEEF; // Arbitrary data
        #20; // Wait for write to complete

        we = 0;
        #10;
        address = 32'h00000008; // Read from address 2
        #10;
        $display("Address = %h, Read Data = %h", address, read_data);

        // Test out-of-range address
        address = 32'h00000040; // Address out of range
        #10;
        $display("Address = %h, Read Data = %h", address, read_data);

        // Finish the simulation
        $finish;
    end

endmodule
