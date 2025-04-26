module cod_dec_E3(
    input [9:0] entrada,
    output [3:0] S
);
reg [3:0] saida;

always @ (*) begin

    case (entrada)
        10'b0000000001 : saida = 4'b0011;
        10'b0000000010 : saida = 4'b0100;
        10'b0000000100 : saida = 4'b0101;
        10'b0000001000 : saida = 4'b0110;
        10'b0000010000 : saida = 4'b0111;
        10'b0000100000 : saida = 4'b1000;
        10'b0001000000 : saida = 4'b1001;
        10'b0010000000 : saida = 4'b1010;
        10'b0100000000 : saida = 4'b1011;
        10'b1000000000 : saida = 4'b1100;
        default: saida = 4'b0000;

    endcase
end 
assign S = saida;
endmodule 