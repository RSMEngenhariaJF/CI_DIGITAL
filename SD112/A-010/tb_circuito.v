`timescale 1ns / 100ps

module tb_cir();

reg A,B,C,D;
wire S;

circuito CI(
    .A(A),
    .B(B),
    .C(C),
    .D(D),
    .S(S)
);
reg [3:0] cont;
reg clk;

always #5 clk = ~clk;

always @ (posedge clk) begin
    if (cont == 4'b1111)
        cont = 4'b0;
    else
        cont = cont + 1'b1;
        A <= cont[3];
        B <= cont[2];
        C <= cont[1];
        D <= cont[0];
end

initial begin
    A=1'b0;
    B=1'b0;
    C=1'b0;
    D=1'b0;
    clk = 1'b0;
    cont = 4'b0000;

end

endmodule