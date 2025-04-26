`timescale 1ns / 100ps
module tb_mapeia();
reg [2:0] dado;
wire [7:0] saida;

mapeia ativa();

initial begin
    dado = 3'b000;
    ativa_saida(dado,saida);
    #10 dado = 3'b001;
    ativa_saida(dado,saida);
    #10 dado = 3'b010;
    ativa_saida(dado,saida);
end

endmodule