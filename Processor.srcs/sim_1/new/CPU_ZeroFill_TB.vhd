----------------------------------------------------------------------------------
-- Engineer: Richard Blažek
-- Create Date: 11/28/2023 03:44:25 PM
-- Module Name: CPU_ZeroFill_TB - Simulation
----------------------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;

ENTITY CPU_ZeroFill_TB IS
    -- No ports
END CPU_ZeroFill_TB;

ARCHITECTURE Simulation OF CPU_ZeroFill_TB IS
    COMPONENT CPU_ZeroFill IS
        PORT (
            Input : IN STD_LOGIC_VECTOR (4 DOWNTO 0);
            Output : OUT STD_LOGIC_VECTOR (31 DOWNTO 0));
    END COMPONENT;

    SIGNAL Input_TB : STD_LOGIC_VECTOR (4 DOWNTO 0);
    SIGNAL Output_TB : STD_LOGIC_VECTOR (31 DOWNTO 0);
    CONSTANT StudentID : STD_LOGIC_VECTOR := x"154D884";

BEGIN
    uut : CPU_ZeroFill PORT MAP(Input => Input_TB, Output => Output_TB);

    ps : PROCESS BEGIN
        Input_TB <= "00000";
        WAIT FOR 2000ns;

        Input_TB <= "10101";
        WAIT FOR 2000ns;
    END PROCESS;
END Simulation;