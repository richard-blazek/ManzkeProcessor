----------------------------------------------------------------------------------
-- Engineer: Richard Blažek
-- Create Date: 11/06/2023 04:15:44 PM
-- Module Name: CPU_Mux2_32Bit_TB - Simulation
----------------------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;

ENTITY CPU_Mux2_32Bit_TB IS
    -- No entity student
END CPU_Mux2_32Bit_TB;

ARCHITECTURE Simulation OF CPU_Mux2_32Bit_TB IS
    COMPONENT CPU_Mux2_32Bit IS
        PORT (
            I0, I1 : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
            S : IN STD_LOGIC;
            Y : OUT STD_LOGIC_VECTOR (31 DOWNTO 0));
    END COMPONENT;

    CONSTANT StudentID : STD_LOGIC_VECTOR (27 DOWNTO 0) := x"154D884";

    SIGNAL I0_TB, I1_TB, Y_TB : STD_LOGIC_VECTOR (31 DOWNTO 0);
    SIGNAL S_TB : STD_LOGIC;

BEGIN
    uut : CPU_Mux2_32Bit PORT MAP(
        I0 => I0_TB,
        I1 => I1_TB,
        Y => Y_TB,
        S => S_TB
    );
    sim_proc : PROCESS BEGIN

        I0_TB <= x"22337668";
        I1_TB <= x"12341234";
        S_TB <= '0';
        WAIT FOR 50ns;

        I0_TB <= x"22337668";
        I1_TB <= x"12341234";
        S_TB <= '1';
        WAIT FOR 50ns;

        I0_TB <= x"43214321";
        I1_TB <= x"66666666";
        S_TB <= '1';
        WAIT FOR 50ns;

        I0_TB <= x"87654321";
        I1_TB <= x"77777777";
        S_TB <= '0';
        WAIT FOR 50ns;

    END PROCESS;
END Simulation;