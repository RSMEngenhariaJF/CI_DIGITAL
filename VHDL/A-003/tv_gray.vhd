LIBRARY IEEE;
    USE IEEE.std_logic_1164.ALL;
LIBRARY IEEE;
    USE IEEE.STD_LOGIC_SIGNED.ALL;

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

    SIGNAL entrada :std_logic_vector(3 downto 0) := "0000";
    SIGNAL sig_out : std_logic_vector(3 downto 0) := "0000";
    SIGNAL rst : std_logic :='0';
    CONSTANT period : time := 10 ns;
    SIGNAL clock : std_logic := '1';
   

BEGIN
    pulsos:process
    begin
        WAIT FOR period/2;
        clock <= NOT clock;
    end process;

    zera :process
    begin
        Wait for 50 ns;
        rst <= '1';
        Wait for 10 ns;
        rst <= '0';
        Wait for 500 ns;
    end process;

    -- gera os valores para a simulação
    stimuli : PROCESS (clock)
    BEGIN
        if rising_edge(clock) THEN
            if(rst = '1') THEN
                entrada <= "0000";
            else
                entrada <= entrada + 1;
            end if;
            
        elsif(entrada = b"1111") THEN
            stop;
        
        end if;
    END PROCESS;

    -- instância da entidade em test (entity under test) EUT
    EUT : codificador_gray
        PORT MAP(
            binario => entrada,
            gray => sig_out
            
        );

END ARCHITECTURE stimulus;
