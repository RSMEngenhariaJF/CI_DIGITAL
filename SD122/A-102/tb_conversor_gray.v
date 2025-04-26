`timescale 1ns / 100ps
module conversor_GRAY_tb();
reg H, G, F, E;
wire [3:0] Y;


conversor_GRAY DUT(H, G, F, E, Y[3], Y[2], Y[1], Y[0]);
initial begin
    {H, G, F, E} = 4'b0000; #10;
    {H, G, F, E} = 4'b0001; #10;
    {H, G, F, E} = 4'b0010; #10;
    {H, G, F, E} = 4'b0011; #10;
    {H, G, F, E} = 4'b0100; #10;
    {H, G, F, E} = 4'b0101; #10;
    {H, G, F, E} = 4'b0110; #10;
    {H, G, F, E} = 4'b0111; #10;
    {H, G, F, E} = 4'b1000; #10;
    {H, G, F, E} = 4'b1001; #10;
    {H, G, F, E} = 4'b1010; #10;
    {H, G, F, E} = 4'b1011; #10;
    {H, G, F, E} = 4'b1100; #10;
    {H, G, F, E} = 4'b1101; #10;
    {H, G, F, E} = 4'b1110; #10;
    {H, G, F, E} = 4'b1111; #10;
    $stop;
end

endmodule
