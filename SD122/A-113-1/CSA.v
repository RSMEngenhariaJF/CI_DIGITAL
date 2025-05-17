module CSA (
        input [3:0] A,B,C,
        output [3:0] Sum, Cout
);

assign Sum = A ^B ^ C;
assign Cout = (A & B)+(A & C) + (B & C);

endmodule



module somador_CSA (
    input [3:0] A,B,C,
    output [3:0] soma,
    output Carry
    );

    wire [3:0] sum,Cout;
    reg [4:0] soma_final,Cint;
    
    CSA somador_CSA(
        .A(A),
        .B(B),
        .C(C),
        .Sum(sum), 
        .Cout(Cout)
);

assign C_int = Cout<<1;
assign soma_final = sum + C_int;
assign {Carry,soma} = soma_final;


endmodule

module CSA_PARAM #(parameter N) (
        input [N-1:0] A,B,C,
        output [N-1:0] Sum, Cout
);

assign Sum = A ^B ^ C;
assign Cout = (A & B)+(A & C) + (B & C);

endmodule

module somador_CSA_PARAM #(parameter M=8) (
    input [M-1:0] A,B,C,
    output [M-1:0] soma,
    output Carry
    );

    wire [M-1:0] sum,Cout;
    reg [M:0] soma_final,Cint;
        CSA_PARAM #(.N(M)) somador_CSA(
            .A(A),
            .B(B),
            .C(C),
            .Sum(sum), 
            .Cout(Cout)
    );
   

assign C_int = Cout<<1;
assign soma_final = sum + C_int;
assign {Carry,soma} = soma_final;


endmodule