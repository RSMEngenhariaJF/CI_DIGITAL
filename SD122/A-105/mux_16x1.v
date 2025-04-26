module mux_16x1 (
        input [15:0] A,
        input [3:0] sel,
        output Y
);

reg saida;
always @ (*) begin
    case (sel)
            4'b0000 : saida <= A[0];
            4'b0001 : saida <= A[1];
            4'b0010 : saida <= A[2];
            4'b0011 : saida <= A[3];
            4'b0100 : saida <= A[4];
            4'b0101 : saida <= A[5];
            4'b0110 : saida <= A[6];
            4'b0111 : saida <= A[7];
            4'b1000 : saida <= A[8];
            4'b1001 : saida <= A[9];
            4'b1010 : saida <= A[10];
            4'b1011 : saida <= A[11];
            4'b1100 : saida <= A[12];
            4'b1101 : saida <= A[13]; 
            4'b1110 : saida <= A[14];
            4'b1111 : saida <= A[15];
            default: saida <=1'b0;
    endcase
end
assign Y = saida;
endmodule