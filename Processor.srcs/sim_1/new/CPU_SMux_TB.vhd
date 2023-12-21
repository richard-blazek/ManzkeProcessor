----------------------------------------------------------------------------------
-- Engineer: Richard Blažek
-- Create Date: 11/29/2023 01:27:23 PM
-- Module Name: CPU_SMux_TB - Simulation
----------------------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;

ENTITY CPU_SMux_TB IS
    -- No ports needed for simulation
END CPU_SMux_TB;

ARCHITECTURE Simulation OF CPU_SMux_TB IS
    COMPONENT CPU_SMux IS
        PORT (
            Zero, One, C, V, Z, N, Not_C, Not_Z : IN STD_LOGIC;
            MS : IN STD_LOGIC_VECTOR (2 DOWNTO 0);
            Y : OUT STD_LOGIC);
    END COMPONENT;

    SIGNAL C_TB, V_TB, Z_TB, N_TB, Y_TB, Not_C_TB, Not_Z_TB : STD_LOGIC;
    SIGNAL MS_TB : STD_LOGIC_VECTOR (2 DOWNTO 0);

    CONSTANT StudentID : STD_LOGIC_VECTOR := x"154D884";

BEGIN
    Not_C_TB <= NOT C_TB;
    Not_Z_TB <= NOT Z_TB;

    uut : CPU_SMux PORT MAP(
        Zero => '0',
        One => '1',
        C => C_TB,
        V => V_TB,
        Z => Z_TB,
        N => N_TB,
        Not_C => Not_C_TB,
        Not_Z => Not_Z_TB,
        MS => MS_TB,
        Y => Y_TB
    );

    ps : PROCESS BEGIN
        C_TB <= '1';
        V_TB <= '0';
        N_TB <= '1';
        Z_TB <= '0';

        MS_TB <= "000";
        WAIT FOR 500ns;
        MS_TB <= "010";
        WAIT FOR 500ns;
        MS_TB <= "001";
        WAIT FOR 500ns;
        MS_TB <= "011";
        WAIT FOR 500ns;
        MS_TB <= "100";
        WAIT FOR 500ns;
        MS_TB <= "101";
        WAIT FOR 500ns;
        MS_TB <= "110";
        WAIT FOR 500ns;
        MS_TB <= "111";
        WAIT FOR 500ns;
    END PROCESS;
END Simulation;