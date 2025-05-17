`timescale 1ns / 1ps
module tb_carry_look_ahead_adder;
    // Entradas do DUT (Design Under Test)
    reg [7:0] A;
    reg [7:0] B;
    reg C_in;
    // Saídas do DUT
    wire [7:0] S;
    wire C_out;
    // Instância do módulo Carry Look-Ahead Adder

      
    
    // Instanciar aqui os módulos a serem testados, um por vez.
    /*
        rtl_4bit_carry_look_ahead_adder DUT(
            .A(A), //! Entradas de 4 bits
            .B(B), //! Entradas de 4 bits
            .Cin(C_in), //! Carry de entrada
            .Sum(S), //! Soma de 4 bits
            .Cout(C_out) //! Carry de saída
        );
    
        behave_4bit_carry_lookahead_adder DUT(
            .A(A), //! Entradas de 4 bits
            .B(B), //! Entradas de 4 bits
            .Cin(C_in), //! Carry de entrada
            .Sum(S), //! Soma de 4 bits
            .Cout(C_out) //! Carry de saída
        );
    */
    behave_4bit_carry_lookahead_adder_parameter #(8) DUT(
            .A(A), //! Entradas de 4 bits
            .B(B), //! Entradas de 4 bits
            .Cin(C_in), //! Carry de entrada
            .Sum(S), //! Soma de 4 bits
            .Cout(C_out) //! Carry de saída
        );
    
    initial begin
         // Exibe os valores na simulação
        $monitor("Tempo: %0t | A = %b | B = %b | C_in = %b | S = %b | C_out = %b", $time, A, B, C_in, S, C_out);
    end
    initial begin
        // Teste 1: Exemplo do problema
        A = 8'b10110111; B = 8'b11010000; C_in = 0;
        #10;
        // Teste 2: Soma sem carry final
        A = 8'b01010000; B = 8'b00110000; C_in = 0;
        #10;
        // Teste 3: Soma com carry inicial não nulo
        A = 8'b10010000; B = 8'b01100000; C_in = 1;
        #10;
        // Teste 4: Todos os bits em 1
        A = 8'b11110000; B = 8'b11110000; C_in = 0;
        #10;
        // Finalizar simulação
        $stop;
    end
endmodule
