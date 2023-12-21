----------------------------------------------------------------------------------
-- Engineer: 
-- Create Date: 10/18/2023 02:43:17 PM
-- Module Name: RF_Mux32_32bit_TB - Simulation
----------------------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;

ENTITY RF_Mux32_32bit_TB IS
    --  Ports not needed
END RF_Mux32_32bit_TB;

ARCHITECTURE Simulation OF RF_Mux32_32bit_TB IS
    COMPONENT RF_Mux32_32bit IS
        PORT (
            I0, I1, I2, I3, I4, I5, I6, I7 : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
            I8, I9, I10, I11, I12, I13, I14, I15 : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
            I16, I17, I18, I19, I20, I21, I22, I23 : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
            I24, I25, I26, I27, I28, I29, I30, I31 : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
            S : IN STD_LOGIC_VECTOR (4 DOWNTO 0);
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
    SIGNAL I16_TB : STD_LOGIC_VECTOR (31 DOWNTO 0) := x"22337678";
    SIGNAL I17_TB : STD_LOGIC_VECTOR (31 DOWNTO 0) := x"22337679";
    SIGNAL I18_TB : STD_LOGIC_VECTOR (31 DOWNTO 0) := x"2233767a";
    SIGNAL I19_TB : STD_LOGIC_VECTOR (31 DOWNTO 0) := x"2233767b";
    SIGNAL I20_TB : STD_LOGIC_VECTOR (31 DOWNTO 0) := x"2233767c";
    SIGNAL I21_TB : STD_LOGIC_VECTOR (31 DOWNTO 0) := x"2233767d";
    SIGNAL I22_TB : STD_LOGIC_VECTOR (31 DOWNTO 0) := x"2233767e";
    SIGNAL I23_TB : STD_LOGIC_VECTOR (31 DOWNTO 0) := x"2233767f";
    SIGNAL I24_TB : STD_LOGIC_VECTOR (31 DOWNTO 0) := x"22337680";
    SIGNAL I25_TB : STD_LOGIC_VECTOR (31 DOWNTO 0) := x"22337681";
    SIGNAL I26_TB : STD_LOGIC_VECTOR (31 DOWNTO 0) := x"22337682";
    SIGNAL I27_TB : STD_LOGIC_VECTOR (31 DOWNTO 0) := x"22337683";
    SIGNAL I28_TB : STD_LOGIC_VECTOR (31 DOWNTO 0) := x"22337684";
    SIGNAL I29_TB : STD_LOGIC_VECTOR (31 DOWNTO 0) := x"22337685";
    SIGNAL I30_TB : STD_LOGIC_VECTOR (31 DOWNTO 0) := x"22337686";
    SIGNAL I31_TB : STD_LOGIC_VECTOR (31 DOWNTO 0) := x"22337687";
    SIGNAL S_TB : STD_LOGIC_VECTOR (4 DOWNTO 0) := "00000";
    SIGNAL Y_TB : STD_LOGIC_VECTOR (31 DOWNTO 0) := x"00000000";

BEGIN
    -- Instantiate the Unit Under Test (UUT)
    uut : RF_Mux32_32bit PORT MAP(
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

    stim_proc : PROCESS BEGIN

        S_TB <= "00000"; -- Case A
        WAIT FOR Delay;

        S_TB <= "00001"; -- Case B
        WAIT FOR Delay;

        S_TB <= "01100"; -- Case C
        WAIT FOR Delay;

        S_TB <= "10101"; -- Case D
        WAIT FOR Delay;

        S_TB <= "11010"; -- Case E
        WAIT FOR Delay;

        S_TB <= "11111"; -- Case F
        WAIT FOR Delay;
    END PROCESS;

END Simulation;