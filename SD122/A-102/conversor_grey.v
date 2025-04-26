module conversor_GRAY(
    input H, G, F, E,
    output D, C, B, A
);
    assign D = H;
    assign C = (!H & G) | (!G & H);
    assign B = (!F & G) | (F & !G);
    assign A = (!F & E) | (F & !E);

endmodule