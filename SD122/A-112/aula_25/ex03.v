module ula_12bits (
    input  [11:0] A,         //! Operando A (12 bits)
    input  [11:0] B,         //! Operando B (12 bits)
    input  carry_in,         //! Carry-in global
    input  [2:0] seletor,    //! Seletor de operação (3 bits)
    output [11:0] resultado, //! Resultado da operação (12 bits)
    output carry_out         //! Carry-out global
);
    // Sinais gerado (G) e propagado (P) de cada bloco de 4 bits
    wire g_lsb, p_lsb; //! Gerado e propagado do bloco LSB
    wire g_mid, p_mid; //! Gerado e propagado do intermediário
    wire g_msb, p_msb; //! Gerado e propagado do bloco MSB
    // Carries intermediários
    wire carry_intermediario1; //! Carry-out entre LSB e intermediário
    wire carry_intermediario2; //! Carry-out entre intermediário e MSB
    // Lógica de carry look-ahead
    assign carry_intermediario1 = g_lsb | (p_lsb & carry_in);
    assign carry_intermediario2 = g_mid | (p_mid & carry_intermediario1);
    assign carry_out = g_msb | (p_msb & carry_intermediario2);
    // Instância do bloco menos significativo (LSB)
    ula ula_lsb (
        .A(A[3:0]),
        .B(B[3:0]),
        .carry_in(carry_in),
        .seletor(seletor),
        .resultado(resultado[3:0]),
        .carry_out(), // Carry-out local não utilizado
        .gerado(g_lsb),
        .propagado(p_lsb)
    );
    // Instância do bloco intermediário
    ula ula_mid (
        .A(A[7:4]),
        .B(B[7:4]),
        .carry_in(carry_intermediario1),
        .seletor(seletor),
        .resultado(resultado[7:4]),
        .carry_out(), // Carry-out local não utilizado
        .gerado(g_mid),
        .propagado(p_mid)
    );
    // Instância do bloco mais significativo (MSB)
    ula ula_msb (
        .A(A[11:8]),
        .B(B[11:8]),
        .carry_in(carry_intermediario2),
        .seletor(seletor),
        .resultado(resultado[11:8]),
        .carry_out(), // Carry-out local não utilizado
        .gerado(g_msb),
        .propagado(p_msb)
    );
endmodule
