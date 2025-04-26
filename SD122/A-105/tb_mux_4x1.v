`timescale 1ns / 100ps
module tb_mux_4x1();

reg [2:0] A,B,C,D;
reg [1:0] sel;
wire [2:0]Y;

mux_Nx1 #(3) DUT(
                 .D0(A),
                 .D1(B),
                 .D2(C),
                 .D3(D),
                 .sel(sel),
                 .Y(Y)
                 );

    initial begin
        A=3'b001;
        B=3'b010;
        C=3'b101;
        D=3'b110;
        sel = 2'b00;
        
        #10
        sel=2'b01;
        #10
        sel=2'b10;
        #10
        sel=2'b11;
        #10  
        $stop;

    end


endmodule