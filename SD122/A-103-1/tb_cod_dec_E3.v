`timescale 1ns / 100ps
module tb_cod_dec_E3();

reg [10:0] entrada;
wire [3:0] saida;
cod_dec_E3 DUT(
    .entrada(entrada),
    .S(saida)
);

initial begin

    entrada=10'b0000000000;
    #10 entrada = 10'b0000000001;
    #10 entrada = 10'b0000000010;
    #10 entrada = 10'b0000000100;
    #10 entrada = 10'b0000001000;
    #10 entrada = 10'b0000010000;
    #10 entrada = 10'b0000100000;
    #10 entrada = 10'b0001000000;
    #10 entrada = 10'b0010000000;
    #10 entrada = 10'b0100000000;
    #10 entrada = 10'b1000000000;
    #10 entrada = 10'b1000000000;
    #10
    $stop;

end

endmodule