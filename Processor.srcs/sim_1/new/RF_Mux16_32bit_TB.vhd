----------------------------------------------------------------------------------
-- Engineer: 
-- Create Date: 10/18/2023 02:43:17 PM
-- Module Name: RF_Mux16_32bit_TB - Simulation
----------------------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;

ENTITY RF_Mux16_32bit_TB IS
    --  Ports not needed
END RF_Mux16_32bit_TB;

ARCHITECTURE Simulation OF RF_Mux16_32bit_TB IS
    COMPONENT RF_Mux16_32bit IS
        PORT (
            I0, I1, I2, I3, I4, I5, I6, I7 : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
            I8, I9, I10, I11, I12, I13, I14, I15 : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
            S : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
            Y : OUT STD_LOGIC_VECTOR (31 DOWNTO 0));
    END COMPONENT;

    CONSTANT StudentID : STD_LOGIC_VECTOR (27 DOWNTO 0) := x"154D884";
    CONSTANT Delay : TIME := 200 ns;

    SIGNAL I0_TB : STD_LOGIC_VECTOR (31 DOWNTO 0) := x"22337668";
    SIGNAL I1_TB : STD_LOGIC_VECTOR (31 DOWNTO 0) := x"22337669";
    SIGNAL I2_TB : STD_LOGIC_VECTOR (31 DOWNTO 0) := x"2233766a";
    SIGNAL I3_TB : STD_LOGIC_VECTOR (31 DOWNTO 0) := x"2233766b";
    SIGNAL I4_TB : STD_LOGIC_VECTOR (31 DOWNTO 0) := x"2233766c";
    SIGNAL I5_TB : STD_LOGIC_VECTOR (31 DOWNTO 0) := x"2233766d";
    SIGNAL I6_TB : STD_LOGIC_VECTOR (31 DOWNTO 0) := x"2233766e";
    SIGNAL I7_TB : STD_LOGIC_VECTOR (31 DOWNTO 0) := x"2233766f";
    SIGNAL I8_TB : STD_LOGIC_VECTOR (31 DOWNTO 0) := x"22337670";
    SIGNAL I9_TB : STD_LOGIC_VECTOR (31 DOWNTO 0) := x"22337671";
    SIGNAL I10_TB : STD_LOGIC_VECTOR (31 DOWNTO 0) := x"22337672";
    SIGNAL I11_TB : STD_LOGIC_VECTOR (31 DOWNTO 0) := x"22337673";
    SIGNAL I12_TB : STD_LOGIC_VECTOR (31 DOWNTO 0) := x"22337674";
    SIGNAL I13_TB : STD_LOGIC_VECTOR (31 DOWNTO 0) := x"22337675";
    SIGNAL I14_TB : STD_LOGIC_VECTOR (31 DOWNTO 0) := x"22337676";
    SIGNAL I15_TB : STD_LOGIC_VECTOR (31 DOWNTO 0) := x"22337677";
    SIGNAL S_TB : STD_LOGIC_VECTOR (3 DOWNTO 0) := "0000";
    SIGNAL Y_TB : STD_LOGIC_VECTOR (31 DOWNTO 0) := x"00000000";

BEGIN
    -- Instantiate the Unit Under Test (UUT)
    uut : RF_Mux16_32bit PORT MAP(
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

    stim_proc : PROCESS BEGIN

        S_TB <= "0000"; -- Case A
        WAIT FOR Delay;

        S_TB <= "0001"; -- Case B
        WAIT FOR Delay;

        S_TB <= "0100"; -- Case C
        WAIT FOR Delay;

        S_TB <= "1001"; -- Case D
        WAIT FOR Delay;

        S_TB <= "1110"; -- Case E
        WAIT FOR Delay;

        S_TB <= "1111"; -- Case F
        WAIT FOR Delay;
    END PROCESS;

END Simulation;