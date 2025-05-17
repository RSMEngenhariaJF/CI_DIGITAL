LIBRARY IEEE;
    USE IEEE.std_logic_1164.ALL;
    USE IEEE.numeric_std.ALL;
  
ENTITY testbench IS
END ENTITY testbench;
  
ARCHITECTURE stimulus OF testbench IS
    -- component a ser instanciado
    COMPONENT real_time_clock IS
        GENERIC(
            clock_frequency_Hz          : integer
        );
        PORT(
            clk                             : IN std_logic;
            rst                             : IN std_logic;
            set                             : IN std_logic;
            init_hour                       : IN integer;
            init_minute                     : IN integer;
            init_second                     : IN integer;
            init_dia                        : IN integer;
            init_mes                        : IN integer;
            init_ano                        : IN integer;
            ano                             : OUT integer;
            mes                             : OUT integer; 
            dia                             : OUT integer;
            hour                            : OUT integer;
            minute                          : OUT integer;
            second                          : OUT integer
        );
    END COMPONENT real_time_clock;

    -- sinais da testbench
    SIGNAL tb_clk, tb_rst               : std_logic := '1';
    SIGNAL tb_set                       : std_logic := '0';
    SIGNAL tb_hour                      : integer;
    SIGNAL tb_minute                    : integer;
    SIGNAL tb_second                    : integer;
    SIGNAL tb_dia                       : integer;
    SIGNAL tb_mes                       : integer;
    SIGNAL tb_ano                       : integer;
    
  
    -- configurações de simulação
    CONSTANT clock_frequency            : integer := 2;--20
    CONSTANT clock_period               : time := 5 ns;--5
    
BEGIN
  
    -- instancia do timer - DUT
    timer_instance : real_time_clock
    GENERIC MAP (
        clock_frequency_Hz          => clock_frequency
    )
    PORT MAP (
        clk                         => tb_clk,
        rst                         => tb_rst,
        set                         => tb_set,
        init_hour                   => 21,
        init_minute                 => 30,
        init_second                 => 23,
        init_dia                    => 29,
        init_mes                    => 04,
        init_ano                    => 2025,
        ano                         => tb_ano,
        mes                         => tb_mes, 
        dia                         => tb_dia,
        hour                        => tb_hour,
        minute                      => tb_minute,
        second                      => tb_second 
    );
    

    -- gerar o clock da simulação
    PROCESS 
    BEGIN
        WAIT FOR clock_period/2;
        tb_clk <= NOT tb_clk;
    END PROCESS;

    -- gerar o reset e o set será feito após 300 pulsos
    PROCESS(tb_clk)
        VARIABLE count_clock_pulse      : integer RANGE 0 TO 600000 := 0;
    BEGIN
        IF rising_edge(tb_clk) THEN
            count_clock_pulse := count_clock_pulse + 1;
            IF (count_clock_pulse - 1 = 2) THEN -- tira o reset no 2° pulso de clock
                tb_rst <= '0';
            ELSIF (count_clock_pulse - 1 = 300) THEN -- manda o set no 300° pulso de clock
                tb_set <= '1';
            ELSIF (count_clock_pulse - 1 = 301) THEN -- zera o set no 301° pulso de clock
                tb_set <= '0';
            END IF;
        END IF;
    END PROCESS;
END ARCHITECTURE;
