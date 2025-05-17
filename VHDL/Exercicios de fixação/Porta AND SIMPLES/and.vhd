--NESTA ATIVIDADE REALIZAREMOS A CRIAÇÃO DE UMA PORTA AND GENERICA DE N ENTRADAS.
LIBRARY IEEE;
    USE IEEE.std_logic_1164.all;

ENTITY porta_AND IS
    PORT (
            entrada : std_logic_vector;
            saida : std_logic
    );
END ENTITY porta_AND;
ARCHITECTURE behavioral OF porta_AND is
    variable aux : std_logic := '1';
    PROCESS (entrada)
        begin
            for i in data'range loop
                aux := aux and data(i);
            end loop; 
        end 
    saida <= std_logic(aux);
    END PROCESS;
    
END ARCHITECTURE behavioral;