----------------------------------------------------------------------------------
-- Engineer: Richard Blažek
-- Create Date: 11/07/2023 02:44:34 PM
-- Module Name: DP_Mux3_1Bit_TB - Simulation
----------------------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;

ENTITY DP_Mux3_1Bit_TB IS
    --  No ports
END DP_Mux3_1Bit_TB;

ARCHITECTURE Simulation OF DP_Mux3_1Bit_TB IS
    COMPONENT DP_Mux3_1Bit IS
        PORT (
            I0, I1, I2, S0, S1 : IN STD_LOGIC;
            Y : OUT STD_LOGIC);
    END COMPONENT;

    SIGNAL I0_TB, I1_TB, I2_TB, Y_TB, S0_TB, S1_TB : STD_LOGIC;
    CONSTANT StudentID : STD_LOGIC_VECTOR (27 DOWNTO 0) := x"154D884";

BEGIN
    uut : DP_Mux3_1Bit PORT MAP(I0 => I0_TB, I1 => I1_TB, I2 => I2_TB, S0 => S0_TB, S1 => S1_TB, Y => Y_TB);

    sim_proc : PROCESS BEGIN
        I0_TB <= '1';
        I1_TB <= '0';
        I2_TB <= '1';
        S0_TB <= '0';
        S1_TB <= '0';
        WAIT FOR 100ns;

        I0_TB <= '1';
        I1_TB <= '0';
        I2_TB <= '1';
        S0_TB <= '0';
        S1_TB <= '1';
        WAIT FOR 100ns;

        I0_TB <= '1';
        I1_TB <= '0';
        I2_TB <= '1';
        S0_TB <= '1';
        S1_TB <= '0';
        WAIT FOR 100ns;

        I0_TB <= '0';
        I1_TB <= '1';
        I2_TB <= '1';
        S0_TB <= '1';
        S1_TB <= '1';
        WAIT FOR 100ns;
    END PROCESS;

END Simulation;