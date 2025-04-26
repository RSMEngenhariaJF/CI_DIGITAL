module circuito #(parameter WIDTH=4) (
    input clk,rst,
    output saida
);

localparam CONST = 4'd10;

reg [WIDTH-1: 0] cont;
reg enable, oDFF;
initial begin
    enable <= 1'b0;
    oDFF <= 1'b0;
    cont <= 0;
end

always @ (posedge clk or posedge rst) begin
    if (~enable)
        cont = cont+1'b1;
    else if( rst ) 
        cont = 0;
end

always @ (*) begin
    if (cont == CONST)
        enable <= 1'b1;
    else
        enable <= 1'b0;
end

always @ (posedge clk or posedge rst) begin
    if(rst)
        oDFF <= 1'b0;
    else 
        oDFF <= enable;
end


assign saida = oDFF;

endmodule