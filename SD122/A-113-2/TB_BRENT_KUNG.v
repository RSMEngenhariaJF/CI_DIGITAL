`timescale 1ns / 100ps
module testbench();

    reg [15:0] A, B;
    reg Cin;

    wire [15:0] Sum;
    wire Cout;

    integer i, j;
    initial begin
        A = 16'd1; B = 16'd0; Cin = 1'b0;
        
        // loop de teste 
        for ( i = 0; i < 65535; i=i+1) begin
            A = i;
            for (j = 0; j < 65535; j=j+1) begin
                B = j;
                #10;
                if (Sum == (A+B)) 
                    #0;
                else begin
                    $display("Erro: soma = %d + %d = %d, resultado = %d", A, B, (A+B), Sum);
                    $stop;
                end
            end
        end
        $stop;
    end

  
    brent_kung_adder DUT(
             .A(A),
             .B(B),
             .Cin(Cin),
             .Sum(Sum),
             .Cout(Cout) 
);

endmodule