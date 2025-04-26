`timescale 1ns / 100ps

module tb_and;
reg a,b;
wire x1;

myand gate_inst1(.a(a),.b(b),.x(x1));


initial begin
    $monitor (x1);
    a=1'b0;
    b=1'b0;

    #5 a=1'b0;
    b=1'b0;

    #5 a=1'b0;
    b=1'b1;

    #5 a=1'b1;
    b=1'b0;

    #5 a=1'b1;
    b=1'b1;

    $stop;

end

endmodule
