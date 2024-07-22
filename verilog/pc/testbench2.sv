module increment_PC_tb;
    reg [31:0] current_PC;
    wire [31:0] next_PC;
    integer i;

    // Instancia o módulo increment_PC
    increment_PC dut (
        .current_PC(current_PC),
        .next_PC(next_PC)
    );

    initial begin
        // Inicializa current_PC
        current_PC = 32'h00011000000000000000000000000000;

        // Monitora os valores de current_PC e next_PC
        $monitor("current_PC = %h, next_PC = %h", current_PC, next_PC);

        // Loop para gerar os próximos 50 valores de next_PC
      for (i = 0; i < 10; i = i + 1) begin
            #10;
            current_PC = next_PC;
        end

        // Finaliza a simulação
        $finish;
    end
endmodule
