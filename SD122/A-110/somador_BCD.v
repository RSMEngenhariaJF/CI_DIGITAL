
module somador_BCD_1(
        input [3:0] A,B,
        input C_in,
        output [3:0] saida,
        output carry
);
reg [3:0] S;
reg C;
initial begin
    C <= 1'b0;
end
always @ (*) begin
    S = A+B+C_in;
    if(S> 9)
    begin
        if(S>15)
            C <= 1'b1;
        else
            C<=1'b0;
        S = S + 6;
    end
end

assign saida = S;
assign  carry = C;
endmodule


module somador_BCD(
        input [3:0] A,B,
        input C_in,
        output [3:0] saida,
        output carry
);
reg [3:0] S;
reg C;
initial begin
    C <= 1'b0;
end
always @ (*) begin
    S = A+B+C_in;
    if(S> 9)
        begin
            C <= 1'b1;
            S = S + 6;
        end
    else
        C<=1'b0;
    
end

assign saida = S;
assign  carry = C;
endmodule

module convert_BCD(
    input [7:0] entrada,
    output [11:0] BCD
);
    reg [11 : 0] bcd; 
     reg [3:0] i;   
     
     //Always block - implement the Double Dabble algorithm
     always @(*)
        begin
            bcd = 0; //initialize bcd to zero.
            for (i = 0; i < 8; i = i+1) //run for 8 iterations
            begin
                bcd = {bcd[10:0],entrada[7-i]}; //concatenation
                    
                //if a hex digit of 'bcd' is more than 4, add 3 to it.  
                if(i < 7 && bcd[3:0] > 4) 
                    bcd[3:0] = bcd[3:0] + 3;
                if(i < 7 && bcd[7:4] > 4)
                    bcd[7:4] = bcd[7:4] + 3;
                if(i < 7 && bcd[11:8] > 4)
                    bcd[11:8] = bcd[11:8] + 3;  
            end
        end
    assign BCD = bcd;     
endmodule

module somador_BCD_3DIG(
    input [7:0] A,B,
    input C_in,
    output [11:0] S,
    output C_out
);
wire C_UN,C_DZ;
wire [7:0] S_UN,S_DZ,S_CN;
wire [11:0] A_BCD,B_BCD;

convert_BCD conv_A(
    .entrada(A),
    .BCD(A_BCD)
);

convert_BCD conv_B(
    .entrada(B),
    .BCD(B_BCD)
);

somador_BCD UNIDADE(
        .A(A_BCD[3:0]),
        .B(B_BCD[3:0]),
        .C_in(C_in),
        .saida(S_UN),
        .carry(C_UN)
);
somador_BCD DEZENA(
        .A(A_BCD[7:4]),
        .B(B_BCD[7:4]),
        .C_in(C_UN),
        .saida(S_DZ),
        .carry(C_DZ)
);
somador_BCD CENTENA(
        .A(A_BCD[11:8]),
        .B(B_BCD[11:8]),
        .C_in(C_DZ),
        .saida(S_CN),
        .carry(C_out)
);

assign S = {S_CN[3:0],S_DZ[3:0],S_UN[3:0]};


endmodule