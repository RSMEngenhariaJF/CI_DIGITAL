 `timescale 1ns / 1ps
 module tb_carry_look_ahead_adder;
 // Entradas do DUT (Design Under Test)
 reg [3:0] A;
 reg [3:0] B;
 reg C_in;
 // Saídas do DUT
 wire [3:0] S;
 wire C_out;
 // Instância do módulo Carry Look -Ahead Adder
 struct_4bit_carry_look_ahead_adder DUT_1(
    .A(A), //! Operando A (4 bits)
    .B(B), //! Operando B (4 bits)
    .Cin(C_in) , //! Carry de entrada
    .Sum(S) , //! Resultado da soma (4 bits)
    .Cout(C_out) //! Carry de saída
 );
/*
 behave_4bit_carry_lookahead_adder DUT_2(
    .A(A), //! Operando A (4 bits)
    .B(B), //! Operando B (4 bits)
    .Cin(C_in) , //! Carry de entrada
    .Sum(S) , //! Resultado da soma (4 bits)
    .Cout(C_out) //! Carry de saída
 );*/
 // Instanciar aqui os módulos a serem testados , um por vez.
 initial begin
 // Exibe os valores na simulação
 $monitor("Tempo: %0t | A = %b | B = %b | C_in = %b | S = %b | C_out = %b", $time , A, B, C_in , S, C_out);
 end

 initial begin
 // Teste 1: Exemplo do problema
 A = 4'b1011; B = 4'b1101; C_in = 0;
 #10;
 // Teste 2: Soma sem carry final
 A = 4'b0101; B = 4'b0011; C_in = 0;
 #10;
 // Teste 3: Soma com carry inicial não nulo
 A = 4'b1001; B = 4'b0110; C_in = 1;
 #10;
 // Teste 4: Todos os bits em 1
 A = 4'b1111; B = 4'b1111; C_in = 0;
 #10;
 // Finalizar simulação
 $finish;
 end
 endmodule