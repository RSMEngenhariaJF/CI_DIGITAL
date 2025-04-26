module tb_contador();

reg clk;
wire [23:0] saida;
wire FIM;

contador cnt(
        .clk(clk),
        .contagem(saida),
        .FIM(FIM)
);

initial begin
   clk = 1'b0;

   forever begin
        #10 clk = ~clk;
   end

end

endmodule