module demux_1x8 (
            input data,
            input [2:0] sel,
            output [7:0] Y
);

reg [7:0] X;
initial
begin
    X<= 8'b0000000;
end


always @ (*) begin
    X = 8'b0000000;
    case (sel)
            3'b000 : X[0] <= data;
            3'b001 : X[1] <= data;
            3'b010 : X[2] <= data;
            3'b011 : X[3] <= data;
            3'b100 : X[4] <= data;
            3'b101 : X[5] <= data;
            3'b110 : X[6] <= data;
            3'b111 : X[7] <= data;
            default: X <= 8'b00000000;
    endcase
end
assign Y = X;
endmodule