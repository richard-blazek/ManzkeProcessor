----------------------------------------------------------------------------------
-- Engineer: Richard Blažek
-- Create Date: 10/19/2023 06:20:54 PM
-- Module Name: RF_DestReg_Decoder_TB - Simulation
----------------------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;

ENTITY RF_DestReg_Decoder_TB IS
    --  Ports not needed for simulation
END RF_DestReg_Decoder_TB;

ARCHITECTURE Simulation OF RF_DestReg_Decoder_TB IS
    COMPONENT RF_DestReg_Decoder IS
        PORT (
            I : IN STD_LOGIC_VECTOR (4 DOWNTO 0);
            O0, O1, O2, O3, O4, O5, O6, O7 : OUT STD_LOGIC;
            O8, O9, O10, O11, O12, O13, O14, O15 : OUT STD_LOGIC;
            O16, O17, O18, O19, O20, O21, O22, O23 : OUT STD_LOGIC;
            O24, O25, O26, O27, O28, O29, O30, O31 : OUT STD_LOGIC);
    END COMPONENT;

    CONSTANT StudentID : STD_LOGIC_VECTOR (27 DOWNTO 0) := x"154D884";
    CONSTANT PERIOD : TIME := 200ns;

    SIGNAL I_TB : STD_LOGIC_VECTOR (4 DOWNTO 0) := "00000";
    SIGNAL O0_TB, O1_TB, O2_TB, O3_TB, O4_TB, O5_TB, O6_TB, O7_TB : STD_LOGIC;
    SIGNAL O8_TB, O9_TB, O10_TB, O11_TB, O12_TB, O13_TB, O14_TB, O15_TB : STD_LOGIC;
    SIGNAL O16_TB, O17_TB, O18_TB, O19_TB, O20_TB, O21_TB, O22_TB, O23_TB : STD_LOGIC;
    SIGNAL O24_TB, O25_TB, O26_TB, O27_TB, O28_TB, O29_TB, O30_TB, O31_TB : STD_LOGIC;

BEGIN
    uut : RF_DestReg_Decoder PORT MAP(
        I => I_TB,
        O0 => O0_TB,
        O1 => O1_TB,
        O2 => O2_TB,
        O3 => O3_TB,
        O4 => O4_TB,
        O5 => O5_TB,
        O6 => O6_TB,
        O7 => O7_TB,
        O8 => O8_TB,
        O9 => O9_TB,
        O10 => O10_TB,
        O11 => O11_TB,
        O12 => O12_TB,
        O13 => O13_TB,
        O14 => O14_TB,
        O15 => O15_TB,
        O16 => O16_TB,
        O17 => O17_TB,
        O18 => O18_TB,
        O19 => O19_TB,
        O20 => O20_TB,
        O21 => O21_TB,
        O22 => O22_TB,
        O23 => O23_TB,
        O24 => O24_TB,
        O25 => O25_TB,
        O26 => O26_TB,
        O27 => O27_TB,
        O28 => O28_TB,
        O29 => O29_TB,
        O30 => O30_TB,
        O31 => O31_TB
    );

    stim_proc : PROCESS BEGIN
        I_TB <= "00000"; -- Case A
        WAIT FOR PERIOD;

        I_TB <= "11111"; -- Case B
        WAIT FOR PERIOD;

        I_TB <= "00000"; -- Case C
        WAIT FOR PERIOD;

        I_TB <= "00010"; -- Case D
        WAIT FOR PERIOD;

        I_TB <= "00011"; -- Case E
        WAIT FOR PERIOD;

        I_TB <= "00001"; -- Case F
        WAIT FOR PERIOD;

        I_TB <= "11100"; -- Case G
        WAIT FOR PERIOD;
    END PROCESS;

END Simulation;