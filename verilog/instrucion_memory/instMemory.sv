module InstructionMemory (  
    input [31:0] PC,  
    output [31:0] Instr  
);  
    reg [31:0] memory [0:255]; // Memória de 256 instruções  

    initial begin  
        memory[0] = 32'h8C100000; // lw $s1, altura  
        memory[1] = 32'h8C120004; // lw $s2, peso  
        memory[2] = 32'h0C00000C; // jal calcular_imc  
        memory[3] = 32'h16B50004; // blt $t5, 19, retorno1  
        memory[4] = 32'h1AB50004; // bge $t5, 19, retorno2  
        memory[5] = 32'h21370027; // addi $t7, $t6, 10000  
        memory[6] = 32'h02121003; // mul $a1, $s2, $t7  
        memory[7] = 32'h0211101B; // mul $t1, $s1, $s1  
        memory[8] = 32'h014D6020; // div $a1, $t1  
        memory[9] = 32'h00000012; // mflo $t5  
        memory[10] = 32'h03E00008; // jr $ra  
        memory[11] = 32'h21340001; // addi $a0, $t6, 1  
        memory[12] = 32'h0800001C; // j saida  
        memory[13] = 32'h1AD50003; // bgt $t5, 25, retorno3  
        memory[14] = 32'h21340002; // addi $a0, $t6, 2  
        memory[15] = 32'h0800001C; // j saida  
        memory[16] = 32'h21340003; // addi $a0, $t6, 3  
        memory[17] = 32'h0800001C; // j saida  
        memory[18] = 32'h240A000A; // li $v0, 10  
        memory[19] = 32'h0000000C; // syscall  
    end  

    assign Instr = memory[PC[7:2]]; // Acesso à memória  
endmodule