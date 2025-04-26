`timescale 1ns / 100ps

module tb_half_adder;
reg a,b;
wire sum, carry;

half_adder ha(.sum(sum),.carry(carry),.a(a),.b(b));

initial begin
    $monitor (sum,carry);
    a=1'b0;
    b=1'b0;

    #5 a=1'b0;
    b=1'b1;
    
    #5 a=1'b1;
    b=1'b0;

    #5 a=1'b1;
    b=1'b1;

    #5 a=1'b1;
    b=1'b1;
    $stop;

end

endmodule