module conversor(H, G, F, E, D, C, B, A);
input H, G, F, E;
output D, C, B, A;

assign D = H & G;
assign C = (!H & G & E) | (H & !G);
assign B = (!H & G & !E) | (!G & F) | (H & !G);
assign A = (!H & !G & !F & E) | (!H & G & !E) | 
           (G & F) | (H & G & E) | (H & F);


endmodule
