module BlackCell(
    output  Go, 
    output  Po,
    input   G_idx, 
    input   P_idx, 
    input   G_fb, 
    input   P_fb
);
    wire s1;
    assign s1 = P_idx & G_fb;
    assign Go = s1 | G_idx;         // output Go
    assign Po = P_idx & P_fb;       // output Po
endmodule

module GrayCell(
    output  Go,
    input   G_idx,
    input   P_idx, 
    input   G_fb
);
    wire s1;
    assign s1 = P_idx & G_fb;
    assign Go = s1 | G_idx;         // output Go
endmodule

module brent_kung_adder (
    input [15:0]     A,
    input [15:0]     B,
    input            Cin,
    output [15:0]    Sum,
    output           Cout 
);

/* level 0 */
    // initialize Generate and Propagate signals
    wire [15:0] G, P;
    assign P = A ^ B;                               // P = A ^ B for all indexes
    assign G[0] = (A[0] & B[0]) | (P[0] & Cin);     // G = (A&B) | (A^B & Cin) when bit index is 0
    assign G[15:1] = A[15:1] & B[15:1];             // G = A & B when bit index is greater than 0


    /* level 1 */
    wire [15:0] level1out_P, level1out_G;
    GrayCell            gray_lvl1_bit1(level1out_G[1], G[1], P[1], G[0]);
    BlackCell           black_lvl1_bit3(level1out_G[3], level1out_P[3], G[3], P[3], G[2], P[2]);
    BlackCell           black_lvl1_bit5(level1out_G[5], level1out_P[5], G[5], P[5], G[4], P[4]);
    BlackCell           black_lvl1_bit7(level1out_G[7], level1out_P[7], G[7], P[7], G[6], P[6]);
    BlackCell           black_lvl1_bit9(level1out_G[9], level1out_P[9], G[9], P[9], G[8], P[8]);
    BlackCell           black_lvl1_bit11(level1out_G[11], level1out_P[11], G[11], P[11], G[10], P[10]);
    BlackCell           black_lvl1_bit13(level1out_G[13], level1out_P[13], G[13], P[13], G[12], P[12]);
    BlackCell           black_lvl1_bit15(level1out_G[15], level1out_P[15], G[15], P[15], G[14], P[14]);
    
    /* level 2 */
    wire [15:0] level2out_P, level2out_G;
    GrayCell            gray_lvl2_bit3(level2out_G[3], level1out_G[3], level1out_P[3], level1out_G[1]);
    BlackCell           black_lvl2_bit7(level2out_G[7], level2out_P[7], level1out_G[7], level1out_P[7], level1out_G[5], level1out_P[5]);
    BlackCell           black_lvl2_bit11(level2out_G[11], level2out_P[11], level1out_G[11], level1out_P[11], level1out_G[9], level1out_P[9]);
    BlackCell           black_lvl2_bit15(level2out_G[15], level2out_P[15], level1out_G[15], level1out_P[15], level1out_G[13], level1out_P[13]);

    /* level 3 */
    wire [15:0] level3out_P, level3out_G;
    GrayCell            gray_lvl3_bit7(level3out_G[7], level2out_G[7], level2out_P[7], level2out_G[3]);
    BlackCell           black_lvl3_bit15(level3out_G[15], level3out_P[15], level2out_G[15], level2out_P[15], level2out_G[11], level2out_P[11]);

    /* level 4 */
    wire [15:0] level4out_P, level4out_G;
    GrayCell            gray_lvl4_bit15(level4out_G[15], level3out_G[15], level3out_P[15], level3out_G[7]);

    /* level 5 */
    wire [15:0] level5out_P, level5out_G;
    GrayCell            gray_lvl5_bit11(level5out_G[11], level2out_G[11], level2out_P[11], level3out_G[7]);

    /* level 6 */
    wire [15:0] level6out_P, level6out_G;
    GrayCell            gray_lvl6_bit5(level6out_G[5], level1out_G[5], level1out_P[5], level2out_G[3]);
    GrayCell            gray_lvl6_bit9(level6out_G[9], level1out_G[9], level1out_P[9], level3out_G[7]);
    GrayCell            gray_lvl6_bit13(level6out_G[13], level1out_G[13], level1out_P[13], level5out_G[11]);

    /* level 7 */
    wire [15:0] level7out_P, level7out_G;
    GrayCell            gray_lvl7_bit2(level7out_G[2], G[2], P[2], level1out_G[1]);
    GrayCell            gray_lvl7_bit4(level7out_G[4], G[4], P[4], level2out_G[3]);
    GrayCell            gray_lvl7_bit6(level7out_G[6], G[6], P[6], level6out_G[5]);
    GrayCell            gray_lvl7_bit8(level7out_G[8], G[8], P[8], level3out_G[7]);
    GrayCell            gray_lvl7_bit10(level7out_G[10], G[10], P[10], level6out_G[9]);
    GrayCell            gray_lvl7_bit12(level7out_G[12], G[12], P[12], level5out_G[11]);
    GrayCell            gray_lvl7_bit14(level7out_G[14], G[14], P[14], level6out_G[13]);

    /* Compute output sum */
    assign  Sum[0] = P[0] ^ Cin;                    // sum bit 0 - depends on Cin
    assign  Sum[1] = P[1] ^ G[0];                   // sum bit 1 - depends on Generate for bit 0, level 0
    assign  Sum[2] = P[2] ^ level1out_G[1];         // sum bit 2 - depends on Generate for bit 1, level 1
    assign  Sum[3] = P[3] ^ level7out_G[2];         // sum bit 3 - depends on Generate for bit 2, level 7
    assign  Sum[4] = P[4] ^ level2out_G[3];         // sum bit 4 - depends on Generate for bit 3, level 2
    assign  Sum[5] = P[5] ^ level7out_G[4];         // sum bit 5 - depends on Generate for bit 4, level 7
    assign  Sum[6] = P[6] ^ level6out_G[5];         // sum bit 6 - depends on Generate for bit 5, level 6
    assign  Sum[7] = P[7] ^ level7out_G[6];         // sum bit 7 - depends on Generate for bit 6, level 7
    assign  Sum[8] = P[8] ^ level3out_G[7];         // sum bit 8 - depends on Generate for bit 7, level 3
    assign  Sum[9] = P[9] ^ level7out_G[8];         // sum bit 9 - depends on Generate for bit 8, level 7
    assign  Sum[10] = P[10] ^ level6out_G[9];       // sum bit 10 - depends on Generate for bit 9, level 6
    assign  Sum[11] = P[11] ^ level7out_G[10];      // sum bit 11 - depends on Generate for bit 10, level 7
    assign  Sum[12] = P[12] ^ level5out_G[11];      // sum bit 12 - depends on Generate for bit 11, level 5
    assign  Sum[13] = P[13] ^ level7out_G[12];      // sum bit 13 - depends on Generate for bit 12, level 7
    assign  Sum[14] = P[14] ^ level6out_G[13];      // sum bit 14 - depends on Generate for bit 13, level 6
    assign  Sum[15] = P[15] ^ level7out_G[14];      // sum bit 15 - depends on Generate for bit 14, level 7
    assign  Cout = level4out_G[15];                 // carry out - depends on Generate for bit 15, level 4  
endmodule 