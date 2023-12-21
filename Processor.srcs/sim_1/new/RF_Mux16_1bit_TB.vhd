----------------------------------------------------------------------------------
-- Engineer: Richard Blažek
-- Create Date: 10/07/2023 11:41:19 AM
-- Module Name: RF_Mux16_1bit_TB - Simulation
----------------------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;

ENTITY RF_Mux16_1bit_TB IS
    -- No ports needed
END RF_Mux16_1bit_TB;

ARCHITECTURE Simulation OF RF_Mux16_1bit_TB IS
    -- Input signals
    SIGNAL I0_TB, I1_TB, I2_TB, I3_TB, I4_TB, I5_TB, I6_TB, I7_TB : STD_LOGIC := '0';
    SIGNAL I8_TB, I9_TB, I10_TB, I11_TB, I12_TB, I13_TB, I14_TB, I15_TB : STD_LOGIC := '0';
    SIGNAL S_TB : STD_LOGIC_VECTOR (3 DOWNTO 0) := b"0000";

    -- Output Signal   
    SIGNAL Y_TB : STD_LOGIC := '0';

    -- StudentID e.g. 22 337 668(DEC) = 154 D884(HEX)
    CONSTANT StudentID : STD_LOGIC_VECTOR (27 DOWNTO 0) := x"154D884";

    CONSTANT Delay : TIME := 200 ns;

    COMPONENT RF_Mux16_1bit
        PORT (
            I0, I1, I2, I3, I4, I5, I6, I7 : IN STD_LOGIC;
            I8, I9, I10, I11, I12, I13, I14, I15 : IN STD_LOGIC;
            S : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
            Y : OUT STD_LOGIC);
    END COMPONENT;

BEGIN
    -- Instantiate the Unit Under Test (UUT)
    uut : RF_Mux16_1bit PORT MAP(
        I0 => I0_TB,
        I1 => I1_TB,
        I2 => I2_TB,
        I3 => I3_TB,
        I4 => I4_TB,
        I5 => I5_TB,
        I6 => I6_TB,
        I7 => I7_TB,
        I8 => I8_TB,
        I9 => I9_TB,
        I10 => I10_TB,
        I11 => I11_TB,
        I12 => I12_TB,
        I13 => I13_TB,
        I14 => I14_TB,
        I15 => I15_TB,
        S => S_TB,
        Y => Y_TB
    );

    stim_proc : PROCESS
    BEGIN
        S_TB <= "0000"; -- Case A
        I7_TB <= '1';
        WAIT FOR Delay;
        I7_TB <= '0'; -- Case B
        I0_TB <= '1';
        WAIT FOR Delay;

        S_TB <= "1000"; -- Case C
        I0_TB <= '0';
        I14_TB <= '1';
        WAIT FOR Delay;
        I14_TB <= '0'; -- Case D
        I8_TB <= '1';
        WAIT FOR Delay;

        S_TB <= "0100"; -- Case E   
        I8_TB <= '0';
        I12_TB <= '1';
        WAIT FOR Delay;
        I12_TB <= '0'; -- Case F
        I4_TB <= '1';
        WAIT FOR Delay;

        S_TB <= "1001"; -- Case G   
        I2_TB <= '0';
        I4_TB <= '1';
        WAIT FOR Delay;
        I4_TB <= '0'; -- Case H
        I9_TB <= '1';
        WAIT FOR Delay;
    END PROCESS;
END Simulation;