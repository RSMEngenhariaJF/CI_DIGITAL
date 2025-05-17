 module meio_subtrator(
 input A, // Minuendo
 input B, // Subtraendo
 output D, // Diferença (A - B)
 output Borrow // Empréstimo
 );
    // Diferença é calculada como A XOR B
    assign D = A ^ B;
    // Empréstimo é calculado como NOT(A) AND B
    assign Borrow = ~A & B;
 endmodule

 module meio_subtrator_2(
 input A, // Minuendo
 input B, // Subtraendo
 output D, // Diferença (A - B)
 output Borrow // Empréstimo
 );
    // Declaração de fios internos
    wire not_A; // ~A
    wire A_xor_B; // A XOR B
    // Porta NOT
    not u1(not_A , A);
    // Porta XOR para diferença
    xor u2(D, A, B);
    // Porta AND para empréstimo
    and u3(Borrow , not_A , B);
 endmodule

 module meio_subtrator_3(
 input A, // Minuendo
 input B, // Subtraendo
 output reg D, // Diferença (A - B)
 output reg Borrow // Empréstimo
 );
    // Bloco always para descrever o comportamento do circuito
    always @(*) begin
        D = A ^ B; // Diferença: A XOR B
        Borrow = (~A) & B; // Empréstimo: NOT(A) AND B
    end
 endmodule
 
 module meio_subtrator_4(
 input A, // Minuendo
 input B, // Subtraendo
 output reg D, // Diferença (A - B)
 output reg Borrow // Empréstimo
 );
    // Bloco always para descrever o comportamento do circuito
    always @(*) begin
        D = A - B; // Diferença direta
        // Lógica para determinar o empréstimo (Borrow)
        if (A < B)
            Borrow = 1;
        else
            Borrow = 0;
    end
 endmodule