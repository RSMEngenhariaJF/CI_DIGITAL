module mux_2x1(
    input A,B,sel,
    output Y
);
assign Y = (sel == 1'b0) ? A : B ;
endmodule

module mux_4x1(
        input [3:0]A,
        input [1:0] sel,
        output Y
);

assign Y =  (sel == 2'b00) ? A[0] :
            (sel == 2'b01) ? A[1] :
            (sel == 2'b10) ? A[2] : A[3];
endmodule

module mux_8x1_2 (
        input [7:0] entrada,
        input [2:0] sel,
        output Z
);
wire S1,S2;

mux_4x1 mux4_1(
        .A(entrada[3:0]),
        .sel(sel[1:0]),
        .Y(S1)
);

mux_4x1 mux4_2(
        .A(entrada[7:4]),
        .sel(sel[1:0]),
        .Y(S2)
);

mux_2x1 mux2(
    .A(S1),
    .B(S2),
    .sel(sel[2]),
    .Y(Z)
);

endmodule