`timescale 1ns / 100ps
module tb_meio_subtrator();

reg A, B;
wire D_1, Bout_1,D_2, Bout_2,D_3, Bout_3,D_4, Bout_4;

meio_subtrator DUT1(
    .A(A), // Minuendo
    .B(B), // Subtraendo
    .D(D_1), // Diferença (A - B)
    .Borrow(Bout_1) // Empréstimo
    );

meio_subtrator_2 DUT2(
    .A(A), // Minuendo
    .B(B), // Subtraendo
    .D(D_2), // Diferença (A - B)
    .Borrow(Bout_2) // Empréstimo
    );

meio_subtrator_3 DUT3(
    .A(A), // Minuendo
    .B(B), // Subtraendo
    .D(D_3), // Diferença (A - B)
    .Borrow(Bout_3) // Empréstimo
    );
meio_subtrator_4 DUT4(
.A(A), // Minuendo
.B(B), // Subtraendo
.D(D_4), // Diferença (A - B)
.Borrow(Bout_4) // Empréstimo
);

initial begin
A=0;
B=0;

#10;
A=1'b1;
B=1'b0;
#10;

#10;
A=1'b1;
B=1'b1;
#10;

#10;
A=1'b0;
B=1'b1;
#10;

$stop;
end

endmodule