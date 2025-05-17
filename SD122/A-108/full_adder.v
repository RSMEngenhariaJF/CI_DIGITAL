module full_adder(
    input A, B,Cin,
    output S,Cout
);
assign S = A ^ B ^ Cin;
assign Cout  = (A & B) | (Cin & (A ^ B));

endmodule

module somador_4bits (
    input [3:0] A,B,
    input Cin,
    output [3:0] S,
    output Cout
);


wire C1,C2,C3;

full_adder S0(
    .A(A[0]), 
    .B(B[0]),
    .Cin(Cin),
    .S(S[0]),
    .Cout(C1)
);

full_adder S1(
    .A(A[1]), 
    .B(B[1]),
    .Cin(C1),
    .S(S[1]),
    .Cout(C2)
);

full_adder S2(
    .A(A[2]), 
    .B(B[2]),
    .Cin(C2),
    .S(S[2]),
    .Cout(C3)
);

full_adder S3(
    .A(A[3]), 
    .B(B[3]),
    .Cin(C3),
    .S(S[3]),
    .Cout(Cout)
);



endmodule