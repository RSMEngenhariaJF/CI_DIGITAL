module conversor_E3(
    input H, G, F, E,
    output D, C, B, A
);
    assign D = H | (G & E) | (G & F);
    assign C = (!G & E) | (G & !F & !E) | (!G & F);
    assign B = (!F & !E) | (F & E);
    assign A = (!F & !E) | (F & !E);

endmodule
