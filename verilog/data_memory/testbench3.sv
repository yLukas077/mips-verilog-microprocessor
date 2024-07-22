module DataMemory_tb;  

    // Declarations for the testbench  
    reg CLK;                   // Sinal de relógio adicionado  
    reg [31:0] Address;  
    reg [31:0] WriteData;  
    reg MemWrite;  
    reg MemRead;  
    wire [31:0] ReadData;  

    // Instância do DataMemory  
    DataMemory dm (  
        .CLK(CLK),             // Conectar o sinal de relógio  
        .Address(Address),  
        .WriteData(WriteData),  
        .MemWrite(MemWrite),  
        .MemRead(MemRead),  
        .ReadData(ReadData)  
    );  

    // Geração do sinal de relógio  
    initial begin  
        CLK = 0;  
        forever #5 CLK = ~CLK;  // Inverte CLK a cada 5 unidades de tempo (10 ns de período)  
    end  

    // Testbench control variables  
    initial begin  
        // Inicializar sinais  
        MemWrite = 0;  
        MemRead = 0;  
        Address = 0;  
        WriteData = 0;  

        // Escrever na memória  
        // Teste para 'altura'  
        MemWrite = 1;              // Ativa escrita  
        Address = 32'h00000000;    // Endereço para altura  
        WriteData = 32'd170;       // Valor de altura  
        #10;                       // Atraso para escrever  
        MemWrite = 0;              // Desativa escrita  
        
        // Teste para 'peso'  
        MemWrite = 1;              // Ativa escrita  
        Address = 32'h00000004;    // Endereço para peso  
        WriteData = 32'd80;        // Valor de peso  
        #10;                       // Atraso para escrever  
        MemWrite = 0;              // Desativa escrita  
        
        // Ler da memória para verificar os valores  
        // Teste de leitura para 'altura'  
        MemRead = 1;               // Ativa leitura  
        Address = 32'h00000000;    // Endereço para altura  
        #10;                       // Atraso para ler  
        MemRead = 0;               // Desativa leitura  
        $display("Altura: %d", ReadData); // Exibe o valor de altura  
        
        // Teste de leitura para 'peso'  
        MemRead = 1;               // Ativa leitura  
        Address = 32'h00000004;    // Endereço para peso  
        #10;                       // Atraso para ler  
        MemRead = 0;               // Desativa leitura  
        $display("Peso: %d", ReadData); // Exibe o valor de peso  

        // Encerrar a simulação  
        $finish;  
    end  

endmodule