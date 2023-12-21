----------------------------------------------------------------------------------
-- Engineer: Richard Blažek
-- Create Date: 11/04/2023 11:06:53 AM
-- Module Name: DP_SingleBit_B_Logic_TB - Simulation
----------------------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;

ENTITY DP_SingleBit_B_Logic_TB IS
    -- No ports
END DP_SingleBit_B_Logic_TB;

ARCHITECTURE Simulation OF DP_SingleBit_B_Logic_TB IS
    COMPONENT DP_SingleBit_B_Logic IS
        PORT (
            B, S0, S1 : IN STD_LOGIC;
            Y : OUT STD_LOGIC);
    END COMPONENT;

    CONSTANT StudentID : STD_LOGIC_VECTOR (27 DOWNTO 0) := x"154D884";

    SIGNAL B_TB, S0_TB, S1_TB, Y_TB : STD_LOGIC;

BEGIN
    uut : DP_SingleBit_B_Logic PORT MAP(B => B_TB, S0 => S0_TB, S1 => S1_TB, Y => Y_TB);

    sim_proc : PROCESS
    BEGIN

        B_TB <= '0';
        S0_TB <= '0';
        S1_TB <= '0';
        WAIT FOR 100ns;

        B_TB <= '0';
        S0_TB <= '0';
        S1_TB <= '1';
        WAIT FOR 100ns;

        B_TB <= '1';
        S0_TB <= '0';
        S1_TB <= '1';
        WAIT FOR 100ns;

        B_TB <= '0';
        S0_TB <= '1';
        S1_TB <= '0';
        WAIT FOR 100ns;

        B_TB <= '0';
        S0_TB <= '1';
        S1_TB <= '1';
        WAIT FOR 100ns;

        B_TB <= '1';
        S0_TB <= '0';
        S1_TB <= '0';
        WAIT FOR 100ns;

        B_TB <= '1';
        S0_TB <= '1';
        S1_TB <= '0';
        WAIT FOR 100ns;

        B_TB <= '1';
        S0_TB <= '1';
        S1_TB <= '1';
        WAIT FOR 100ns;
    END PROCESS;

END Simulation;