
 module subtrator_completo_rtl1(
 input A, B, BorrowIn ,
 output D, BorrowOut
 );
    
    assign D = A ^ B ^ BorrowIn; // XOR para a diferença
    assign BorrowOut = (~A & B) | (~(A ^ B) & BorrowIn);
 endmodule

module subtrator_completo (
input A, B, BorrowIn ,
output D, BorrowOut
);
    // Sinais intermediários
    wire D1, Borrow1 , Borrow2;
    // Instância do primeiro meio subtrator
    meio_subtrator ms1 (
    .A(A),
    .B(B),
    .D(D1),
    .BorrowOut(Borrow1)
    );
    // Instância do segundo meio subtrator
    meio_subtrator ms2 (
    .A(D1),
    .B(BorrowIn),
    .D(D),
    .BorrowOut(Borrow2)
    );
    // Porta lógica OR para calcular o Borrow Out final
    assign BorrowOut = Borrow1 | Borrow2;
 endmodule

 module meio_subtrator (
 input A, B,
 output D, BorrowOut
 );
    assign D = A ^ B; // Diferença (XOR)
    assign BorrowOut = ~A & B; // Borrow (AND com NOT)
 endmodule


module subtrator_completo_comportamental2(
input A, B, BorrowIn ,
output reg D, BorrowOut
);
    always @(*) begin
        // Diferença calculada diretamente
        {BorrowOut , D} = A - B - BorrowIn;
    end
endmodule