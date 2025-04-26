`timescale 1ns / 100ps
module tb_mux_16x1();

reg [15:0] A;
reg [3:0] sel;
wire Y;


mux_16x1 DUT(
        .A(A),
        .sel(sel),
        .Y(Y)
);
integer i;
    initial begin
        A=0;
        sel = 4'b0000;
        
        for(i = 0; i <16; i=i+1) 
        begin
            #10 
            A=16'b1<<sel;
            #10 
            sel = sel+1'b1;
        end
        #10 
        A=16'b1<<16;
        #10
        $stop;

    end


endmodule