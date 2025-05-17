`timescale 1ns / 100ps
module tb_ALU_1_e_2();
reg [3:0] A,B;
reg [2:0] sel;
wire [3:0] Y;
/*
ALU_1 DUT(
    .A(A),
    .B(B),
    .sel(sel),
    .Y(Y)
);
*/
ALU_2 DUT(
    .A(A),
    .B(B),
    .sel(sel),
    .Y(Y)
);

initial begin
    A=4'd4;
    B=4'd3;
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
    sel=3'b110;
    #10;
    sel=3'b111;
    #10;

end 

endmodule