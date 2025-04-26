module mux ( 
        input [1:0] D,
        input sel,
        output y
);

assign y = (!sel & D[1]) | (sel & D[0]);

endmodule