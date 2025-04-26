`timescale 1ns / 100ps
module tb_crossbar();

reg in1,in2, select;
wire out1,out2;

crossbar_strutural cross(
        .in1(in1),
        .in2(in2), 
        .select(select),
        .out1(out1), 
        .out2(out2)
);


initial begin
    in1 = 1'b0;
    in2 = 1'b0;
    select = 1'b0;

    #10 in1 = 1'b1;
    in2 = 1'b0;
    select = 1'b0;

    #10 in1 = 1'b0;
    in2 = 1'b1;
    select = 1'b0;

    #10 in1 = 1'b1;
    in2 = 1'b1;
    select = 1'b0;

    #10 in1 = 1'b0;
    in2 = 1'b0;
    select = 1'b1;


    #10 in1 = 1'b1;
    in2 = 1'b0;
    select = 1'b1;

    #10 in1 = 1'b0;
    in2 = 1'b1;
    select = 1'b1;

    #10 in1 = 1'b1;
    in2 = 1'b1;
    select = 1'b1;


    
end

endmodule