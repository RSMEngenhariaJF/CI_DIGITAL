--NESTA ATIVIDADE REALIZAREMOS A CRIAÇÃO DE UMA PORTA AND GENERICA DE N ENTRADAS.
LIBRARY IEEE;
    USE IEEE.std_logic_1164.all;

ENTITY porta_AND IS
    PORT (
            entrada : IN std_logic_vector;
            saida : OUT std_logic
    );
END ENTITY porta_AND;
ARCHITECTURE behavioral OF porta_AND is
    
BEGIN
    
    PROCESS (entrada)
    variable aux :std_logic := '1'; 
    BEGIN
        aux := '1';
        for i in entrada'range loop
            aux := aux and entrada(i);
        end loop; 
        saida <= aux;
    END PROCESS;
    
END ARCHITECTURE behavioral;