module circuito(
    input A,B,C,D,
    output S
);

wire S1,S2,S3,S4;

assign S1 = ((~A) & B);
assign S2 = ((~D) | C);
assign S3 = ~((~B) | D);
assign S4 = ~(S1 | S2);
assign S = ~(S4 & S3);

endmodule