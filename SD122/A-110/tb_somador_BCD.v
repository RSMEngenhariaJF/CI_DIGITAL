`timescale 1ns / 100ps
module tb_somador_BCD();
 
reg [3:0] A,B;
reg Cin;
wire [7:0] S;
wire C;

somador_BCD_1 DUT(
    .A(A),
    .B(B),
    .C_in(Cin),
    .saida(S),
    .carry(C)
);  
initial begin
    $monitor("Tempo=%0t: A=%d B=%d Cin=%b -> S=%b  C=%b", $time, A, B, Cin, S, C);
    A = 0; 
    B = 0; 
    Cin = 0;
    #10; 
    A = 6; 
    B = 9;  
    Cin = 0;
    #10; 
    A = 3; 
    B = 3;  
    Cin = 1;
    #10; 
    A = 4; 
    B = 5;  
    Cin = 0;
    #10; 
    A = 8; 
    B = 2;  
    Cin = 0;
    #10; 
    A = 9; 
    B = 9;  
    Cin = 0;
    #10;
    $stop;
end
endmodule