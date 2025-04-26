module contador(
        output reg [3:0] sinal,
        output reg DP,
        input clk 
    );
    
    initial begin 
        sinal<=4'b0000;
        DP <= 1'b0;
    end
    always @ (posedge clk)
    if (sinal == 4'b1111)
        begin 
            sinal <=4'd0;
            DP = ~DP;
        end
    else
        sinal = sinal + 1'b1;
endmodule
