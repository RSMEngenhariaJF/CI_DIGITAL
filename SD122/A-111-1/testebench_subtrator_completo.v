`timescale 1ns / 100ps
module tb_subtrator_completo();

reg A, B, B_in;
wire D_1, Bout_1,D_2, Bout_2,D_3, Bout_3;

subtrator_completo_rtl1 DUT1(
    .A(A), 
    .B(B), 
    .BorrowIn(B_in),
    .D(D_1), 
    .BorrowOut(Bout_1)
 );

subtrator_completo DUT2(
.A(A), 
.B(B), 
.BorrowIn(B_in),
.D(D_2), 
.BorrowOut(Bout_2)
);

subtrator_completo_comportamental2 DUT3(
    .A(A), 
    .B(B), 
    .BorrowIn(B_in),
    .D(D_3), 
    .BorrowOut(Bout_3)
);

initial begin
A=0;
B=0;
B_in = 0;

#10;
A=1'b1;
B=1'b0;
B_in=1'b0;
#10;

#10;
A=1'b1;
B=1'b1;
B_in=1'b0;
#10;

#10;
A=1'b0;
B=1'b1;
B_in=1'b0;
#10;

#10;
A=1'b0;
B=1'b0;
B_in=1'b1;
#10;

#10;
A=1'b1;
B=1'b0;
B_in=1'b1;
#10;

#10;
A=1'b1;
B=1'b1;
B_in=1'b1;
#10;

#10;
A=1'b0;
B=1'b1;
B_in=1'b1;
#10;
$stop;
end

endmodule