`timescale 1ns / 100ps
module tb_DFF();
reg clk,rst,D;
wire q;

d_ff myDFF(q,clk,rst,D);

initial begin
    clk=1'b0;
    forever #5 clk = ~clk;
end

initial begin
    D=1'b0;
    rst=1'b0;

    #10 D=1'b1;
    rst=1'b0;

    #10 D=1'b1;
    rst=1'b1;

    #30 D=1'b1;
    rst=1'b0;

    #20 D=1'b0;
    rst=1'b0;
   
    
end

endmodule