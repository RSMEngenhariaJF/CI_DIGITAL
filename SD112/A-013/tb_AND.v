`timescale 1ns / 100ps
module tb_AND();
reg A,B;
wire S;

myand AND1(
    .out(S),
    .a(A), 
    .b(B)
    
);

initial begin
    A=1'b0;
    B=1'b0;

    #10 A=1'b0;
    B=1'b1;

    #10 A=1'b1;
    B=1'b0;
    
    #10 A=1'b1;
    B=1'b1;
    
    #10 A=1'b0;
    B=1'b1;
    
end

endmodule