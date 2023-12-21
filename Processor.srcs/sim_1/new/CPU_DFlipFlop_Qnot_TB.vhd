----------------------------------------------------------------------------------
-- Engineer: Richard Blažek
-- Create Date: 11/27/2023 03:52:38 PM
-- Module Name: CPU_DFlipFlop_Qnot_TB - Simulation
----------------------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;

ENTITY CPU_DFlipFlop_Qnot_TB IS
    -- No ports
END CPU_DFlipFlop_Qnot_TB;

ARCHITECTURE Simulation OF CPU_DFlipFlop_Qnot_TB IS
    COMPONENT CPU_DFlipFlop_Qnot IS
        PORT (
            D, Clock, Reset : IN STD_LOGIC;
            Q, Q_not : OUT STD_LOGIC);
    END COMPONENT;

    SIGNAL D_TB, Clock_TB, Reset_TB, Q_TB, Q_not_TB : STD_LOGIC := '0';
    CONSTANT StudentID : STD_LOGIC_VECTOR := x"154D884";

BEGIN
    uut : CPU_DFlipFlop_Qnot PORT MAP(
        D => D_TB,
        Clock => Clock_TB,
        Reset => Reset_TB,
        Q => Q_TB,
        Q_not => Q_not_TB
    );

    Clock_TB <= NOT Clock_TB AFTER 100ns;

    sim_proc : PROCESS BEGIN
        D_TB <= '0';
        Reset_TB <= '0';
        WAIT FOR 400ns;

        D_TB <= '1';
        Reset_TB <= '0';
        WAIT FOR 400ns;

        D_TB <= '1';
        Reset_TB <= '1';
        WAIT FOR 400ns;

        D_TB <= '0';
        Reset_TB <= '1';
        WAIT FOR 400ns;
    END PROCESS;
END Simulation;