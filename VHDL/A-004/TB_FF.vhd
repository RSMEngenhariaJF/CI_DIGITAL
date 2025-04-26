LIBRARY IEEE;
    USE IEEE.std_logic_1164.ALL;
LIBRARY IEEE;
    USE IEEE.STD_LOGIC_SIGNED.ALL;

LIBRARY std;
    USE std.env.ALL; --PARA USAR O STOP DA SIMULAÇÃO

ENTITY teste_FF_1 IS
END ENTITY teste_FF_1;

ARCHITECTURE stimulus OF teste_FF_1 IS

    -- componente que iremos testar
    COMPONENT FF_1 IS
    PORT(
        D : IN STD_LOGIC;
        clk : IN STD_LOGIC;
        Q    : OUT STD_LOGIC;
        Q2    : OUT STD_LOGIC
    );
    END COMPONENT;

    SIGNAL entrada :std_logic := '0';
    SIGNAL sig_out1 : std_logic := '0';
    SIGNAL sig_out2 : std_logic :='0';
    CONSTANT period : time := 10 ns;
    SIGNAL clock : std_logic := '1';
   

BEGIN
    pulsos:process
    begin
        WAIT FOR period/2;
        clock <= NOT clock;
    end process;

    varia :process
    begin
        Wait for 50 ns;
        entrada <= '1';
        Wait for 60 ns;
        entrada <= '0';
        Wait for 40 ns;
    end process;

    

    -- instância da entidade em test (entity under test) EUT
    EUT : FF_1
        PORT MAP(
            D => entrada,
            clk => clock,
            Q   => sig_out1,  
            Q2    => sig_out2
        );

END ARCHITECTURE stimulus;
