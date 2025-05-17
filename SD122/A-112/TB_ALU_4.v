`timescale 1ns / 100ps
module tb_ALU_5();
reg [3:0] A,B;
reg [3:0] sel;
wire [3:0] Y;
wire C,Z,N;

ALU_5 DUT(
    .A(A),
    .B(B),
    .sel(sel),
    .C_out(C),
    .Z_out(Z),
    .N_out(N),
    .Y(Y)
);

initial begin
    A=4'd4;
    B=4'd2;
    sel=4'b0000;

    #10;
    A=4'd9;
    B=4'd7;
    sel=4'b0000;//SOMA
    #10;

    #10;
    A=4'd9;
    B=4'd3;
    sel=4'b0000;//SOMA

    #10;
    A=4'd0;
    B=4'd0;
    sel=4'b0000;//SOMA
    
    #10;
    A=4'd0;
    B=4'd0;
    sel=4'b0001;//SUB
    #10;

    A=4'd2;
    B=4'd5;
    sel=4'b0001;//SUB
    #10;

    #10;
    A=4'd4;
    B=4'd1;
    sel=4'b0001;//SUB
    #10;

    A=4'b0010;
    B=4'b0001;
    sel=4'b0010; //AND
    #10;

    A=4'b1010;
    B=4'b1011;
    sel=4'b0010; //AND
    #10;

    A=4'b1010;
    B=4'b1011;
    sel=4'b0011; //OR
    #10;

    A=4'b0000;
    B=4'b0000;
    sel=4'b0011; //OR
    #10;

    A=4'b0000;
    sel=4'b0100; //NOT
    #10;

    A=4'b1111;
    sel=4'b0100; //NOT
    #10;


    A=4'b1010;
    B=4'b1011;
    sel=4'b0101; //NAND
    #10;


    A=4'd1;
    sel=4'b0110; //<<
    #10;
    B=4'd5;
    sel=4'b0110; //<<
    #10;
    A=4'b1000;
    B=4'd2;
    sel=4'b0111;//>>
    #10;
    B=4'd5;
    sel=4'b0111;//>>
    #10;

    #10;
    A=4'b1000;
    B=4'b1000;
    sel=4'b1000;//XOR
    #10;
    B=4'b0100;
    sel=4'b1000;//XOR
    #10;

    #10;
    A=4'b1000;
    B=4'b1000;
    sel=4'b1001;//XNOR
    #10;
    B=4'b0111;
    sel=4'b1001;//XNOR
    #10;
    $stop;
end 

endmodule