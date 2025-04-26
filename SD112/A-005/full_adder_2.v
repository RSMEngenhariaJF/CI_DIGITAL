module full_adder_2(
        output sum, 
        output carry_out,
        input a, b, cin

);

wire sum_1,carry_1,carry_2;

half_adder h_a1(
        .sum(sum_1),
        .carry(carry_1),
        .a(a), 
        .b(b)
);

half_adder h_a2(
        .sum(sum),
        .carry(carry_2),
        .a(cin), 
        .b(sum_1)
);



assign carry_out = carry_1 | carry_2;

endmodule
