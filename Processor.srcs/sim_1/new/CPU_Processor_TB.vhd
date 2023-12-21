----------------------------------------------------------------------------------
-- Engineer: Richard Blažek
-- Create Date: 12/07/2023 02:18:14 PM
-- Module Name: CPU_Processor_TB - Simulation
----------------------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;

ENTITY CPU_Processor_TB IS
    -- Kein Port
END CPU_Processor_TB;

ARCHITECTURE Simulation OF CPU_Processor_TB IS
    COMPONENT CPU_Processor IS
        PORT (Clock, Reset : IN STD_LOGIC);
    END COMPONENT;

    SIGNAL Clock, Reset : STD_LOGIC := '0';

BEGIN
    uut : CPU_Processor PORT MAP(Clock => Clock, Reset => Reset);

    Clock <= NOT Clock AFTER 5000ns;

    ps : PROCESS BEGIN
        Reset <= '1';
        WAIT FOR 10000ns;

        Reset <= '0';
        WAIT FOR (10000ns * 1000);

    END PROCESS;

END Simulation;