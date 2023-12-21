----------------------------------------------------------------------------------
-- Engineer: Richard Blažek
-- Create Date: 11/08/2023 05:50:04 PM
-- Module Name: DP_ZeroDetection_TB - Simulation
----------------------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;

ENTITY DP_ZeroDetection_TB IS
    --  Es is nur eine Simulation
END DP_ZeroDetection_TB;

ARCHITECTURE Simulation OF DP_ZeroDetection_TB IS
    CONSTANT StudentID : STD_LOGIC_VECTOR (27 DOWNTO 0) := x"154D884";

    COMPONENT DP_ZeroDetection IS
        PORT (
            I : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
            Z : OUT STD_LOGIC);
    END COMPONENT;

    SIGNAL I_TB : STD_LOGIC_VECTOR (31 DOWNTO 0);
    SIGNAL Z_TB : STD_LOGIC;

BEGIN
    uut : DP_ZeroDetection PORT MAP(I => I_TB, Z => Z_TB);

    proc_sim : PROCESS BEGIN
        I_TB <= x"22337668";
        WAIT FOR 100ns;

        I_TB <= x"00000000";
        WAIT FOR 100ns;

        I_TB <= x"00010000";
        WAIT FOR 100ns;

        I_TB <= x"00000060";
        WAIT FOR 100ns;
    END PROCESS;
END Simulation;