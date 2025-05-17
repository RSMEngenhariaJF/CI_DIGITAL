`timescale 1ns / 100ps
module tb_ALU_3();
reg [3:0] A,B;
reg [2:0] sel;
wire [3:0] Y;

ALU_3 DUT(
    .A(A),
    .B(B),
    .sel(sel),
    .Y(Y)
);

initial begin
    A=4'd4;
    B=4'd2;
    sel=3'b000;

    #10;
    sel=3'b000;
    #10;
    sel=3'b001;
    #10;
    sel=3'b010;
    #10;
    sel=3'b011;
    #10;
    sel=3'b100;
    #10;
    sel=3'b101;
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