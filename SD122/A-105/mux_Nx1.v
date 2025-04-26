module mux_Nx1 #(parameter BUS_WIDTH=5)(
                 input [BUS_WIDTH-1:0] D0,D1,D2,D3,
                 input [1:0] sel,
                 output [BUS_WIDTH-1:0] Y
                 );

reg [BUS_WIDTH-1:0] saida;
always @ (*) begin
    case (sel)
        2'b00 : saida <= D0;
        2'b01 : saida <= D1;
        2'b10 : saida <= D2;
        2'b11 : saida <= D3;
        default: saida <= 0;
    endcase 
end
assign Y = saida;
endmodule