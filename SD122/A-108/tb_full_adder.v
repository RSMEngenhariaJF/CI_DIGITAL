`timescale 1ns / 100ps
module tb_full_adder();
reg [3:0] A,B;
reg Cin;
wire Cout;
wire [3:0] S;

somador_4bits somador(
    .A(A),
    .B(B),
    .Cin(Cin),
    .S(S),
    .Cout(Cout)
);


initial begin
    A=4'b0010;
    B=4'b0001;
    Cin = 1'b0;
    #10;

    A=4'b0010;
    B=4'b0110;
    Cin = 1'b0;
    #10;

    A=4'b0010;
    B=4'b0001;
    Cin = 1'b1;
    #10;


    A=4'b0000;
    B=4'b0000;
    Cin = 1'b0;
    #10;

    A=4'b1010;
    B=4'b1110;
    Cin = 1'b1;
    #10;
    $stop;
end
endmodule