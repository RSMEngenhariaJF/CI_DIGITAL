`timescale 1ns / 100ps
module TB_DATAPATH();
reg sel12,escrita,clk,rst,sel21,c_in;
reg [3:0] dados;
reg [1:0] reg_addr;
reg [2:0] op;
wire [3:0] resultado;
wire c_out;
datapath DUT(
    .sel12(sel12), 
    .escrita(escrita), 
    .clk(clk), 
    .reset(rst),
    .sel21(sel21), 
    .carry_in(c_in),
    .dados(dados),
    .reg_addr(reg_addr),
    .operacao(op),
    .resultado(resultado),
    .carry_out(c_out)
);

always #5 clk = ~clk;

initial begin
    clk = 1'b0;
   // Realiza o reset
    //manipuladores dos registradores
    sel12 = 1'b0;
    sel21 = 1'b0;
    rst = 1'b1;
    escrita = 1'b0;
    dados = 4'd0;
    reg_addr = 2'b00;
    //manipuladores aritmeticos
    c_in = 1'b0;
    op=3'b000;
    #10;

    //escreve os dados
    //escrevendo 5 no endereço 00 e passando para o registrador A também 
    //manipuladores dos registradores
    sel12 = 1'b0;
    sel21 = 1'b0;
    rst = 1'b0;
    escrita = 1'b1;
    dados = 4'd0;
    reg_addr = 2'b00;
    //manipuladores aritmeticos
    c_in = 1'b0;
    op=3'b000;
    #20;

    //escreve os dados
    //escrevendo 5 no endereço 00 e passando para o registrador A também 
    //manipuladores dos registradores
    sel12 = 1'b0;
    sel21 = 1'b0;
    rst = 1'b0;
    escrita = 1'b1;
    dados = 4'd0;
    reg_addr = 2'b01;
    //manipuladores aritmeticos
    c_in = 1'b0;
    op=3'b000;
    #20;
    //escreve os dados
    //escrevendo 5 no endereço 00 e passando para o registrador A também 
    //manipuladores dos registradores
    sel12 = 1'b0;
    sel21 = 1'b0;
    rst = 1'b0;
    escrita = 1'b1;
    dados = 4'd0;
    reg_addr = 2'b10;
    //manipuladores aritmeticos
    c_in = 1'b0;
    op=3'b000;
    #20;

    //escreve os dados
    //escrevendo 5 no endereço 00 e passando para o registrador A também 
    //manipuladores dos registradores
    sel12 = 1'b0;
    sel21 = 1'b0;
    rst = 1'b0;
    escrita = 1'b1;
    dados = 4'd0;
    reg_addr = 2'b11;
    //manipuladores aritmeticos
    c_in = 1'b0;
    op=3'b000;
    #20;

    //escreve os dados
    //escrevendo 5 no endereço 00 e passando para o registrador A também 
    //manipuladores dos registradores
    sel12 = 1'b0;
    sel21 = 1'b0;
    rst = 1'b0;
    escrita = 1'b1;
    dados = 4'd5;
    reg_addr = 2'b00;
    //manipuladores aritmeticos
    c_in = 1'b0;
    op=3'b000;
    #20;

    //escreve os dados
    //escrevendo 7 no endereço 00 e passando para o registrador V também 
    //manipuladores dos registradores
    sel12 = 1'b1;
    sel21 = 1'b0;
    rst = 1'b0;
    escrita = 1'b1;
    dados = 4'd7;
    reg_addr = 2'b01;
    //manipuladores aritmeticos
    c_in = 1'b0;
    op=3'b000;
    #20;

    //escreve os dados
    //realizando a operação A+B e salvando no endereço 11 do reg_file 
    //manipuladores dos registradores
    sel12 = 1'b0;
    sel21 = 1'b1;
    rst = 1'b0;
    escrita = 1'b1;
    dados = 4'd0;
    reg_addr = 2'b00;
    //manipuladores aritmeticos
    c_in = 1'b0;
    op=3'b100;
    #10;

   
   
    //escreve os dados
    //escrevendo o resultado no registrador A 
    //manipuladores dos registradores
    sel12 = 1'b0;
    sel21 = 1'b1;
    rst = 1'b0;
    escrita = 1'b1;
    dados = 4'd0;
    reg_addr = 2'b00;
    //manipuladores aritmeticos
    c_in = 1'b0;
    op=3'b100;
    #20;


    $stop;
end

endmodule