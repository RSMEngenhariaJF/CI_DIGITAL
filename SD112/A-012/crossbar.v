module crossbar_strutural(
        input in1,in2, select,
        output out1, out2
);

mux2x1 mux1(
        .in1(in1), 
        .in2(in2), 
        .select(select),
        .out(out1)
);


mux2x1 mux2(
        .in1(in2), 
        .in2(in1),
        .select(select),
        .out(out2)
);
endmodule