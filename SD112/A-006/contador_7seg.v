module mycnt(
        output [7:0] saida,
        input clk
);
wire ponto;
wire [3:0] entrada;


cod_BCD cod_BCD (
    .saida_7seg(saida),
    .entrada_BCD(entrada),
    .DP(ponto) 
);

contador cnt(
        .sinal(entrada),
        .DP(ponto),
        .clk(clk) 
    );

endmodule