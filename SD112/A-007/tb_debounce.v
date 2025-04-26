`timescale 1ns / 100ps
module testbench_debounce;
    //inputs
    reg button;
    reg clk;
    reg reset;
    //outputs
    wire result;

    // instanciando a Unit Under Test (UUT)

    debounce #(.COUNTER_MAX(128))uut(
        .clk(clk), 
        .rst(reset),
        .noisy_in(button),
        .clean_out(result)

    );

    // Gerador de sinal de clock

    initial begin
        clk=0;
        forever #10 clk = ~clk;
    end

    //Geração de estimulos
    initial begin
        button =0; 
        reset = 1;
        #50 reset = 0;
        #6000 button =0;
        #50 button = 1;
        #200 button = 0;
        #50 button = 1;
        #150 button = 0;
        #100 button = 1;
        #8000 button = 0;
        #50 button = 1;
        #200 button = 0;
        #50 button = 1;
        #200 button =0;
    end


endmodule