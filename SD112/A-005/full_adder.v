module full_adder(
        output sum, carry_out,
        input a, b, cin
);

assign sum = a ^ b ^ cin;
assign carry_out = (a & b)+(cin & (a ^ b));
endmodule
