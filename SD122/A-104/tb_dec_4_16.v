`timescale 1ns / 100ps
module tb_dec_4_16();
reg [3:0] entrada;
wire [15:0] saida;
/*
dec_4_16 DUT(
    .A(entrada),
    .S(saida)
);*/

dec_N_M #(4,16) DUT(
    .A(entrada),
    .Y(saida)
);

initial begin
    entrada = 4'b0000;

    #10  entrada = 4'b0001;
    #10  entrada = 4'b0010;
    #10  entrada = 4'b0011;
    #10  entrada = 4'b0100;
    #10  entrada = 4'b0101;
    #10  entrada = 4'b0110;
    #10  entrada = 4'b0111;
    #10  entrada = 4'b1000;
    #10  entrada = 4'b1001;
    #10  entrada = 4'b1010;
    #10  entrada = 4'b1011;
    #10  entrada = 4'b1100;
    #10  entrada = 4'b1101;
    #10  entrada = 4'b1110;
    #10  entrada = 4'b1111;
    #10  entrada = 4'b1111;

    $stop;
end 

endmodule