----------------------------------------------------------------------------------
-- Engineer: Richard Blažek
-- Create Date: 11/28/2023 05:21:23 PM
-- Module Name: CPU_Mux2_17Bit_TB - Simulation
----------------------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;

ENTITY CPU_Mux2_17Bit_TB IS
    -- No ports
END CPU_Mux2_17Bit_TB;

ARCHITECTURE Simulation OF CPU_Mux2_17Bit_TB IS
    COMPONENT CPU_Mux2_17Bit IS
        PORT (
            I0, I1 : IN STD_LOGIC_VECTOR (16 DOWNTO 0);
            S : IN STD_LOGIC;
            Y : OUT STD_LOGIC_VECTOR (16 DOWNTO 0));
    END COMPONENT;

    CONSTANT StudentID : STD_LOGIC_VECTOR (27 DOWNTO 0) := x"154D884";

    SIGNAL I0_TB, I1_TB, Y_TB : STD_LOGIC_VECTOR (16 DOWNTO 0);
    SIGNAL S_TB : STD_LOGIC;

BEGIN
    uut : CPU_Mux2_17Bit PORT MAP(
        I0 => I0_TB,
        I1 => I1_TB,
        Y => Y_TB,
        S => S_TB
    );

    sim_proc : PROCESS BEGIN

        I0_TB <= "11001100110011011";
        I1_TB <= "01100110001100110";
        S_TB <= '0';
        WAIT FOR 1000ns;

        I0_TB <= "11001100110011011";
        I1_TB <= "01100110001100110";
        S_TB <= '1';
        WAIT FOR 1000ns;

        I0_TB <= "00001100110011001";
        I1_TB <= "11111110011001100";
        S_TB <= '1';
        WAIT FOR 1000ns;

        I0_TB <= "11111110011001100";
        I1_TB <= "00001100110011001";
        S_TB <= '0';
        WAIT FOR 1000ns;

    END PROCESS;
END Simulation;