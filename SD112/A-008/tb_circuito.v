`timescale 1ns / 100ps

module tb_circuito();

reg A, rst;
wire saida;
circuito ut(
            .saida(saida),
            .clk_A(A), 
            .nrst_in(rst)
);

always #5 A = ~A; 

initial begin
A = 1'b0; 
rst = 1'b0;

#5 rst = 1'b1;

#20 rst = 1'b0;

#20 rst = 1'b1;

#35 rst = 1'b0;

#5 rst = 1'b1;
#35 rst = 1'b1;
end

endmodule
