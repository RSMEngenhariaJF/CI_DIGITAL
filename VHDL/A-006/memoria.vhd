LIBRARY IEEE;
    USE IEEE.std_logic_1164.ALL;
    USE IEEE.std_logic_unsigned.ALL;
    USE IEEE.numeric_std.ALL;
ENTITY meoria IS
    PORT (
            clock   :  IN STD_LOGIC;
            entrada : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
            hab_esc : IN STD_LOGIC;
            ender   : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
            saida   : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
    );
END ENTITY;

ARCHITECTURE rtl OF memoria IS
    SUBTYPE palavra IS STD_LOGIC_VECTOR(7 DOWNTO 0);
    TYPE memoria IS ARRAY(0 TO 15) OF palavra;
    SIGNAL mem_ram : meoria;

    BEGIN
        PROCESS(clock)
        BEGIN
            IF rising_edge(clock) THEN
               IF(hab_esc) THEN
                    mem_ram(to_integer(unsigned(ender))) <= entrada;
               END IF;
               saida <= mem_ram(to_integer(unsigned(ender)));
            END IF;
        END PROCESS;

END ARCHITECTURE rtl;