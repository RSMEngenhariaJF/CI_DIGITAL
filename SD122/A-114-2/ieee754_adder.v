module ieee754_adder(
    input [31:0] a,
    input [31:0] b,
    output [31:0] result
);

    reg [23:0] mantissa_a, mantissa_b;
    reg [24:0] mantissa_sum;
    reg [7:0] exp_diff;
    reg [7:0] expoente_maior, expoente_final;
    reg [4:0] shift; // Para armazenar o numero maximo de deslocamentos possiveis (5 bits sao suficientes para 24 posicoes)
   

    always @(*) begin
        // Extrai as mantissas e adiciona bit implicito
        mantissa_a = {1'b1, a[22:0]};
        mantissa_b = {1'b1, b[22:0]};

        // Determina qual numero tem maior expoente
        if (a[30:23] >= b[30:23]) begin
            exp_diff = a[30:23] - b[30:23];
            expoente_maior = a[30:23];
            mantissa_b = mantissa_b >> exp_diff; // Desloca a mantissa do numero menor
        end else begin
            exp_diff = b[30:23] - a[30:23];
            expoente_maior = b[30:23];
            mantissa_a = mantissa_a >> exp_diff; // Desloca a mantissa do numero menor
        end

        // Soma das mantissas
        mantissa_sum = mantissa_a + mantissa_b;

        // Normalizacao
        if (mantissa_sum[24]) begin
            // Se houve carry (bit extra), deslocamos para a direita e incrementamos o expoente
            mantissa_sum = mantissa_sum >> 1;
            expoente_final = expoente_maior + 1;
        end else begin
            // Se nao houve carry, encontramos o primeiro bit 1 mais significativo
            shift = 0;
            while (mantissa_sum[23 - shift] == 0 && shift < 23) begin
                shift = shift + 1;
            end
            mantissa_sum = mantissa_sum << shift;
            expoente_final = expoente_maior - shift;
        end
    end

    assign result[31] = 0; // Assumindo que ambos os numeros sao positivos
    assign result[30:23] = expoente_final;
    assign result[22:0] = mantissa_sum[22:0]; // Pegamos apenas os 23 bits menos significativos

endmodule

module ieee754_sub(
    input [31:0] a,
    input [31:0] b,
    output [31:0] result
);

    reg [23:0] mantissa_a, mantissa_b;
    reg [24:0] mantissa_sum;
    reg [7:0] exp_diff;
    reg [7:0] expoente_maior, expoente_final;
    reg [4:0] shift; // Para armazenar o numero maximo de deslocamentos possiveis (5 bits sao suficientes para 24 posicoes)
    reg sinal;
    always @(*) begin
        // Extrai as mantissas e adiciona bit implicito
        mantissa_a = {1'b1, a[22:0]};
        mantissa_b = {1'b1, b[22:0]};

        // Determina qual numero tem maior expoente
        if (a[30:23] >= b[30:23]) begin
            exp_diff = a[30:23] - b[30:23];
            expoente_maior = a[30:23];
            mantissa_b = mantissa_b >> exp_diff; // Desloca a mantissa do numero menor
        end else begin
            exp_diff = b[30:23] - a[30:23];
            expoente_maior = b[30:23];
            mantissa_a = mantissa_a >> exp_diff; // Desloca a mantissa do numero menor
        end
        if(mantissa_a > mantissa_b)begin 
            // subtração das mantissas
            mantissa_sum = mantissa_a - mantissa_b;
            sinal = 1'b0;
        end
        else
            begin
                mantissa_sum = mantissa_b - mantissa_a;
                sinal = 1'b1;
            end
        if(mantissa_a == mantissa_b)
        begin
            sinal = 1'b0;
            mantissa_sum = 0;
            expoente_final = 0;
        end
        else
        begin
            // Normalizacao
            if (mantissa_sum[24]) begin
                // Se houve carry (bit extra), deslocamos para a direita e incrementamos o expoente
                mantissa_sum = mantissa_sum >> 1;
                expoente_final = expoente_maior + 1;
            end else begin
                // Se nao houve carry, encontramos o primeiro bit 1 mais significativo
                shift = 0;
                while (mantissa_sum[23 - shift] == 0 && shift < 23) begin
                    shift = shift + 1;
                end
                mantissa_sum = mantissa_sum << shift;
                expoente_final = expoente_maior - shift;
            end
            
        end
    end

    assign result[31] = sinal; // Assumindo que ambos os numeros sao positivos
    assign result[30:23] = expoente_final;
    assign result[22:0] = mantissa_sum[22:0]; // Pegamos apenas os 23 bits menos significativos

endmodule

module ieee754_mult(
    input [31:0] a,
    input [31:0] b,
    output [31:0] result
);

    reg [23:0] mantissa_a, mantissa_b;
    reg [47:0] mantissa_sum;
    reg [7:0] exp_diff;
    reg sinal;
    reg [7:0] expoente_maior, expoente_final;
    reg [4:0] shift; // Para armazenar o numero maximo de deslocamentos possiveis (5 bits sao suficientes para 24 posicoes)
   

    always @(*) begin
        // Extrai as mantissas e adiciona bit implicito
        mantissa_a = {1'b1, a[22:0]};
        mantissa_b = {1'b1, b[22:0]};
        mantissa_a = mantissa_a>>1;
        mantissa_b = mantissa_b>>1;
        sinal = a[31] ^ b[31];
        exp_diff =  a[30:23] + b[30:23] - 127;
        expoente_maior = exp_diff;
        
        mantissa_sum = mantissa_a * mantissa_b;
        if(mantissa_a[20:0] == 0 || mantissa_b[20:0] == 0)
            begin
                sinal = 1'b0;
                mantissa_sum = 0;
                expoente_final = 0;
            end
        else begin
            if (mantissa_sum[47]) begin
                expoente_final = expoente_maior + 1;
            end else begin
                // Se nao houve carry, encontramos o primeiro bit 1 mais significativo
                shift = 0;
                while (mantissa_sum[47 - shift] == 0 && shift < 47) begin
                    shift = shift + 1;
                end
                mantissa_sum = mantissa_sum << shift;
                expoente_final = expoente_maior - shift+3;
            end
        end
    end

    assign result[31] = sinal; // Assumindo que ambos os numeros sao positivos
    assign result[30:23] = expoente_final;
    assign result[22:0] = mantissa_sum[46:24]; // Pegamos apenas os 23 bits menos significativos

endmodule
