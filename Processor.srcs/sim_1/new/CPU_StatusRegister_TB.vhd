----------------------------------------------------------------------------------
-- Engineer: Richard Blažek
-- Create Date: 11/28/2023 01:45:12 PM
-- Module Name: CPU_StatusRegister_TB - Simulation
----------------------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;

ENTITY CPU_StatusRegister_TB IS
    -- No ports
END CPU_StatusRegister_TB;

ARCHITECTURE Simulation OF CPU_StatusRegister_TB IS
    COMPONENT CPU_StatusRegister IS
        PORT (
            C, Reset_C, N, Reset_N : IN STD_LOGIC;
            V, Reset_V, Z, Reset_Z : IN STD_LOGIC;
            LoadFlags, Clock : IN STD_LOGIC;
            StatusVector : OUT STD_LOGIC_VECTOR (3 DOWNTO 0));
    END COMPONENT;

    SIGNAL C_TB, Reset_C_TB, N_TB, Reset_N_TB : STD_LOGIC := '0';
    SIGNAL V_TB, Reset_V_TB, Z_TB, Reset_Z_TB : STD_LOGIC := '0';
    SIGNAL LoadFlags_TB, Clock_TB : STD_LOGIC := '0';
    SIGNAL StatusVector_TB : STD_LOGIC_VECTOR (3 DOWNTO 0);

BEGIN
    uut : CPU_StatusRegister PORT MAP(
        C => C_TB,
        Reset_C => Reset_C_TB,
        N => N_TB,
        Reset_N => Reset_N_TB,
        V => V_TB,
        Reset_V => Reset_V_TB,
        Z => Z_TB,
        Reset_Z => Reset_Z_TB,
        Clock => Clock_TB,
        LoadFlags => LoadFlags_TB,
        StatusVector => StatusVector_TB
    );

    Clock_TB <= NOT Clock_TB AFTER 100ns;

    proc_sim : PROCESS BEGIN
        LoadFlags_TB <= '1';
        WAIT FOR 400ns;

        C_TB <= '1';
        WAIT FOR 400ns;

        C_TB <= '0';
        N_TB <= '1';
        WAIT FOR 400ns;

        N_TB <= '0';
        V_TB <= '1';
        WAIT FOR 400ns;

        V_TB <= '0';
        Z_TB <= '1';
        WAIT FOR 400ns;

        C_TB <= '1';
        N_TB <= '1';
        V_TB <= '1';
        Z_TB <= '1';
        WAIT FOR 400ns;

        LoadFlags_TB <= '0';

        Reset_C_TB <= '1';
        WAIT FOR 400ns;

        Reset_C_TB <= '0';
        Reset_N_TB <= '1';
        WAIT FOR 400ns;

        Reset_N_TB <= '0';
        Reset_V_TB <= '1';
        WAIT FOR 400ns;

        Reset_V_TB <= '0';
        Reset_Z_TB <= '1';
        WAIT FOR 400ns;
    END PROCESS;
END Simulation;