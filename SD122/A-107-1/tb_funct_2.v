`timescale 1ns / 100ps
module tb_funct_2 ();

reg A,B,C;
wire F_2;



funcao_2 DUT_3(
    .A(A),
    .B(B),
    .C(C),
    .F(F_2)
);

initial begin
    A=1'b0;
    B=1'b0;
    C=1'b0;
    #10
    
    A=1'b0;
    B=1'b0;
    C=1'b1;
    #10
    
    A=1'b0;
    B=1'b1;
    C=1'b0;
    #10
    
    A=1'b0;
    B=1'b1;
    C=1'b1;
    #10
    
    A=1'b1;
    B=1'b0;
    C=1'b0;
    #10
    
    A=1'b1;
    B=1'b0;
    C=1'b1;
    #10
    
    A=1'b1;
    B=1'b1;
    C=1'b0;
    #10
    
    A=1'b1;
    B=1'b1;
    C=1'b1;
    #10
    

    $stop;
end


endmodule