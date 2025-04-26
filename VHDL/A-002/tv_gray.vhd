LIBRARY IEEE;
    USE IEEE.std_logic_1164.ALL;

LIBRARY std;
    USE std.env.ALL; --PARA USAR O STOP DA SIMULAÇÃO

ENTITY teste_gray IS
END ENTITY teste_gray;

ARCHITECTURE stimulus OF teste_gray IS
    -- componente que iremos testar
    COMPONENT codificador_gray IS
    PORT(
        binario : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
        gray    : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
    );
END COMPONENT;

    SIGNAL entrada :std_logic_vector(3 downto 0);
    SIGNAL sig_out : std_logic_vector(3 downto 0) := "0000";

BEGIN
    -- gera os valores para a simulação
    stimuli : PROCESS
    BEGIN
        entrada <= b"0000";
        WAIT FOR 10 ns;
        entrada <= b"0001";
        WAIT FOR 10 ns;
        entrada <= b"0010";
        WAIT FOR 10 ns;
        entrada <= b"0011";
        WAIT FOR 10 ns;
        entrada <= b"0100";
        WAIT FOR 10 ns;
        entrada <= b"0101";
        WAIT FOR 10 ns;
        entrada <= b"0110";
        WAIT FOR 10 ns;
        entrada <= b"0111";
        WAIT FOR 10 ns;
        entrada <= b"1000";
        WAIT FOR 10 ns;
        entrada <= b"1001";
        WAIT FOR 10 ns;
        entrada <= b"1010";
        WAIT FOR 10 ns;
        entrada <= b"1011";
        WAIT FOR 10 ns;
        entrada <= b"1100";
        WAIT FOR 10 ns;
        entrada <= b"1101";
        WAIT FOR 10 ns;
        entrada <= b"1110";
        WAIT FOR 10 ns;
        entrada <= b"1111";
        WAIT FOR 10 ns;
        stop;
    END PROCESS;

    -- instância da entidade em test (entity under test) EUT
    EUT : codificador_gray
        PORT MAP(
            binario => entrada,
            gray => sig_out
            
        );

END ARCHITECTURE stimulus;
