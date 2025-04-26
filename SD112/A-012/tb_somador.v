`timescale 1ns / 100ps

module tb_somador();

reg [23:0] A,B;
reg Cin;
wire [23:0] saida;
wire Cout;

somador_1 sum(
    .A(A), 
    .B(B),
    .Cin(Cin),
    .saida(saida),
    .Cout(Cout)
);

initial begin
    A = 24'd100;
    B = 24'd200;
    Cin = 1'b0;

    #10 A = 24'd100;
    B = 24'd200;
    Cin = 1'b1;

    #10 A = 24'd150;
    B = 24'd200;
    Cin = 1'b1;

    #10 A = 24'd250;
    B = 24'd200;
    Cin = 1'b1;

    #10 A = 24'd250;
    B = 24'd200;
    Cin = 1'b0;




    
end

endmodule