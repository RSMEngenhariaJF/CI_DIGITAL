`timescale 1ns / 100ps
module tb_ALU_4();
reg [3:0] A,B;
reg [2:0] sel;
wire [3:0] Y;
wire C,Z,N;

ALU_4 DUT(
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
    sel=3'b000;

    #10;
    A=4'd9;
    B=4'd7;
    sel=3'b000;//SOMA
    #10;

    #10;
    A=4'd9;
    B=4'd3;
    sel=3'b000;//SOMA

    #10;
    A=4'd0;
    B=4'd0;
    sel=3'b000;//SOMA
    
    #10;
    A=4'd0;
    B=4'd0;
    sel=3'b001;//SUB
    #10;

    A=4'd2;
    B=4'd5;
    sel=3'b001;//SUB
    #10;

    #10;
    A=4'd4;
    B=4'd1;
    sel=3'b001;//SUB
    #10;

    A=4'b0010;
    B=4'b0001;
    sel=3'b010; //AND
    #10;

    A=4'b1010;
    B=4'b1011;
    sel=3'b010; //AND
    #10;

    A=4'b1010;
    B=4'b1011;
    sel=3'b011; //OR
    #10;

    A=4'b0000;
    B=4'b0000;
    sel=3'b011; //OR
    #10;

    A=4'b0000;
    sel=3'b100; //NOT
    #10;

    A=4'b1111;
    sel=3'b100; //NOT
    #10;


    A=4'b1010;
    B=4'b1011;
    sel=3'b101; //NAND
    #10;


    A=4'd1;
    sel=3'b110;
    #10;
    B=4'd5;
    sel=3'b110;
    #10;
    A=4'b1000;
    B=4'd2;
    sel=3'b111;
    #10;
    B=4'd5;
    sel=3'b111;
    #10;
    $stop;
end 

endmodule