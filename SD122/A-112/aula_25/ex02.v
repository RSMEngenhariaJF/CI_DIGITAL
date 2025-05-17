module ula_bits (
    input  [7:0] A,             //! Operando A (8 bits)
    input  [7:0] B,             //! Operando B (8 bits)
    input  carry_in,            //! Carry-in global
    input  [2:0] seletor,       //! Seletor de operação (3 bits)
    output [7:0] resultado,     //! Resultado da operação (8 bits)
    output carry_out            //! Carry-out global
);
    wire carry_intermediario;   //! Carry-out do primeiro módulo (4 bits)
    wire g_msb, p_msb;          //! Gerado e propagado do módulo mais significativo
    wire g_lsb, p_lsb;          //! Gerado e propagado do módulo menos significativo
    // Instância do módulo menos significativo (LSB)
    ula ula_lsb (
        .A(A[3:0]),
        .B(B[3:0]),
        .carry_in(carry_in),
        .seletor(seletor),
        .resultado(resultado[3:0]),
        .carry_out(carry_intermediario),
        .gerado(g_lsb),
        .propagado(p_lsb)
    );
    // Instância do módulo mais significativo (MSB)
    ula ula_msb (
        .A(A[7:4]),
        .B(B[7:4]),
        .carry_in(g_lsb | (p_lsb & carry_in)), //! Carry-in baseado em lógica gerado/propagado do LSB
        .seletor(seletor),
        .resultado(resultado[7:4]),
        .carry_out(carry_out),
        .gerado(g_msb),
        .propagado(p_msb)
    );
endmodule
