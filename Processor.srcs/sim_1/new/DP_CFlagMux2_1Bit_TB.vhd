----------------------------------------------------------------------------------
-- Engineer: Richard Blažek
-- Create Date: 11/08/2023 05:23:50 PM
-- Module Name: DP_CFlagMux2_1Bit_TB - Simulation
----------------------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;

ENTITY DP_CFlagMux2_1Bit_TB IS
    -- No ports
END DP_CFlagMux2_1Bit_TB;

ARCHITECTURE Simulation OF DP_CFlagMux2_1Bit_TB IS
    CONSTANT StudentID : STD_LOGIC_VECTOR (27 DOWNTO 0) := x"154D884";

    COMPONENT DP_CFlagMux2_1Bit IS
        PORT (
            I0, I1, S : IN STD_LOGIC;
            Y : OUT STD_LOGIC);
    END COMPONENT;

    SIGNAL I0_TB, I1_TB, S_TB, Y_TB : STD_LOGIC;

BEGIN
    uut : DP_CFlagMux2_1Bit PORT MAP(I0 => I0_TB, I1 => I1_TB, S => S_TB, Y => Y_TB);

    proc_sim : PROCESS BEGIN

        I0_TB <= '0';
        I1_TB <= '1';
        S_TB <= '0';
        WAIT FOR 100ns;

        I0_TB <= '0';
        I1_TB <= '1';
        S_TB <= '1';
        WAIT FOR 100ns;

        I0_TB <= '1';
        I1_TB <= '0';
        S_TB <= '0';
        WAIT FOR 100ns;

        I0_TB <= '1';
        I1_TB <= '0';
        S_TB <= '1';
        WAIT FOR 100ns;

    END PROCESS;
END Simulation;