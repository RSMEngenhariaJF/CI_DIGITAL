`timescale 1ns / 1ps

module tb_ula_8bits;
    // Declaração das entradas e saídas
    reg [7:0] A;          // Operando A
    reg [7:0] B;          // Operando B
    reg carry_in;         // Carry-in
    reg [2:0] seletor;    // Seletor de operação
    wire [7:0] resultado; // Resultado da operação
    wire carry_out;       // Carry-out final

    // Instância da ULA de 8 bits
    ula_8bits uut (
        .A(A),
        .B(B),
        .carry_in(carry_in),
        .seletor(seletor),
        .resultado(resultado),
        .carry_out(carry_out)
    );

    // Estímulos para o testbench
    initial begin
        // Exibe os resultados no console
        $monitor("Time = %0t | A = %b | B = %b | Carry_in = %b | Seletor = %b | Resultado = %b | Carry_out = %b",
                 $time, A, B, carry_in, seletor, resultado, carry_out);

        // Inicialização
        A = 8'b00000000; B = 8'b00000000; carry_in = 0; seletor = 3'b000;
        #10;

        // Teste AND
        A = 8'b11001100; B = 8'b10101010; seletor = 3'b000;
        #10;

        // Teste OR
        seletor = 3'b001;
        #10;

        // Teste NOT
        A = 8'b11110000; seletor = 3'b010;
        #10;

        // Teste NAND
        A = 8'b10101010; B = 8'b01010101; seletor = 3'b011;
        #10;

        // Teste Soma com carry_in = 0
        A = 8'b00001111; B = 8'b00000001; carry_in = 0; seletor = 3'b100;
        #10;

        // Teste Soma com carry_in = 1
        carry_in = 1;
        #10;

        // Teste Subtração com carry_in = 0
        A = 8'b10000000; B = 8'b00000001; carry_in = 0; seletor = 3'b101;
        #10;

        // Teste Subtração com carry_in = 1
        carry_in = 1;
        #10;

        // Teste padrão
        seletor = 3'b111;  // Caso não implementado
        #10;

        // Finaliza a simulação
        $finish;
    end
endmodule
