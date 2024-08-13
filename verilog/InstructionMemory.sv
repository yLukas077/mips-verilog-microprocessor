module InstructionMemory(
	input [31:0] PC, 
  	output reg[31:0] instruction
);

  reg[31:0] memory[0:31];

  initial begin
    $readmemb("instructions_memory.txt", memory, 0, 9);
  end

  always @(PC) begin
      instruction = memory[PC >> 2];
  end
  
endmodule

