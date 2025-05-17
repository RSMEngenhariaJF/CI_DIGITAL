LIBRARY IEEE;
    USE IEEE.std_logic_1164.ALL;
LIBRARY std;
    USE std.env.ALL; --PARA USAR O STOP DA SIMULAÇÃO

entity tb_and is
end entity;

architecture stimulus of tb_and is
    COMPONENT porta_AND IS
    PORT (
            entrada : IN std_logic_vector;
            saida : OUT std_logic
    );
END COMPONENT porta_AND; 

signal A : std_logic_vector(10 downto 0);
signal Y : std_logic;


begin
    stimuli : PROCESS
    BEGIN
        A <= "00000001000";
        WAIT FOR 10 ns;
        A <= "11111111111";
        WAIT FOR 10 ns;
        A <= "11111111110";
        WAIT FOR 10 ns;
        
        stop;
    END PROCESS;
    EUT :  porta_AND
    PORT MAP (
            entrada => A,
            saida => Y
    );

end architecture;


