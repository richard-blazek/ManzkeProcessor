----------------------------------------------------------------------------------
-- Engineer: Richard Blažek
-- Create Date: 11/27/2023 05:01:22 PM
-- Module Name: CPU_JKFlipFlop_TB - Simulation
----------------------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;

ENTITY CPU_JKFlipFlop_TB IS
    -- No ports
END CPU_JKFlipFlop_TB;

ARCHITECTURE Simulation OF CPU_JKFlipFlop_TB IS
    COMPONENT CPU_JKFlipFlop IS
        PORT (
            J, K, Clock, Reset : IN STD_LOGIC;
            Q, Q_not : OUT STD_LOGIC);
    END COMPONENT;

    SIGNAL J_TB, K_TB, Clock_TB, Reset_TB, Q_TB, Q_not_TB : STD_LOGIC := '0';

BEGIN
    uut : CPU_JKFlipFlop PORT MAP(
        J => J_TB,
        K => K_TB,
        Clock => Clock_TB,
        Reset => Reset_TB,
        Q => Q_TB,
        Q_not => Q_not_TB
    );

    Clock_TB <= NOT Clock_TB AFTER 100ns;

    proc_sim : PROCESS BEGIN

        J_TB <= '0';
        K_TB <= '1';
        WAIT FOR 400ns;

        J_TB <= '1';
        K_TB <= '0';
        WAIT FOR 400ns;

        J_TB <= '0';
        K_TB <= '0';
        WAIT FOR 400ns;

        J_TB <= '1';
        K_TB <= '1';
        WAIT FOR 400ns;

    END PROCESS;
END Simulation;