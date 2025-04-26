module conv_8421_E3(
    input [3:0] bcd,
    output [3:0] S
    );
    reg [3:0] Y;
    always @(*) begin
        case (bcd)
                4'b0000 : Y <= 4'b0011;
                4'b0001 : Y <= 4'b0100;
                4'b0010 : Y <= 4'b0101;
                4'b0011 : Y <= 4'b0110;
                4'b0100 : Y <= 4'b0111;
                4'b0101 : Y <= 4'b1000;
                4'b0110 : Y <= 4'b1001;
                4'b0111 : Y <= 4'b1010;
                4'b1000 : Y <= 4'b1011;
                4'b1001 : Y <= 4'b1100;
                
                default: Y <= 4'bxxxx; 
        endcase 
    end
    assign S = Y;
endmodule