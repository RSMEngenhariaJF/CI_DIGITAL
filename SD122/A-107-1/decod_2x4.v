module decod_2x4 (
    input A,B,
    output Y0,Y1,Y2,Y3
);

assign Y0 = (~A) & (~B);
assign Y1 = (~A) & (B);
assign Y2 = (A) & (~B);
assign Y3 = (A) & (B);
endmodule

module funcao_1 (
    input A,B,
    output F
);
wire Y0,Y1,Y2,Y3;
decod_2x4 decod(
    .A(A),
    .B(B),
    .Y0(Y0),
    .Y1(Y1),
    .Y2(Y2),
    .Y3(Y3)
);

assign F = Y0 + Y2;

endmodule

module funcao_2 (
    input A,B,C,
    output F
);
wire Y0,Y1,Y2,Y3;
decod_2x4 decod(
    .A(A),
    .B(B),
    .Y0(Y0),
    .Y1(Y1),
    .Y2(Y2),
    .Y3(Y3)
);

assign F = (Y2 & (~C)) + (Y1 & (~C));

endmodule