----------------------------------------------------------------------------------
-- Engineer: Richard Blažek 
-- Create Date: 10/07/2023 10:03:40 AM
-- Module Name: RF_Mux32_1bit_TB - Simulation
----------------------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;

ENTITY RF_Mux32_1bit_TB IS
    --  Ports not needed for simulation
END RF_Mux32_1bit_TB;

ARCHITECTURE Simulation OF RF_Mux32_1bit_TB IS
    -- Input signals
    SIGNAL I0_TB, I1_TB, I2_TB, I3_TB, I4_TB, I5_TB, I6_TB, I7_TB : STD_LOGIC := '0';
    SIGNAL I8_TB, I9_TB, I10_TB, I11_TB, I12_TB, I13_TB, I14_TB, I15_TB : STD_LOGIC := '0';
    SIGNAL I16_TB, I17_TB, I18_TB, I19_TB, I20_TB, I21_TB, I22_TB, I23_TB : STD_LOGIC := '0';
    SIGNAL I24_TB, I25_TB, I26_TB, I27_TB, I28_TB, I29_TB, I30_TB, I31_TB : STD_LOGIC := '0';
    SIGNAL S_TB : STD_LOGIC_VECTOR (4 DOWNTO 0) := b"00000";

    -- Output Signal   
    SIGNAL Y_TB : STD_LOGIC := '0';

    -- StudentID e.g. 22 337 668(DEC) = 154 D884(HEX)
    CONSTANT StudentID : STD_LOGIC_VECTOR (27 DOWNTO 0) := x"154D884";

    CONSTANT Delay : TIME := 200 ns;

    COMPONENT RF_Mux32_1bit
        PORT (
            I0, I1, I2, I3, I4, I5, I6, I7 : IN STD_LOGIC;
            I8, I9, I10, I11, I12, I13, I14, I15 : IN STD_LOGIC;
            I16, I17, I18, I19, I20, I21, I22, I23 : IN STD_LOGIC;
            I24, I25, I26, I27, I28, I29, I30, I31 : IN STD_LOGIC;
            S : IN STD_LOGIC_VECTOR (4 DOWNTO 0);
            Y : OUT STD_LOGIC);
    END COMPONENT;

BEGIN
    -- Instantiate the Unit Under Test (UUT)
    uut : RF_Mux32_1bit PORT MAP(
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
        I16 => I16_TB,
        I17 => I17_TB,
        I18 => I18_TB,
        I19 => I19_TB,
        I20 => I20_TB,
        I21 => I21_TB,
        I22 => I22_TB,
        I23 => I23_TB,
        I24 => I24_TB,
        I25 => I25_TB,
        I26 => I26_TB,
        I27 => I27_TB,
        I28 => I28_TB,
        I29 => I29_TB,
        I30 => I30_TB,
        I31 => I31_TB,
        S => S_TB,
        Y => Y_TB
    );

    stim_proc : PROCESS
    BEGIN
        S_TB <= "00000"; -- Case A
        I7_TB <= '1';
        WAIT FOR Delay;
        I7_TB <= '0'; -- Case B
        I0_TB <= '1';
        WAIT FOR Delay;

        S_TB <= "10000"; -- Case C
        I0_TB <= '0';
        I14_TB <= '1';
        WAIT FOR Delay;
        I14_TB <= '0'; -- Case D
        I16_TB <= '1';
        WAIT FOR Delay;

        S_TB <= "01000"; -- Case E
        I16_TB <= '0';
        I12_TB <= '1';
        WAIT FOR Delay;
        I12_TB <= '0'; -- Case F
        I8_TB <= '1';
        WAIT FOR Delay;

        S_TB <= "10010"; -- Case G   
        I8_TB <= '0';
        I4_TB <= '1';
        WAIT FOR Delay;
        I4_TB <= '0'; -- Case H
        I18_TB <= '1';
        WAIT FOR Delay;
    END PROCESS;
END Simulation;