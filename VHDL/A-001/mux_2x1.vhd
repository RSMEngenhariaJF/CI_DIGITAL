
--BIBLIOTECAS E PACOTES
LIBRARY IEEE;
    USE IEEE.std_logic_1164.ALL;

--ENTIDADE, DESCRIÇÃO DE PORTAS DE ENTRADA E SAÍDA
ENTITY mux_2x1 IS
    PORT (
        port_A          : IN std_logic;
        port_B          : IN std_logic;
        selector        : IN std_logic;
        mux_out         : OUT std_logic
    );
END ENTITY mux_2x1;

--ARQUITETURA, 
ARCHITECTURE behavioural OF mux_2x1 IS
BEGIN

    comb_proc : PROCESS(ALL) --EQUIVALENTE AO always @ (*) EM VERILOG
    BEGIN
        IF (selector = '0') THEN 
            mux_out <= port_A;
        ELSE
            mux_out <= port_B;
        END IF;
    END PROCESS comb_proc;

END ARCHITECTURE behavioural;
