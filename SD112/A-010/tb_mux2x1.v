`timescale 1ns / 100ps
module tb();

reg in1,in2, sel;
wire out1,out2,out3;

mux2x1_rtl_1 mux1(
        .in1(in1), 
        .in2(in2), 
        .select(sel),
        .out(out1)
);


mux2x1_rtl_2 mux2(
        .in1(in1), 
        .in2(in2), 
        .select(sel),
        .out(out2)
);

mux2x1_rtl_3 mux3(
        .in1(in1), 
        .in2(in2), 
        .select(sel),
        .out(out3)
);



initial begin
    in1 = 1'b1;
    in2 = 1'b0;
    sel = 1'b0;
    

    #5 in1 = 1'b1;
    in2 = 1'b0;
    sel = 1'b1;

    #5 in1 = 1'b0;
    in2 = 1'b0;
    sel = 1'b1;

    #5 in1 = 1'b1;
    in2 = 1'b0;
    sel = 1'b0;

    #5 in1 = 1'b1;
    in2 = 1'b1;
    sel = 1'b1;

    #5 in1 = 1'b1;
    in2 = 1'b1;
    sel = 1'b1;
    
end

endmodule
