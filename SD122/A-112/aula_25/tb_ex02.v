`timescale 1ns / 1ps

module ula_bits_tb();

    reg [7:0] A;             // Operando A (8 bits)
    reg [7:0] B;             // Operando B (8 bits)
    reg carry_in;            // Carry-in global
    reg [2:0] seletor;       // Seletor de operação
    wire [7:0] resultado;    // Resultado da operação
    wire carry_out;          // Carry-out global

    // Instanciando o módulo ULA de 8 bits
    ula_bits UUT (
        .A(A),
        .B(B),
        .carry_in(carry_in),
        .seletor(seletor),
        .resultado(resultado),
        .carry_out(carry_out)
    );

    initial begin
        // Teste AND
        A = 8'b10101010; B = 8'b11001100; seletor = 3'b000; carry_in = 0;
        #10;
        
        // Teste OR
        A = 8'b10101010; B = 8'b11001100; seletor = 3'b001; carry_in = 0;
        #10;

        // Teste NOT (apenas A)
        A = 8'b10101010; seletor = 3'b010; carry_in = 0;
        #10;

        // Teste NAND
        A = 8'b10101010; B = 8'b11001100; seletor = 3'b011; carry_in = 0;
        #10;

        // Teste Soma com carry_in = 0
        A = 8'b00011011; B = 8'b00010101; seletor = 3'b100; carry_in = 0;
        #10;

        // Teste Soma com carry_in = 1
        A = 8'b00011011; B = 8'b00010101; seletor = 3'b100; carry_in = 1;
        #10;

        // Teste Subtração sem empréstimo
        A = 8'b01010101; B = 8'b00110011; seletor = 3'b101; carry_in = 0;
        #10;

        // Teste Subtração com empréstimo
        A = 8'b00100000; B = 8'b01000000; seletor = 3'b101; carry_in = 1;
        #10;

        // Teste padrão (seletor inválido)
        A = 8'b11110000; B = 8'b00001111; seletor = 3'b111; carry_in = 0;
        #10;

        $finish;
    end

    initial begin
        $monitor("Tempo: %0t | A = %b | B = %b | Carry_in = %b | Seletor = %b | Resultado = %b | Carry_out = %b",
                 $time, A, B, carry_in, seletor, resultado, carry_out);
    end

endmodule
