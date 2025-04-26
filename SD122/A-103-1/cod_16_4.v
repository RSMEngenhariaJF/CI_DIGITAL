module cod_16_4 (
    input [15:0] entrada,
    output [3:0] S
);
    reg [3:0] saida;
    always @ (*) begin
        casex (entrada)
                16'b1xxxxxxxxxxxxxxx : saida = 4'b1111;
                16'b01xxxxxxxxxxxxxx : saida = 4'b1110;
                16'b001xxxxxxxxxxxxx : saida = 4'b1101;
                16'b0001xxxxxxxxxxxx : saida = 4'b1100;
                16'b00001xxxxxxxxxxx : saida = 4'b1011;
                16'b000001xxxxxxxxxx : saida = 4'b1010;
                16'b0000001xxxxxxxxx : saida = 4'b1001;
                16'b00000001xxxxxxxx : saida = 4'b1000;
                16'b000000001xxxxxxx : saida = 4'b0111;
                16'b0000000001xxxxxx : saida = 4'b0110;
                16'b00000000001xxxxx : saida = 4'b0101;
                16'b000000000001xxxx : saida = 4'b0100;
                16'b0000000000001xxx : saida = 4'b0011;
                16'b00000000000001xx : saida = 4'b0010;
                16'b000000000000001x : saida = 4'b0001;
                16'b1000000000000001 : saida = 4'b0000;
                default : saida = 4'b0000;
        endcase
    end
    assign S = saida;
endmodule