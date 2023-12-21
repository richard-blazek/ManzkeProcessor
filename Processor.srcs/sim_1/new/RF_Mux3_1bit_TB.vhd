----------------------------------------------------------------------------------
-- Engineer: Richard Blažek 
-- Create Date: 10/18/2023 05:28:47 PM
-- Module Name: RF_Mux3_1bit_TB - Simulation
----------------------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;

ENTITY RF_Mux3_1bit_TB IS
    --  Ports not needed for simulation
END RF_Mux3_1bit_TB;

ARCHITECTURE Simulation OF RF_Mux3_1bit_TB IS
    COMPONENT RF_Mux3_1bit IS
        PORT (
            I0, I1, I2 : IN STD_LOGIC;
            S : IN STD_LOGIC_VECTOR (1 DOWNTO 0);
            Y : OUT STD_LOGIC);
    END COMPONENT;

    CONSTANT StudentID : STD_LOGIC_VECTOR (27 DOWNTO 0) := x"154D884";
    CONSTANT Delay : TIME := 200 ns;

    SIGNAL I0_TB, I1_TB, I2_TB, Y_TB : STD_LOGIC := '0';
    SIGNAL S_TB : STD_LOGIC_VECTOR (1 DOWNTO 0) := "00";

BEGIN
    -- Instantiate the Unit Under Test (UUT)
    uut : RF_Mux3_1bit PORT MAP(
        I0 => I0_TB,
        I1 => I1_TB,
        I2 => I2_TB,
        S => S_TB,
        Y => Y_TB
    );

    stim_proc : PROCESS
    BEGIN
        S_TB <= "00"; -- Case A
        I2_TB <= '1';
        WAIT FOR Delay;
        I2_TB <= '0'; -- Case B
        I0_TB <= '1';
        WAIT FOR Delay;

        S_TB <= "01"; -- Case C
        I0_TB <= '0';
        I2_TB <= '1';
        WAIT FOR Delay;
        I2_TB <= '0'; -- Case D
        I1_TB <= '1';
        WAIT FOR Delay;

        S_TB <= "10"; -- Case E   
        I1_TB <= '0';
        I0_TB <= '1';
        WAIT FOR Delay;
        I0_TB <= '0'; -- Case F
        I2_TB <= '1';
        WAIT FOR Delay;

        S_TB <= "11"; -- Case G
        I0_TB <= '1';
        I1_TB <= '1';
        I2_TB <= '1';
        WAIT FOR Delay;
    END PROCESS;

END Simulation;