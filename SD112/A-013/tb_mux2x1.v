`timescale 1ns / 100ps
module tb_mux();
reg A,B,SEL;
wire S;

mux2x1 mymux(
    .saida(S),
    .in1(A), 
    .in2(B), 
    .sel(SEL)
);

initial begin
    A=1'b0;
    B=1'b0;
    SEL = 1'b0;

    #10 A=1'b0;
    B=1'b1;
    SEL = 1'b0;

    #10 A=1'b1;
    B=1'b0;
    SEL = 1'b0;
    
    #10 A=1'b1;
    B=1'b1;
    SEL = 1'b0;
    
    #10 A=1'b0;
    B=1'b0;
    SEL = 1'b1;
    
    
    #10 A=1'b0;
    B=1'b1;
    SEL = 1'b1;

    #10 A=1'b1;
    B=1'b0;
    SEL = 1'b1;
    
    #10 A=1'b1;
    B=1'b1;
    SEL = 1'b1;
    
    #10 A=1'b1;
    B=1'b1;
    SEL = 1'b1;

end

endmodule

