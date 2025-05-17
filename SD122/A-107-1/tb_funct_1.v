`timescale 1ns / 100ps
module tb_funct_1 ();

reg A,B;
wire F_1;

funcao_1 DUT(
    .A(A),
    .B(B),
    .F(F_1)
);



initial begin
    A=1'b0;
    B=1'b0;
    #10
    A=1'b0;
    B=1'b1;
    #10
    A=1'b1;
    B=1'b0;
    #10
    A=1'b1;
    B=1'b1;
    #10
    $stop;
end


endmodule