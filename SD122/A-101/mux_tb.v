`timescale 1ns / 100ps

module mux_tb();
reg [1:0] D,E; 
reg sel;
wire y,y1,y2,y3,S_comp,S_comp2;

//inclua aqui a declaracao da instancia do dispositivo sob teste
mux mymux( 
        .D(D),
        .sel(sel),
        .y(y)
);
mux2 mymux2( 
        .D(D),
        .sel(sel),
        .y(y1)
);
mux3 mymux3( 
        .D(D),
        .sel(sel),
        .y(y2)
);
mux4 mymux4( 
        .D(D),
        .sel(sel),
        .y(y3)
);

comp_RTL mycomp(
    .A(D),
	.B(E),
    .y(S_comp)
);

comp_2 mycomp2(
	.A(D),
	.B(E),
    .y(S_comp2)
);

//

always begin #1 D[0] = !D[0]; end
always begin #2 D[1] = !D[1]; end
always begin #2 E[0] = !E[0]; end
always begin #3 E[1] = !E[1]; end
always begin #4 sel = !sel; end

initial begin
	sel = 1'b0;
	E = 2'b01;
	D = 2'd0;
	#15 $stop;
end

endmodule