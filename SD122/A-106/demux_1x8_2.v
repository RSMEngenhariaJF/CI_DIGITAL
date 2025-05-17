module demux_1x4 (
            input data,
            input [1:0] sel,
            output [3:0] Y
    );
    reg [3:0] X;
    initial begin
        X<=4'b0000;
    end
    always @ (*) begin
        X=4'b0000;
        case (sel)
                2'b00 : X[0] <= data;
                2'b01 : X[1] <= data;
                2'b10 : X[2] <= data;
                2'b11 : X[3] <= data;
                default X <= 4'b0000;
        endcase
    end
    assign Y = X;

endmodule 

module demux_1x2 (
            input data,sel,
            output [1:0]Y
);
    reg [1:0] X;
    initial begin
        X=2'b00;
    end
    always @ (*) begin
        X=2'b00;
        if(sel==1'b0)
            X[0] <= data;
        else
            X[1] <= data; 
    end
    assign Y= X;
endmodule

module demux_1x8_2 (
        input data,
        input [2:0] sel,
        output [7:0] Y 
    );
    wire [1:0] saida_1;
    demux_1x4 demux_1(
        .data(saida_1[0]),
        .sel(sel[1:0]),
        .Y(Y[3:0])
        );

    demux_1x4 demux_2(
                .data(saida_1[1]),
                .sel(sel[1:0]),
                .Y(Y[7:4])
        );

    demux_1x2 demux_3(
            .data(data),
            .sel(sel[2]),
            .Y(saida_1)
        );


endmodule