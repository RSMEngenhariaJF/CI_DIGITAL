`timescale 1ns / 100ps
module TB_SOMADOR_CSA();
reg [3:0] A,B,C;
wire [3:0] soma;
wire Carry;
/*somador_CSA DUT(
    .A(A),
    .B(B),
    .C(C),
    .soma(soma),
    .Carry(Carry)
    );
*/
somador_CSA_PARAM #(4) DUT(
    .A(A),
    .B(B),
    .C(C),
    .soma(soma),
    .Carry(Carry)
    );

initial begin
    A=4'b1011;
    B=4'b1101;
    C=4'b0110;
    #10;

    A=4'b1111;
    B=4'b1111;
    C=4'b0111;
    #10;
    
   $stop; 
end
endmodule