

 module somador_subtrator(
        input [3:0] A,B,
        input sub,
        output [3:0] Result,
        output C_out
 );

    wire [4:0] saida;
    reg C;
    initial begin
        C = 0;
    end
    assign saida = sub+(A+(B^({sub,sub,sub,sub})));
    assign C = saida[4];
    assign C_out = (sub==1'b1) ? ~C : C;
    assign Result = saida[3:0];

 endmodule