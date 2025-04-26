`timescale 1ns / 100ps

module tb_codificador();



wire [7:0] saida;
reg clk;

mycnt cnt_7seg(
        .saida(saida),
        .clk(clk)
);

initial begin
    
    $monitor (saida);
    clk <= 0;
    
end

always #5 clk = ~clk;



endmodule
