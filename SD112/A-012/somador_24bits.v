module full_adder(
        input [11:0] a, b, 
        input cin,
        output [11:0] sum, 
        output carry_out
        
);
assign sum = (a + b) ^ cin;
assign carry_out = (a & b)+(cin & (a ^ b));
endmodule

module somador_1(
    input [23:0] A, B,
    input Cin,
    output [23:0] saida,
    output Cout
);


wire C1;
wire S2;

full_adder sum_1(A[23:12],B[23:12],C1,saida[23:12],S2);
full_adder sum_2(A[11:0],B[11:0],Cin,saida[11:0],C1);

assign Cout = S2;
endmodule

module contador(
        input clk,
        output [23:0] contagem,
        output FIM
);
reg [23:0] DFF;
wire [23:0] SOMA;
initial begin
    DFF <= 24'd0;
end

somador_1 SM(DFF, 24'b1,1'b1,SOMA,FIM);


always @ (posedge clk) begin
    DFF <= SOMA;
end
assign contagem = SOMA;

endmodule
