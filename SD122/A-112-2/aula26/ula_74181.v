module ula_74181 (
    input  [3:0] A,          // Operando A (4 bits)
    input  [3:0] B,          // Operando B (4 bits)
    input  [3:0] S,          // Sinais de seleção de operação (4 bits)
    input  M,                // Modo: 0 = Lógico, 1 = Aritmético
    input  carry_in,         // Carry-in para operações aritméticas
    output reg [3:0] F,      // Resultado da operação
    output reg carry_out,    // Carry-out para operações aritméticas
    output reg equal         // Indica se A == B
);
    always @(*) begin
        // Inicializa sinais de saída
        F = 4'b0000;
        carry_out = 1'b0;
        equal = 1'b0;
        // Verifica se A é igual a B
        if (A == B)
            equal = 1'b1;
        // Operações baseadas no valor de M
        if (M == 0) begin
            // Operações Lógicas
            case (S)
                4'b0000: F = A & B;           // AND
                4'b0001: F = A | B;           // OR
                4'b0010: F = A ^ B;           // XOR
                4'b0011: F = ~(A & B);        // NAND
                4'b0100: F = ~(A | B);        // NOR
                4'b0101: F = ~(A ^ B);        // XNOR
                4'b0110: F = ~A;              // NOT A
                4'b0111: F = ~B;              // NOT B
                default: F = 4'b0000;         // Operação padrão
            endcase
        end else begin
            // Operações Aritméticas
            case (S)
                4'b0000: {carry_out, F} = A + B + carry_in;// Soma
                4'b0001: {carry_out, F} = A - B - carry_in;// Subtração
                4'b0010: {carry_out, F} = B - A - carry_in;// Subtração invertida
                4'b0011: {carry_out, F} = A + 1;// Incremento A
                4'b0100: {carry_out, F} = A - 1;// Decremento A
                4'b0101: {carry_out, F} = B + 1;// Incremento B
                4'b0110: {carry_out, F} = B - 1;// Decremento B
                default: F = 4'b0000; // Operação padrão
            endcase
        end
    end
endmodule
