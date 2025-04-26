`timescale 1ns / 100ps
module tb_conv_8421_E3();

reg [3:0] bcd;
wire [3:0] S;

conv_8421_E3 DUT(
    .bcd,
    .S
    );

initial begin
    bcd = 4'b0000;
    #10 bcd = 4'b0000;
    #10 bcd = 4'b0001;
    #10 bcd = 4'b0010;
    #10 bcd = 4'b0011;
    #10 bcd = 4'b0100;
    #10 bcd = 4'b0101;
    #10 bcd = 4'b0110;
    #10 bcd = 4'b0111;
    #10 bcd = 4'b1000;
    #10 bcd = 4'b1001;
    #10 bcd = 4'b1001;
    stop();
end 

endmodule