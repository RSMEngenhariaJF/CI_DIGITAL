module inv#(parameter width=1)(
output [width-1:0] b,
input [width-1:0] a
);

assign b = ~a;

endmodule
