----------------------------------------------------------------------------------
-- Engineer: Richard Blažek
-- Create Date: 10/20/2023 02:27:46 PM
-- Module Name: RF_TempDestReg_Decoder_TB - Simulation
----------------------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;

ENTITY RF_TempDestReg_Decoder_TB IS
    --  Ports not needed for simulation
END RF_TempDestReg_Decoder_TB;

ARCHITECTURE Simulation OF RF_TempDestReg_Decoder_TB IS
    COMPONENT RF_TempDestReg_Decoder IS
        PORT (
            I : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
            O0, O1, O2, O3, O4, O5, O6, O7 : OUT STD_LOGIC;
            O8, O9, O10, O11, O12, O13, O14, O15 : OUT STD_LOGIC);
    END COMPONENT;

    CONSTANT StudentID : STD_LOGIC_VECTOR (27 DOWNTO 0) := x"154D884";
    CONSTANT PERIOD : TIME := 200ns;

    SIGNAL I_TB : STD_LOGIC_VECTOR (3 DOWNTO 0) := "0000";
    SIGNAL O0_TB, O1_TB, O2_TB, O3_TB, O4_TB, O5_TB, O6_TB, O7_TB : STD_LOGIC;
    SIGNAL O8_TB, O9_TB, O10_TB, O11_TB, O12_TB, O13_TB, O14_TB, O15_TB : STD_LOGIC;

BEGIN
    uut : RF_TempDestReg_Decoder PORT MAP(
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
        O15 => O15_TB
    );

    stim_proc : PROCESS BEGIN
        I_TB <= "0000"; -- Case A
        WAIT FOR PERIOD;

        I_TB <= "1111"; -- Case B
        WAIT FOR PERIOD;

        I_TB <= "0000"; -- Case C
        WAIT FOR PERIOD;

        I_TB <= "0010"; -- Case D
        WAIT FOR PERIOD;

        I_TB <= "0011"; -- Case E
        WAIT FOR PERIOD;

        I_TB <= "0001"; -- Case F
        WAIT FOR PERIOD;

        I_TB <= "1110"; -- Case G
        WAIT FOR PERIOD;
    END PROCESS;
END Simulation;