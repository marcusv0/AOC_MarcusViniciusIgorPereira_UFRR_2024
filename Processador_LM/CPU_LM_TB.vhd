LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

ENTITY CPU_LM_TB IS
END CPU_LM_TB;

ARCHITECTURE BEHAVIORAL OF CPU_LM_TB IS
    SIGNAL CLK_TB            : STD_LOGIC := '0';
    SIGNAL PC_OUT_TB         : STD_LOGIC_VECTOR(7 DOWNTO 0);
    SIGNAL ROM_OUT_TB        : STD_LOGIC_VECTOR(7 DOWNTO 0);
    SIGNAL OPCODE_OUT_TB     : STD_LOGIC_VECTOR(3 DOWNTO 0);
    SIGNAL RS_OUT_TB         : STD_LOGIC_VECTOR(1 DOWNTO 0);
    SIGNAL RT_OUT_TB         : STD_LOGIC_VECTOR(1 DOWNTO 0);
    SIGNAL ADDRESS_OUT_TB    : STD_LOGIC_VECTOR(3 DOWNTO 0);
    SIGNAL R_A_OUT_TB        : STD_LOGIC_VECTOR(7 DOWNTO 0);
    SIGNAL R_B_OUT_TB        : STD_LOGIC_VECTOR(7 DOWNTO 0);
    SIGNAL ALU_RESULT_OUT_TB : STD_LOGIC_VECTOR(7 DOWNTO 0);
    SIGNAL ALU_OVERFLOW_OUT_TB : STD_LOGIC;
    SIGNAL RAM_OUT_TB        : STD_LOGIC_VECTOR(7 DOWNTO 0);
    SIGNAL MUX_2_OUT_TB      : STD_LOGIC_VECTOR(7 DOWNTO 0);

    CONSTANT CLK_PERIOD : TIME := 10 ns;

BEGIN
    DUT : ENTITY work.CPU_LM
        PORT MAP(
            CLOCK            => CLK_TB,
            PC_OUT           => PC_OUT_TB,
            ROM_OUT          => ROM_OUT_TB,
            OPCODE_OUT       => OPCODE_OUT_TB,
            RS_OUT           => RS_OUT_TB,
            RT_OUT           => RT_OUT_TB,
            ADDRESS_OUT      => ADDRESS_OUT_TB,
            R_A_OUT          => R_A_OUT_TB,
            R_B_OUT          => R_B_OUT_TB,
            ALU_RESULT_OUT   => ALU_RESULT_OUT_TB,
            ALU_OVERFLOW_OUT => ALU_OVERFLOW_OUT_TB,
            RAM_OUT          => RAM_OUT_TB,
            MUX_2_OUT        => MUX_2_OUT_TB
        );

    CLK_PROCESS : PROCESS
    BEGIN
        WHILE NOW < 1000 ns LOOP
            CLK_TB <= '0';
            WAIT FOR CLK_PERIOD/2;
            CLK_TB <= '1';
            WAIT FOR CLK_PERIOD/2;
        END LOOP;
        WAIT;
    END PROCESS;

    STIMULUS_PROCESS : PROCESS
    BEGIN
        WAIT FOR 100 ns;

        WAIT FOR 400 ns;

        ASSERT FALSE REPORT "Simulação concluída" SEVERITY FAILURE;
    END PROCESS;

END BEHAVIORAL;