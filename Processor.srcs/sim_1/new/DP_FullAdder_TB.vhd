----------------------------------------------------------------------------------
-- Engineer: Richard Blažek 
-- Create Date: 11/03/2023 09:44:20 AM
-- Module Name: DP_FullAdder_TB - Simulation
----------------------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;

ENTITY DP_FullAdder_TB IS
    -- No ports
END DP_FullAdder_TB;

ARCHITECTURE Simulation OF DP_FullAdder_TB IS
    COMPONENT DP_FullAdder IS
        PORT (
            X, Y, Z : IN STD_LOGIC;
            S, C : OUT STD_LOGIC);
    END COMPONENT;

    CONSTANT StudentID : STD_LOGIC_VECTOR (27 DOWNTO 0) := x"154D884";

    SIGNAL X_TB, Y_TB, Z_TB, S_TB, C_TB : STD_LOGIC;

BEGIN
    uut : DP_FullAdder PORT MAP(X => X_TB, Y => Y_TB, Z => Z_TB, S => S_TB, C => C_TB);

    sim_proc : PROCESS
    BEGIN
        X_TB <= '0';
        Y_TB <= '0';
        Z_TB <= '1';
        WAIT FOR 100ns;

        X_TB <= '0';
        Y_TB <= '1';
        Z_TB <= '0';
        WAIT FOR 100ns;

        X_TB <= '0';
        Y_TB <= '1';
        Z_TB <= '1';
        WAIT FOR 100ns;

        X_TB <= '1';
        Y_TB <= '0';
        Z_TB <= '0';
        WAIT FOR 100ns;

        X_TB <= '1';
        Y_TB <= '0';
        Z_TB <= '1';
        WAIT FOR 100ns;

        X_TB <= '1';
        Y_TB <= '1';
        Z_TB <= '0';
        WAIT FOR 100ns;

        X_TB <= '1';
        Y_TB <= '1';
        Z_TB <= '1';
        WAIT FOR 100ns;

        X_TB <= '0';
        Y_TB <= '0';
        Z_TB <= '0';
        WAIT FOR 100ns;
    END PROCESS;
END Simulation;