module comp_RTL (
    input [1:0] A,B,
    output y
);


wire W1,W2;

xnor I1(W1,A[0],B[0]);
xnor I2(W2,A[1],B[1]);
and I3(y,W1,W2);



endmodule