`timescale 1ns / 100ps

module tb_funcao_1 ();

reg A,B,D0,D1,D2,D3;
wire Y;
reg [3:0] data;
reg [1:0] sel;
funcao_1 DUT(
        .A(A), 
        .B(B), 
        .D0(D0),
        .D1(D1),
        .D2(D2),
        .D3(D3),
        .Y(Y) 
);

integer i = 0;
initial begin
    data = 4'b1010;
    sel=2'b00;
    {A,B} = sel;
    {D0,D1,D2,D3} = data;
   
    for (i=0;i<4;i=i+1)
    begin
        sel = i;
        {A,B} = sel; 
        #10;
    end
    $stop;
end 

endmodule