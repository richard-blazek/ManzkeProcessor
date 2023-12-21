----------------------------------------------------------------------------------
-- Engineer: Richard Blažek
-- Create Date: 10/19/2023 09:35:23 AM
-- Module Name: RF_Mux3_32bit_TB - Behavioral
----------------------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;

ENTITY RF_Mux3_32bit_TB IS
    --  Ports not needed
END RF_Mux3_32bit_TB;

ARCHITECTURE Simulation OF RF_Mux3_32bit_TB IS
    COMPONENT RF_Mux3_32bit IS
        PORT (
            I0, I1, I2 : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
            S : IN STD_LOGIC_VECTOR (1 DOWNTO 0);
            Y : OUT STD_LOGIC_VECTOR (31 DOWNTO 0));
    END COMPONENT;

    CONSTANT StudentID : STD_LOGIC_VECTOR (27 DOWNTO 0) := x"154D884";
    CONSTANT Delay : TIME := 200 ns;

    SIGNAL I0_TB : STD_LOGIC_VECTOR (31 DOWNTO 0) := x"22337668";
    SIGNAL I1_TB : STD_LOGIC_VECTOR (31 DOWNTO 0) := x"22337669";
    SIGNAL I2_TB : STD_LOGIC_VECTOR (31 DOWNTO 0) := x"2233766a";
    SIGNAL S_TB : STD_LOGIC_VECTOR (1 DOWNTO 0) := "00";
    SIGNAL Y_TB : STD_LOGIC_VECTOR (31 DOWNTO 0) := x"00000000";

BEGIN
    uut : RF_Mux3_32bit PORT MAP(I0 => I0_TB, I1 => I1_TB, I2 => I2_TB, S => S_TB, Y => Y_TB);

    stim_proc : PROCESS BEGIN
        S_TB <= "00"; -- Case A
        WAIT FOR Delay;

        S_TB <= "01"; -- Case B
        WAIT FOR Delay;

        S_TB <= "10"; -- Case C
        WAIT FOR Delay;

        S_TB <= "11"; -- Case D
        WAIT FOR Delay;
    END PROCESS;
END Simulation;