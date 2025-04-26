module conversor_2(H, G, F, E, D, C, B, A);
input H, G, F, E;
output D, C, B, A;

    saida_A saida_A(
                .H(H), 
                .G(G), 
                .F(F), 
                .E(E),
                .A(A) 
    );
    saida_B saida_B(
        .H(H), 
        .G(G), 
        .F(F), 
        .E(E),
        .B(B) 
    );
    saida_C saida_C(
        .H(H), 
        .G(G), 
        .F(F), 
        .E(E),
        .C(C) 
    );
    saida_D saida_D(
        .H(H), 
        .G(G), 
        .F(F), 
        .E(E),
        .D(D) 
    );


/*
wire W1,W2,W3,W4,W5,W6,W7,W8,W9,W10,W11,W12,W13;

and I1(D,H,G);//D = H & G;

not I2(W1,H);//!H
not I3(W2,G);//!G
not I9(W8,E);//!E
not I14(W12,F)///!F

and I5(W4,W1,G,E);//(!H & G & E)
or I9(C,W4,W5);//C = (!H & G & E) | (H & !G);
and I5(W9,W1,G,W8);//(!H & G & !E)

and I6(W6,W2,F);//(!G & F)
and I7(W5,H,W2);//(H & !G)
or I8(B,W9,W6,W7);//B = (!H & G & !E) | (!G & F) | (H & !G);

and I6(W3,H,G,E)//(H & G & E)
and I10(W10,G,F);//(G & F)
and I11(W11,H,F);//(H & F)
and I13(W12,W1,W2,W12,E)//(!H & !G & !F & E)

or I12(A,W12,W9,W10,W3,W11)//A = (!H & !G & !F & E) | (!H & G & !E) | (G & F) | (H & G & E) | (H & F);
*/


endmodule

module saida_A(
    input H, G, F, E,
    output A 
    );
    wire W1,W2,W3,W8,W9,W10,W11,W12,W4;
    
    not I2(W1,H);//!H
    not I3(W2,G);//!G
    not I9(W8,E);//!E
    not I14(W4,F);//!F

    and I5(W9,W1,G,W8);//(!H & G & !E)

    and I6(W3,H,G,E);//(H & G & E)
    and I10(W10,G,F);//(G & F)
    and I11(W11,H,F);//(H & F)
    and I13(W12,W1,W2,W4,E);//(!H & !G & !F & E)

    or I12(A,W12,W9,W10,W3,W11);//A = (!H & !G & !F & E) | (!H & G & !E) | (G & F) | (H & G & E) | (H & F);

    
endmodule

module saida_B(
    input H, G, F, E,
    output B 
    );

    wire W1,W2,W6,W7,W8,W9;

    not I2(W1,H);//!H
    not I3(W2,G);//!G
    not I9(W8,E);//!E
    
    and I5(W9,W1,G,W8);//(!H & G & !E)

    and I6(W6,W2,F);//(!G & F)
    and I7(W7,H,W2);//(H & !G)
    or I8(B,W9,W6,W7);//B = (!H & G & !E) | (!G & F) | (H & !G);

endmodule

module saida_C(
    input H, G, F, E,
    output C 
    );

    wire W1,W2,W4,W5;

    not I2(W1,H);//!H
    not I3(W2,G);//!G
    and I5(W4,W1,G,E);//(!H & G & E)
    and I7(W5,H,W2);//(H & !G)
    or I9(C,W4,W5);//C = (!H & G & E) | (H & !G);

endmodule

module saida_D(
    input H, G, F, E,
    output D 
    );

    and I1(D,H,G);//D = H & G;
   

   

endmodule
