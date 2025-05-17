module mux4x1_4bits (
    input  [3:0] in0,    // Entrada 0 (4 bits)
    input  [3:0] in1,    // Entrada 1 (4 bits)
    input  [3:0] in2,    // Entrada 2 (4 bits)
    input  [3:0] in3,    // Entrada 3 (4 bits)
    input  [1:0] sel,    // Sinal de seleção (2 bits)
    output reg [3:0] out // Saída do multiplexador (4 bits)
);
    always @(*) begin
        case (sel)
            2'b00: out = in0; // Seleciona entrada 0
            2'b01: out = in1; // Seleciona entrada 1
            2'b10: out = in2; // Seleciona entrada 2
            2'b11: out = in3; // Seleciona entrada 3
            default: out = 4'b0000; // Valor padrão
        endcase
    end
endmodule
