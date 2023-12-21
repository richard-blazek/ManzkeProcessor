----------------------------------------------------------------------------------
-- Engineer: Richard Blažek
-- Create Date: 11/06/2023 01:24:37 PM
-- Module Name: DP_SingleBit_LogicCircuit_TB - Simulation
----------------------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;

ENTITY DP_SingleBit_LogicCircuit_TB IS
    -- No ports for simulation
END DP_SingleBit_LogicCircuit_TB;

ARCHITECTURE Simulation OF DP_SingleBit_LogicCircuit_TB IS
    COMPONENT DP_SingleBit_LogicCircuit IS
        PORT (
            A, B, S0, S1 : IN STD_LOGIC;
            Y : OUT STD_LOGIC);
    END COMPONENT;

    CONSTANT StudentID : STD_LOGIC_VECTOR (27 DOWNTO 0) := x"154D884";
    SIGNAL A_TB, B_TB, S0_TB, S1_TB, Y_TB : STD_LOGIC := '0';

BEGIN
    uut : DP_SingleBit_LogicCircuit PORT MAP(
        A => A_TB,
        B => B_TB,
        S0 => S0_TB,
        S1 => S1_TB,
        Y => Y_TB
    );

    sim_proc : PROCESS
    BEGIN
        -- NOT a
        A_TB <= '0';
        B_TB <= '0';
        S0_TB <= '1';
        S1_TB <= '1';
        WAIT FOR 100ns;

        -- 1 XOR 1
        A_TB <= '1';
        B_TB <= '1';
        S0_TB <= '0';
        S1_TB <= '1';
        WAIT FOR 100ns;

        -- 1 AND 1
        A_TB <= '1';
        B_TB <= '1';
        S0_TB <= '0';
        S1_TB <= '0';
        WAIT FOR 100ns;

        -- 1 AND 0
        A_TB <= '1';
        B_TB <= '0';
        S0_TB <= '0';
        S1_TB <= '0';
        WAIT FOR 100ns;

        -- 1 OR 0
        A_TB <= '1';
        B_TB <= '0';
        S0_TB <= '1';
        S1_TB <= '0';
        WAIT FOR 100ns;

    END PROCESS;

END Simulation;