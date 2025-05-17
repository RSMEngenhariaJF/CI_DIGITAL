LIBRARY IEEE;
    USE IEEE.std_logic_1164.ALL;
    USE IEEE.numeric_std.ALL;

ENTITY single_port_memory IS
    PORT (
        clk                     : IN std_logic;
        data                    : IN std_logic_vector;
        we                      : IN std_logic;
        addr                    : IN std_logic_vector;
        q                       : OUT std_logic_vector
    );
END ENTITY single_port_memory;

ARCHITECTURE rtl OF single_port_memory IS
    -- Tipo 2D array para criar memorias RAM 16x8
    SUBTYPE word IS std_logic_vector(data'length-1 DOWNTO 0);
    TYPE mem_type IS ARRAY(0 TO 2**addr'length-1) OF word;
    -- Declara o sinal RAM que tem o meu tipo memoria
    SIGNAL ram                  : mem_type;
BEGIN
    PROCESS(clk)
    BEGIN   
        IF rising_edge(clk) THEN
            IF (we = '1') THEN
                ram(to_integer(unsigned(addr))) <= data;
            END IF;
            q <= ram(to_integer(unsigned(addr)));
        END IF;
    END PROCESS;
END ARCHITECTURE rtl;