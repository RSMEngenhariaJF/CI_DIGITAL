module circuito(
            output saida,
            input clk_A, nrst_in
);

reg sysnc_FF1,sysnc_FF2,sysnc_FF3;

always @ (posedge clk_A or negedge nrst_in) begin
    if (~nrst_in) begin
        sysnc_FF1 = 1'b0;
        sysnc_FF2 = 1'b0;
        sysnc_FF3 = 1'b0;
    end else begin
        sysnc_FF1 <= 1'b1;
        sysnc_FF2 <= sysnc_FF1;
        sysnc_FF3 <= sysnc_FF2;
    end
end

assign saida = sysnc_FF3;

endmodule 
