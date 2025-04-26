LIBRARY IEEE;
    USE IEEE.std_logic_1164.ALL;
    USE IEEE.STD_LOGIC_UNSIGNED.ALL;
    USE IEEE.numeric_std.ALL;

ENTITY var_vs_signal IS
    PORT(
        clk                     : IN std_logic;
        rst                     : IN std_logic;
        signal_cnt              : OUT std_logic_vector(2 DOWNTO 0) := (OTHERS => '0');
        variable_cnt            : OUT std_logic_vector(2 DOWNTO 0) := (OTHERS => '0')
    );
END ENTITY;

ARCHITECTURE behavioural OF var_vs_signal IS
    SIGNAL tipo_1 : signed (2 DOWNTO 0);
    SIGNAL tipo_2 : unsigned (2 DOWNTO 0);
    SIGNAL tipo_3 : integer RANGE 0 TO 7;
    SIGNAL tipo_4 : natural RANGE 0 TO 7;


    SIGNAL signal_counter       : std_logic_vector(2 DOWNTO 0);
BEGIN

    PROCESS(clk, rst)
        VARIABLE variable_counter : std_logic_vector(2 DOWNTO 0);
    BEGIN
        IF rst='1' THEN 
            variable_counter := "000";
            --signal_counter <= "000";
            tipo_1 <="000";
            tipo_2 <="000";
            tipo_3 <= 0;
            tipo_4 <=0;
        ELSIF rising_edge(clk) THEN
            variable_counter := variable_counter + 1;
            --signal_counter <= signal_counter + 1;
            --tipo_2 <= tipo_2 + 1;
            tipo_4 <= tipo_4 + 1;
            -- atribuição para a saída 1
            variable_cnt <= variable_counter;
            --signal_cnt <= signal_counter;
            --signal_cnt <= STD_LOGIC_VECTOR(tipo_2);
            --signal_cnt <= std_logic_vector(to_unsigned(tipo_3,3));
            signal_cnt <= std_logic_vector(to_unsigned(tipo_4,3));
            --signal_cnt <= STD_LOGIC_VECTOR(tipo_1);
        END IF;
        -- atribuição para a saída 2t
        -- variable_cnt <= variable_counter;
        -- signal_cnt <= signal_counter;
    END PROCESS;
    -- atribuição para a saída 3
    -- signal_cnt <= signal_counter;
END ARCHITECTURE;