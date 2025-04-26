`timescale 1ns / 100ps
module tb_circuito();

reg clk, rst;
wire saida;

circuito #(4) CI (
    .clk(clk),
    .rst(rst),
    .saida(saida)
);



initial begin
    clk=0;
    forever #10 clk = ~clk;
end

initial begin
    rst = 1'b0;

    #100 rst = 1'b1;
    #20 rst = 1'b0;

    
    #300 rst = 1'b1;
    #20 rst = 1'b0;

end

endmodule