module demux_1xN #(parameter N=10) (
                    input data,
                    input [$clog2(N)-1:0] sel,
                    output [N-1:0] Y
);

reg [N-1:0] X;

integer i;
always@(data,sel)
    begin
        for(i=0;i<N;i=i+1)
        X[i] <= (sel==i )? data :1'b0;
    end
assign Y = X;
endmodule