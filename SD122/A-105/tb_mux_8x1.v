`timescale 1ns / 100ps
module tb_mux_8x1();

reg [7:0] A;
reg [2:0] sel;
wire Y;

mux_8x1_2 DUT(
        .entrada(A),
        .sel(sel),
        .Z(Y)
);
integer i;
    initial begin
        A=0;
        sel = 4'b000;
        
        for(i = 0; i <8; i=i+1) 
        begin
            #10 
            A=16'b1<<sel;
            #10 
            sel = sel+1'b1;
        end
        #10 
        A=16'b1<<8;
        #10
        $stop;

    end


endmodule