module myand (
    output out,
    input a, b
);
    wire w_nand;

    // Fontes de alimentação
    supply1 vdd; // VDD = 1 lógico
    supply0 gnd; // GND = 0 lógico

    // Sinal intermediário para NAND
    wire nand_out;

    // --- Etapa 1: Implementa NAND com CMOS ---
    // Pull-up (PMOS em paralelo)
    pmos p1(nand_out, vdd, a);  // PMOS 1: dreno = nand_out, fonte = vdd, gate = a
    pmos p2(nand_out, vdd, b);  // PMOS 2: dreno = nand_out, fonte = vdd, gate = b

    // Pull-down (NMOS em série)
    wire nmos_mid;
    nmos n1(nmos_mid, gnd, a);       // NMOS 1: dreno = nmos_mid, fonte = gnd, gate = a
    nmos n2(nand_out, nmos_mid, b);  // NMOS 2: dreno = nand_out, fonte = nmos_mid, gate = b

    // --- Etapa 2: Inverter a saída do NAND para obter AND ---
    // Inversor CMOS
    wire inv_out;
    pmos p3(out, vdd, nand_out);
    nmos n3(out, gnd, nand_out);

endmodule