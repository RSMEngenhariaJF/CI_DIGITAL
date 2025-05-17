`timescale 1ns / 100ps
module tb_demux_1x8();
reg data;
reg [2:0] sel;
wire [7:0] Y;

//PARA TESTAR CADA ATIVIDADE DESCOMENTAR A INSTANCIA RELACIONADA E COMENTAR AS DEMAIS
//ATIVIDADE 1
/*
demux_1x8 DUT(
            .data(data),
            .sel(sel),
            .Y(Y)
);*/

//ATIVIDADE 2
/*
demux_1x8_2 DUT(
        .data(data),
        .sel(sel),
        .Y(Y) 
    );
*/
//ATIVIDADE 3
demux_1xN #(8) DUT(
        .data(data),
        .sel(sel),
        .Y(Y) 
    );

integer i;
    initial begin
        data=0;
        sel = 3'b000;
        
        for(i = 0; i <8; i=i+1) 
        begin
            #10 
            data = 1'b1;
            #10 
            data = 1'b0;
            sel = sel+1'b1;
        end
        #10 
        $stop;

    end

endmodule