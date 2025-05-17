//! Somador de 4-bits com carry look -ahead
module carry_look_ahead_adder_param #(parameter N) (
        input [N-1:0] A, //! Entrada A (4 bits)
        input [N-1:0] B, //! Entrada B (4 bits)
        input C_in , //! Carry inicial
        output [N-1:0] S, //! Soma final (4 bits)
        output C_out //! Carry final
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

 // Calcular os carries intermediários
 /*assign C[1] = G[0] | (P[0] & C[0]);
 assign C[2] = G[1] | (P[1] & C[1]);
 assign C[3] = G[2] | (P[2] & C[2]);
 assign C[4] = G[3] | (P[3] & C[3]);
*/
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

 endmodule