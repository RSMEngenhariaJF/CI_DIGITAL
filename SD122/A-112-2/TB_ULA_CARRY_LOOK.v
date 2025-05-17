`timescale 1ns / 100ps
module tb_ula_carry_look();

reg [3:0] A,B;
reg [2:0] seletor;
reg c_in;
wire [3:0] resultado;
wire propagado,gerado; 
wire carry_out;
ula DUT(
    .A(A),         // Operando A
    .B(B),         // Operando B
    .seletor(seletor),   // Sinal de seleção (3 bits)
    .carry_in(c_in),
    .resultado(resultado), // Resultado da operação
    .propagado(propagado), 
    .gerado(gerado), 
    .carry_out(carry_out)
);

initial begin
    A=4'd5;
    B=4'd7;
    seletor = 3'b100;
    c_in = 1'b0;
    #10;

    A=4'd5;
    B=4'd7;
    seletor = 3'b100;
    c_in = 1'b1;
    #10;

    A=4'd8;
    B=4'd7;
    seletor = 3'b100;
    c_in = 1'b1;
    #10;

    
    A=4'd8;
    B=4'd7;
    seletor = 3'b100;
    c_in = 1'b0;
    #10;

    A=4'd6;
    B=4'd7;
    seletor = 3'b100;
    c_in = 1'b0;
    #10;

    A=4'd10;
    B=4'd10;
    seletor = 3'b100;
    c_in = 1'b0;
    #10;
    $stop;
end
endmodule
