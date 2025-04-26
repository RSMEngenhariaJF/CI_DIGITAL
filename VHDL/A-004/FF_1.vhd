LIBRARY IEEE;
    USE IEEE.std_logic_1164.ALL;

ENTITY FF_1 IS
    PORT(
        D : IN STD_LOGIC;
        clk : IN STD_LOGIC;
        Q    : OUT STD_LOGIC;
        Q2    : OUT STD_LOGIC
    );
END ENTITY;

ARCHITECTURE behavioural OF FF_1 IS
   
BEGIN

    process (clk)
        variable A : std_logic;
    begin
        if rising_edge(clk) then
            
            Q <= D;
            A:= D;
        end if;
        Q2 <= A;
    end process;
END ARCHITECTURE behavioural;