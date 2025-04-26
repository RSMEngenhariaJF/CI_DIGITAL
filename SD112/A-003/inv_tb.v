`timescale 1ns / 100ps

module tb_inv;
reg [7:0] a;
wire [7:0] out_inv1,out_inv2;

inv #(.width(8)) gate_inst1(.b(out_inv1),.a(a));
inv #(.width(8)) gate_inst2(.b(out_inv2),.a(out_inv1));


initial begin
    $monitor (out_inv2);
    //$monitor(y1);
    a=8'b0;
    #5 a=8'b10101010;
    
    #5 a=8'b01010101;
    
    #5 a=8'b11111111;
    
    #5 a=8'b00000000;
    
    $stop;

end

endmodule
