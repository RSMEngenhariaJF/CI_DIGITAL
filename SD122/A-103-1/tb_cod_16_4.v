`timescale 1ns / 100ps
module tb_cod_16_2();

reg [15:0] entrada;
wire [3:0] saida;

/*
cod_16_4 DUT(
    .entrada(entrada),
    .S(saida)
);
*/

cod_16_4_2 DUT_2(
    .A(entrada),
    .Y(saida)
);


initial begin

    entrada=16'b10000000_00000000;
    #10 entrada = 16'b01000000_00000100;
    #10 entrada = 16'b00100000_00000000;
    #10 entrada = 16'b00010000_01000000;
    #10 entrada = 16'b00001001_00000000;
    #10 entrada = 16'b00000100_00100000;
    #10 entrada = 16'b00000010_01000000;
    #10 entrada = 16'b00000001_00010000;
    #10 entrada = 16'b00000000_10000000;
    #10 entrada = 16'b00000000_01010000;
    #10 entrada = 16'b00000000_00100000;
    #10 entrada = 16'b00000000_00011000;
    #10 entrada = 16'b00000000_00001000;
    #10 entrada = 16'b00000000_00000110;
    #10 entrada = 16'b00000000_00000011;
    #10 entrada = 16'b00000000_00000001;
    #10 entrada = 16'b00000000_00000001;
    $stop;

end

endmodule