`timescale 1ns / 100ps
module tb_subtrator_2();
reg [3:0] A,B;
reg sub;
wire [3:0] D;
wire B_out;

somador_subtrator DUT(
        .A(A),
        .B(B),
        .sub(sub),
        .Result(D),
        .C_out(B_out)
 );


 initial begin
    A=4'd5;
    B=4'd2;
    sub= 1'b0;

    #10;
    A=4'd5;
    B=4'd2;
    sub= 1'b1;
    #10;

    #10;
    A=4'd3;
    B=4'd3;
    sub= 1'b0;
    #10;

    #10;
    A=4'd3;
    B=4'd3;
    sub= 1'b1;
    #10;

    #10;
    A=4'd2;
    B=4'd3;
    sub= 1'b0;
    #10;

    #10;
    A=4'd3;
    B=4'd2;
    sub= 1'b1;
    #10;

    #10;
    A=4'd2;
    B=4'd3;
    sub= 1'b1;
    #10;
    $stop;
 end

endmodule