module datapath(
    input sel12, 
    input escrita, 
    input clk, 
    input reset,
    input sel21, 
    input carry_in,
    input [3:0] dados,
    input [1:0] reg_addr,
    input [2:0] operacao,
    output [3:0] resultado,
    output carry_out

);
wire [3:0] reg_file_q,mux_out, regA_d, regB_d,regA_q,regB_q;

register_file reg_file(
    .clk(clk),                    //! Clock para sincronização
    .we(escrita),                     //! Sinal de habilitação de escrita (Write Enable)
    .addr(reg_addr),             //! Endereço do registro a ser acessado (2 bits para 4 registros)
    .data_in(mux_out),          //! Dados de entrada para escrita
    .data_out(reg_file_q)     //! Dados de saída do registro selecionado
);

ula ula(
    .A(regA_q),         // Operando A
    .B(regB_q),         // Operando B
    .seletor(operacao),   // Sinal de seleção (3 bits)
    .C_in(carry_in),
    .resultado(resultado), // Resultado da operação
    .C_out(carry_out)
);


register_4bits regB(
    .clk(clk),        // Sinal de clock
    .reset(reset),      // Sinal de reset (ativo em nível alto)
    .en(sel12),
    .d(regB_d),    // Entrada de 4 bits
    .q(regB_q) // Saída de 4 bits
);

register_4bits regA(
    .clk(clk),        // Sinal de clock
    .reset(reset),      // Sinal de reset (ativo em nível alto)
    .en(~sel12),
    .d(regA_d),    // Entrada de 4 bits
    .q(regA_q) // Saída de 4 bits
);

demux1x2_4bits demux1x2_4bits(
    .in(reg_file_q),    // Entrada de 4 bits
    .sel(sel12),          // Sinal de seleção (1 bit)
    .out0(regA_d),  // Saída 0 (4 bits)
    .out1(regB_d)   // Saída 1 (4 bits)
);

mux2x1_4bits mux2x1_4bits(
    .in0(dados),      //! Entrada 0 (4 bits)
    .in1(resultado),      //! Entrada 1 (4 bits)
    .sel(sel21),            //! Sinal de seleção (1 bit)
    .out(mux_out)       //! Saída do multiplexador (4 bits)
);

endmodule