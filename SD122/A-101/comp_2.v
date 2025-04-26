module comp_2 (
    input [1:0] A,B,
    output y
);

assign y = (A == B) ? 1'b1 : 1'b0;

endmodule