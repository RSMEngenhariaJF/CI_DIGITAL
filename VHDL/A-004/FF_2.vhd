USE IEEE.std_logic_1164.ALL;

ENTITY FF_2 IS
    PORT(
        D : IN STD_LOGIC;
        clk : IN STD_LOGIC;
        Q    : OUT STD_LOGIC
    );
END ENTITY;

ARCHITECTURE behavioural OF FF_2 IS
   signal_ff : std_logic;
BEGIN

    process (clk)
        variable A : std_logic;
    begin
        if rising_edge(clk) then
            A := D;   
        end if;
        signal_ff <= A;
    end process;
    Q<= signal_ff;
END ARCHITECTURE behavioural;