module mux2(
    input [1:0] D,
    input sel, 
    output y 
);

assign y = !sel ? D[1] : D[0];

endmodule