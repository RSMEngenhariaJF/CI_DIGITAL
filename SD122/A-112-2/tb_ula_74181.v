`timescale 1ns/1ps

module tb_74181;

  // Declaração de entradas e saídas
  reg [3:0] A, B;        // Entradas A e B (4 bits)
  reg [3:0] S;           // Entradas de seleção de operação (4 bits)
  reg M;                 // Modo (0 = lógico, 1 = aritmético)
  reg carry_in;          // Carry-in
  wire [3:0] F;          // Saída da ULA
  wire carry_out;        // Carry-out
  wire equal;            // Flag de igualdade

  // Instância da ULA 74181
  ula_74181 uut (
    .A(A),
    .B(B),
    .S(S),
    .M(M),
    .carry_in(carry_in),
    .F(F),
    .carry_out(carry_out),
    .equal(equal)
  );

  // Processo de teste
  initial begin
    $display("Hora |  A   |  B   |  S   | M | Carry_in |  F   | Carry_out | Equal");
    $monitor("%4t | %b | %b | %b | %b |    %b     | %b |     %b     |   %b",
             $time, A, B, S, M, carry_in, F, carry_out, equal);

    // Inicializa os sinais
    A = 4'b0000; B = 4'b0000; S = 4'b0000; M = 0; carry_in = 0;

    // Testa todas as combinações de entradas
    repeat (16) begin
      B = 4'b0000;
      repeat (16) begin
        S = 4'b0000;
        repeat (16) begin
          carry_in = 0;
          repeat (2) begin
            #10 carry_in = ~carry_in; // Alterna carry_in
          end
          #10 S = S + 1; // Incrementa S
        end
        #10 B = B + 1; // Incrementa B
      end
      #10 A = A + 1; // Incrementa A
    end

    // Testa Modo Aritmético e Lógico
    M = 1;
    A = 4'b1010; B = 4'b0101; S = 4'b0011; carry_in = 1;
    #20 M = 0;

    // Finaliza a simulação
    #100 $finish;
  end

endmodule
