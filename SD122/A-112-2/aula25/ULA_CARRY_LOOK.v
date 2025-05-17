//! Somador de 4-bits com carry look -ahead
module carry_look_ahead_adder_param #(parameter N) (
    input [N-1:0] A, //! Entrada A (4 bits)
    input [N-1:0] B, //! Entrada B (4 bits)
    input C_in , //! Carry inicial
    output [N-1:0] S, //! Soma final (4 bits)
    output C_out, //! Carry final
    output Gerado,Propagado
);
// Sinais intermediários para Carry -Generate (G) e  Carry -Propagate (P)
wire [N-1:0] G; //! Carry -Generate
wire [N-1:0] P; //! Carry -Propagate
wire [N:0] C; //! Carry intermediário (C[0] = C_in , C[4] = 

// Associar o Carry de entrada
assign C[0] = C_in;
// Calcular G e P
assign G = A & B; // G_i = A_i AND B_i
assign P = A | B; // P_i = A_i OR B_i

genvar i;
generate
    for (i = 0; i < N; i = i + 1) begin 
        assign C[i+1] = G[i] | (P[i] & C[i]);
    end
endgenerate
// Calcular a soma
assign S = A ^ B ^ C[N-1:0]; // S_i = A_i XOR B_i XOR C_i

// Associar o Carry final
assign C_out = C[N];
assign Gerado = G;
assign Propagado = P;

endmodule

module ula (
    input  [3:0] A,         // Operando A
    input  [3:0] B,         // Operando B
    input  [2:0] seletor,   // Sinal de seleção (3 bits)
    input carry_in,
    output reg [3:0] resultado, // Resultado da operação
    output reg propagado, gerado, carry_out
);
reg [3:0] soma;
reg [3:0] G, P;
reg [3:0] C;

initial begin
    G <= 4'b0;
    P <= 4'b0;
    C <= 4'b0;
end
    always @(*) begin
        carry_out <= 1'b0;
        propagado <= 1'b0;
        gerado <= 1'b0;
        case (seletor)
            3'b000: resultado = A & B;       // Operação AND
            3'b001: resultado = A | B;       // Operação OR
            3'b010: resultado = ~A;          // Operação NOT (aplica-se apenas ao operando A)
            3'b011: resultado = ~(A & B);    // Operação NAND
            3'b100:begin
                C[0] <= carry_in;
                C[1] <= G[0] | (P[0] & C[0]);
                C[2] <= G[1] | (P[1] & C[1]);
                C[3] <= G[2] | (P[2] & C[2]);
                carry_out <= G[3] | (P[3] & C[3]);
                G <= A & B; 
                P <= A | B;
                soma <= A + B + {3'b000,carry_in} ;
                resultado <= soma;       // Soma
                //carry_out = C[4];
                propagado <= P[3];
                gerado <= G[3];
            end
            3'b101: resultado = A - B;       // Subtração
            default: resultado = 4'b0000;    // Operação padrão (zero)
        endcase
    end
endmodule