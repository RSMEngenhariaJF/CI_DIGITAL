module mux4(
    input [1:0] D,
    input sel, 
    output reg y 
);

always @ (*) begin
    
    if (sel == 1'b0)
        y = D[1];
    else
        y = D[0]; 
end

endmodule