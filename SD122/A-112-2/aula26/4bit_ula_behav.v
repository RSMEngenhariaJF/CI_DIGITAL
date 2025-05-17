module ula (
    input  [3:0] A,         // Operando A
    input  [3:0] B,         // Operando B
    input  [2:0] seletor,   // Sinal de seleção (3 bits)
    input C_in,
    output reg [3:0] resultado, // Resultado da operação
    output reg C_out
);
reg [4:0] soma;
    always @(*) begin
        C_out = 1'b0;
        case (seletor)
            3'b000: resultado = A & B;       // Operação AND
            3'b001: resultado = A | B;       // Operação OR
            3'b010: resultado = ~A;          // Operação NOT (aplica-se apenas ao operando A)
            3'b011: resultado = ~(A & B);    // Operação NAND
            3'b100: begin 
                soma = A + B + C_in;       // Soma
                {C_out,resultado} = soma;
            end
            3'b101: resultado = A - B;       // Subtração
            default: resultado = 4'b0000;    // Operação padrão (zero)
        endcase
    end
endmodule
