`timescale 1ns / 100ps
module tb_subtrator_1();
reg [3:0] A,B;
reg B_in;
wire [3:0] D;
wire B_out;

subtrator #(4) DUT(
        .A(A),
        .B(B),
        .B_in(B_in),
        .D(D),
        .B_out(B_out)
 );


 initial begin
    A=4'd5;
    B=4'd3;
    B_in= 1'b0;

    #10;
    A=4'd5;
    B=4'd3;
    B_in= 1'b0;
    #10;

    #10;
    A=4'd5;
    B=4'd7;
    B_in= 1'b0;
    #10;

    #10;
    A=4'd3;
    B=4'd5;
    B_in= 1'b0;
    #10;

    #10;
    A=4'd2;
    B=4'd1;
    B_in= 1'b0;
    #10;

    #10;
    A=4'd3;
    B=4'd3;
    B_in= 1'b0;
    #10;
    $stop;
 end

endmodule