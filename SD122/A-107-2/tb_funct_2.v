`timescale 1ns / 100ps

module tb_funcao_2 ();

reg A,B,C,D0,D1,D2,D3;
wire Y;
reg [3:0] data;
reg [2:0] sel;
funcao_2 DUT(
        .A(A), 
        .B(B),
        .C(C), 
        .D0(D0),
        .D1(D1),
        .D2(D2),
        .D3(D3),
        .Y(Y) 
);

integer i = 0;
initial begin
    data = 4'b0110;
    sel=2'b000;
    {A,B,C} = sel;
    {D0,D1,D2,D3} = data;
    
    
    for (i=0;i<8;i=i+1)
    begin
        sel = i;
        {A,B,C} = sel; 
        #10;
    end
    $stop;
end 

endmodule