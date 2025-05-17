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