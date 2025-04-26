module cod_BCD (
                output reg [7:0] saida_7seg,
                input [3:0] entrada_BCD,
                input DP
);

always @ *
    case (entrada_BCD)
        4'b0000 : saida_7seg[6:0] = 7'b1111110;//0
        4'b0001 : saida_7seg[6:0] = 7'b1100000;//1
        4'b0010 : saida_7seg[6:0] = 7'b1101101;//2
        4'b0011 : saida_7seg[6:0] = 7'b1111001;//3
        4'b0100 : saida_7seg[6:0] = 7'b0110011;//4
        4'b0101 : saida_7seg[6:0] = 7'b1011011;//5
        4'b0110 : saida_7seg[6:0] = 7'b1011111;//6
        4'b0111 : saida_7seg[6:0] = 7'b1110000;//7
        4'b1000 : saida_7seg[6:0] = 7'b1111111;//8
        4'b1001 : saida_7seg[6:0] = 7'b1111011;//9
        4'b1010 : saida_7seg[6:0] = 7'b1110111;//a
        4'b1011 : saida_7seg[6:0] = 7'b0011111;//b
        4'b1100 : saida_7seg[6:0] = 7'b1001110;//c
        4'b1101 : saida_7seg[6:0] = 7'b0111101;//d
        4'b1110 : saida_7seg[6:0] = 7'b1001111;//e
        4'b1111 : saida_7seg[6:0] = 7'b1000111;//f
        default: saida_7seg[6:0] =  7'b0000000;
    endcase

assign saida_7seg[7] = DP;


endmodule
