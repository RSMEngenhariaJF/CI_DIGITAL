`timescale 1ns / 100ps
module tb_somador_BCD_3DIG();
 
reg [7:0] A,B;
reg Cin;
wire [11:0] S;
wire C;

somador_BCD_3DIG DUT(
        .A(A),
        .B(B),
        .C_in(Cin),
        .S(S),
        .C_out(C)
); 
initial begin
    $monitor("Tempo=%0t: A=%d B=%d Cin=%b -> S=%b  C=%b", $time, A, B, Cin, S, C);
    A = 8'd110; 
    B = 8'd10; 
    Cin = 0;
    #10; 
    A = 8'd66; 
    B = 8'd45;  
    Cin = 0;
    #10; 
    A = 8'd30; 
    B = 8'd36;  
    Cin = 1;
    #10; 
    A = 8'd94; 
    B = 8'd55;  
    Cin = 0;
    #10; 
    A = 8'd88; 
    B = 8'd20;  
    Cin = 0;
    #10; 
    A = 8'd91; 
    B = 8'd9;  
    Cin = 0;
    #10;
    $stop;
end
endmodule