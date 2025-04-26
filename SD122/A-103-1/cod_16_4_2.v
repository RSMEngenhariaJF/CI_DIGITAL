module cod_8_3 (
    input [7:0] entrada,
    output [2:0] S
);
    reg [2:0] saida;
    always @ (*) begin
        casex (entrada)
                8'b1xxxxxxx : saida = 3'b111;
                8'b01xxxxxx : saida = 3'b110;
                8'b001xxxxx : saida = 3'b101;
                8'b0001xxxx : saida = 3'b100;
                8'b00001xxx : saida = 3'b011;
                8'b000001xx : saida = 3'b010;
                8'b0000001x : saida = 3'b001;
                
                default : saida = 4'b0000;
        endcase
    end
    assign S = saida;

endmodule

module cod_16_4_2 (
    input [15:0] A,
    output [3:0] Y
);

reg sel;
wire [2:0] X,Z;

cod_8_3 cod_LSB(
    .entrada(A[7:0]),
    .S(Z)
);

cod_8_3 cod_MSB(
    .entrada(A[15:8]),
    .S(X)
);

assign sel = |A[15:8];
assign Y = (sel) ? {sel,X} : {sel,Z};
endmodule