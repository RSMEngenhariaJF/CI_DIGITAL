`timescale 1ns / 100ps
module tb_paridade();
reg [7:0] dado;
wire saida;

paridade myparity(
        .data_in(dado)    , //  8 bit data in
        .parity_out(saida)   //  1 bit parity out
);

initial begin
    dado = 8'b0000001;
    
    #10 dado = 8'b0000001;

    #10 dado = 8'b0000011;

    #10 dado = 8'b0000111;

    #10 dado = 8'b0001111;

    #10 dado = 8'b0011111;

    #10 dado = 8'b0111111;

    #10 dado = 8'b1111111;

    #10 dado = 8'b1111111;

end

endmodule