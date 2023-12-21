----------------------------------------------------------------------------------
-- Engineer: Richard Blažek
-- Create Date: 11/29/2023 10:02:03 PM
-- Module Name: CPU_PC_TB - Simulation
----------------------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;

ENTITY CPU_PC_TB IS
    -- No ports
END CPU_PC_TB;

ARCHITECTURE Simulation OF CPU_PC_TB IS
    COMPONENT CPU_PC IS
        PORT (
            Clock, PI, PL, Reset : IN STD_LOGIC;
            Displacement : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
            InstAdd : OUT STD_LOGIC_VECTOR (31 DOWNTO 0));
    END COMPONENT;

    SIGNAL Clock_TB, PI_TB, PL_TB, Reset_TB : STD_LOGIC := '0';
    SIGNAL Displacement_TB : STD_LOGIC_VECTOR (31 DOWNTO 0) := x"00000044";
    SIGNAL InstAdd_TB : STD_LOGIC_VECTOR (31 DOWNTO 0);

    CONSTANT StudentID : STD_LOGIC_VECTOR := x"154D884";

BEGIN
    Clock_TB <= NOT Clock_TB AFTER 2000ns;

    uut : CPU_PC PORT MAP(
        Clock => Clock_TB,
        PI => PI_TB,
        PL => PL_TB,
        Reset => Reset_TB,
        Displacement => Displacement_TB,
        InstAdd => InstAdd_TB
    );

    ps : PROCESS BEGIN

        Reset_TB <= '1';
        WAIT FOR 8000ns;

        Reset_TB <= '0';
        PI_TB <= '1';
        WAIT FOR 8000ns;

        PI_TB <= '0';
        PL_TB <= '1';
        WAIT FOR 8000ns;
    END PROCESS;

END Simulation;