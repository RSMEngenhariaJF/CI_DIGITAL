`timescale 1ns / 100ps
module conversor_tb();
reg H, G, F, E;
wire D, C, B, A;
wire D_2, C_2, B_2, A_2;


conversor DUT(H, G, F, E, D, C, B, A);
conversor_2 DUT_2(H, G, F, E, D_2, C_2, B_2, A_2);
initial begin
    {H, G, F, E} = 4'b0000; #10;
    {H, G, F, E} = 4'b0001; #10;
    {H, G, F, E} = 4'b0011; #10;
    {H, G, F, E} = 4'b0100; #10;
    {H, G, F, E} = 4'b0101; #10;
    {H, G, F, E} = 4'b0111; #10;
    {H, G, F, E} = 4'b1001; #10;
    {H, G, F, E} = 4'b1011; #10;
    {H, G, F, E} = 4'b1100; #10;
    {H, G, F, E} = 4'b1101; #10;
    $stop;
end

endmodule

