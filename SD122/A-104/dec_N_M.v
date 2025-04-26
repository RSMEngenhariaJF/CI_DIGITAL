module dec_N_M #(parameter WIDTH_I = 4, parameter WIDTH_0 = 16)(
        input [WIDTH_I-1:0] A,
        output [WIDTH_0-1:0] Y
);
reg [WIDTH_0-1:0] saida;

always @ (*) begin
        if(A > WIDTH_0)
            saida <= 0;
        else 
            saida <=1<<A; 
end 
assign Y = saida;
endmodule