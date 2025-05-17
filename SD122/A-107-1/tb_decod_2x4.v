`timescale 1ns / 100ps
module tb_decod_2x4 ();

reg A,B;
wire Y0,Y1,Y2,Y3;

decod_2x4 DUT(
    .A(A),
    .B(B), 
    .Y0(Y0) ,
    .Y1(Y1) ,
    .Y2(Y2) ,
    .Y3(Y3) 
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