module mux2x1(
    input in1, in2, select,
    output out
);

    assign out = (~select) ? in1 : in2;
endmodule
