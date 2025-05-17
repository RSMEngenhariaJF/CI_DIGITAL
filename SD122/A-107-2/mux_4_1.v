module mux_4x1 (
    input A, B, D0,D1,D2,D3,
    output Y );

    assign Y = ({A,B} == 2'b00) ? D0 :
                ({A,B} == 2'b01) ? D1 :
                ({A,B} == 2'b10) ? D2 : D3;
                

endmodule

module funcao_1 (
    input A, B, D0,D1,D2,D3,
    output Y 
);

mux_4x1 multiplex(
        .A(A), 
        .B(B), 
        .D0(D0),
        .D1(D1),
        .D2(D2),
        .D3(D3),
        .Y(Y) 
);

endmodule

module funcao_2 (
    input A, B,C, D0,D1,D2,D3,
    output Y 
);
wire S_mux;
mux_4x1 multiplex(
        .A(A), 
        .B(B), 
        .D0(D0),
        .D1(D1),
        .D2(D2),
        .D3(D3),
        .Y(S_mux) 
);

assign Y = S_mux & (~C);
endmodule
