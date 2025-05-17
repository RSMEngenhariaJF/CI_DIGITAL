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