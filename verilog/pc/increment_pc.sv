module increment_PC (  
    input wire [31:0] current_PC,  
    output reg [31:0] next_PC  
);  

always @(*) begin  
    next_PC = current_PC + 4; // Incrementa o PC adicionando 4 (considerando um PC de 32 bits)  
end  

endmodule