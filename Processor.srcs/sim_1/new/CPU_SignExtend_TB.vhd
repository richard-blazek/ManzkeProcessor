----------------------------------------------------------------------------------
-- Engineer: Richard Blažek
-- Create Date: 11/29/2023 12:17:02 PM
-- Module Name: CPU_SignExtend_TB - Simulation
----------------------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;

ENTITY CPU_SignExtend_TB IS
    -- No ports needed
END CPU_SignExtend_TB;

ARCHITECTURE Simulation OF CPU_SignExtend_TB IS
    COMPONENT CPU_SignExtend IS
        PORT (
            Input : IN STD_LOGIC_VECTOR (9 DOWNTO 0);
            Output : OUT STD_LOGIC_VECTOR (31 DOWNTO 0));
    END COMPONENT;

    SIGNAL Input_TB : STD_LOGIC_VECTOR (9 DOWNTO 0);
    SIGNAL Output_TB : STD_LOGIC_VECTOR (31 DOWNTO 0);

BEGIN
    uut : CPU_SignExtend PORT MAP(Input => Input_TB, Output => Output_TB);

    ps : PROCESS BEGIN

        Input_TB <= "0100000000";
        WAIT FOR 2000ns;
        Input_TB <= "1100000000";
        WAIT FOR 2000ns;
    END PROCESS;

END Simulation;