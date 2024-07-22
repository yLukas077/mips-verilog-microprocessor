module DataMemory (  
    input CLK,  
    input MemRead, MemWrite,  
    input [31:0] Address,  
    input [31:0] WriteData,  
    output [31:0] ReadData  
);  
    reg [31:0] memory [0:255];  

    always @(posedge CLK) begin  
        if (MemWrite) memory[Address[7:2]] <= WriteData; // Escrita na memória  
    end  

    assign ReadData = (MemRead) ? memory[Address[7:2]] : 32'bz; // Leitura da memória  
endmodule