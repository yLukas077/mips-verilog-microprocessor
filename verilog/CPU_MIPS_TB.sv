module CPU_MIPS_TB;
  reg clk;
  reg reset;
  wire [31:0] pc_out;
  wire [31:0] instruction;
  wire [31:0] rd1, rd2;
  
  CPU_MIPS uut (
    .clk(clk),
    .reset(reset)
  );

  always #5 clk = ~clk;
  
  assign pc_out = uut.pc.pc_out;
  assign instruction = uut.im.instruction;
  assign rd1 = uut.rf.rd1;
  assign rd2 = uut.rf.rd2;

 
  initial begin
    clk = 0;
    reset = 1;
    #10 reset = 0;

    $monitor("Time=%0d, PC=%h, Instruction=%h, RF[ra1]=%h, RF[ra2]=%h", $time, pc_out, instruction, rd1, rd2);

    #100;
    $finish;
    
  end
endmodule

  
