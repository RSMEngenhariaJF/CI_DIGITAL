`timescale 1ns / 100ps

module tb_full_adder();

reg a,b, cin;
wire sum_out, carry_out;

full_adder_2 fa(.sum(sum_out),
              .carry_out(carry_out),
              .a(a),
              .b(b),
              .cin(cin)  
);

initial begin
    //$monitor(sum, carry_out);
    a=1'b0;
    b=1'b0;
    cin=1'b0;

    #5 a=1'b0;
    b=1'b0;
    cin=1'b1;

    #5 a=1'b0;
    b=1'b1;
    cin=1'b0;

    #5 a=1'b0;
    b=1'b1;
    cin=1'b1;

    #5 a=1'b1;
    b=1'b0;
    cin=1'b0;

    #5 a=1'b1;
    b=1'b0;
    cin=1'b1;

    #5 a=1'b1;
    b=1'b1;
    cin=1'b0;

    #5 a=1'b1;
    b=1'b1;
    cin=1'b1;

    #5 a=1'b1;
    b=1'b1;
    cin=1'b1;

   $stop;

end

endmodule