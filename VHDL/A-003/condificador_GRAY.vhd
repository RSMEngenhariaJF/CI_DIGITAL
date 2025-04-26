LIBRARY IEEE;
    USE IEEE.std_logic_1164.ALL;

ENTITY codificador_gray IS
    PORT(
        binario : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
        gray    : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
    );
END ENTITY;

ARCHITECTURE behavioural OF codificador_gray IS
BEGIN

        WITH binario SELECT
            gray <= b"0000" WHEN b"0000",
                    b"0001" WHEN b"0001",
                    b"0011" WHEN b"0010",
                    b"0010" WHEN b"0011",
                    b"0110" WHEN b"0100",
                    b"0111" WHEN b"0101",
                    b"0101" WHEN b"0110",
                    b"0100" WHEN b"0111",
                    b"1100" WHEN b"1000",                       
                    b"1101" WHEN b"1001",                       
                    b"1111" WHEN b"1010",                       
                    b"1110" WHEN b"1011",                       
                    b"1010" WHEN b"1100",                       
                    b"1011" WHEN b"1101",                       
                    b"1001" WHEN b"1110",                       
                    b"1000" WHEN OTHERS;
        
END ARCHITECTURE behavioural;