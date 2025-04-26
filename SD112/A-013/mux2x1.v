module mux2x1 (
    output saida,
    input in1, in2, sel
);
    wire n_sel, and1, and2;
    
    not g1(n_sel, sel);
    and g2(and1, n_sel, in1);
    and g3(and2, sel, in2);
    or g4(saida, and1, and2);

endmodule