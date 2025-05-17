`timescale 1ns / 1ps

module ula_12bits_tb();

    reg [11:0] A;             // Operando A
    reg [11:0] B;             // Operando B
    reg carry_in;             // Carry-in
    reg [2:0] seletor;        // Seletor de operação
    wire [11:0] resultado;    // Resultado da operação
    wire carry_out;           // Carry-out

    // Instanciando a ULA de 12 bits
    ula_bits uut (
        .A(A),
        .B(B),
        .carry_in(carry_in),
        .seletor(seletor),
        .resultado(resultado),
        .carry_out(carry_out)
    );

    initial begin
        // Teste AND
        A = 12'b101010101010; B = 12'b110011001100; seletor = 3'b000; carry_in = 0;
        #10;

        // Teste OR
        A = 12'b101010101010; B = 12'b110011001100; seletor = 3'b001; carry_in = 0;
        #10;

        // Teste NOT (apenas A)
        A = 12'b101010101010; seletor = 3'b010; carry_in = 0;
        #10;

        // Teste NAND
        A = 12'b101010101010; B = 12'b110011001100; seletor = 3'b011; carry_in = 0;
        #10;

        // Teste Soma com carry_in = 0
        A = 12'b000011110000; B = 12'b000000001111; seletor = 3'b100; carry_in = 0;
        #10;

        // Teste Soma com carry_in = 1
        A = 12'b000011110000; B = 12'b000000001111; seletor = 3'b100; carry_in = 1;
        #10;

        // Teste Subtração sem empréstimo
        A = 12'b000011110000; B = 12'b000000000011; seletor = 3'b101; carry_in = 0;
        #10;

        // Teste Subtração com empréstimo
        A = 12'b000000001000; B = 12'b000000010000; seletor = 3'b101; carry_in = 1;
        #10;

        // Teste padrão (seletor inválido)
        A = 12'b101010101010; B = 12'b010101010101; seletor = 3'b111; carry_in = 0;
        #10;

        $finish;
    end

    initial begin
        $monitor("Tempo: %0t | A = %b | B = %b | Carry_in = %b | Seletor = %b | Resultado = %b | Carry_out = %b",
                 $time, A, B, carry_in, seletor, resultado, carry_out);
    end

endmodule
