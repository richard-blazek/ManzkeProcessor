----------------------------------------------------------------------------------
-- Engineer: Richard Blažek
-- Create Date: 12/01/2023 11:29:28 AM
-- Module Name: CPU_CAR_TB - Simulation
----------------------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;

ENTITY CPU_CAR_TB IS
    -- No ports needed for simulation
END CPU_CAR_TB;

ARCHITECTURE Simulation OF CPU_CAR_TB IS
    COMPONENT CPU_CAR IS
        PORT (
            NextAddress : IN STD_LOGIC_VECTOR (16 DOWNTO 0);
            Load, Clock, Reset : IN STD_LOGIC;
            Address : OUT STD_LOGIC_VECTOR (16 DOWNTO 0));
    END COMPONENT;

    SIGNAL NextAddress_TB, Address_TB : STD_LOGIC_VECTOR (16 DOWNTO 0) := "0" & x"0000";
    SIGNAL Load_TB, Clock_TB, Reset_TB : STD_LOGIC := '0';
    CONSTANT StudentID : STD_LOGIC_VECTOR := x"154D884";

BEGIN
    uut : CPU_CAR PORT MAP(
        NextAddress => NextAddress_TB,
        Load => Load_TB,
        Clock => Clock_TB,
        Reset => Reset_TB,
        Address => Address_TB
    );

    Clock_TB <= NOT Clock_TB AFTER 200ns;

    ps : PROCESS BEGIN
        Reset_TB <= '1';
        WAIT FOR 400ns;

        Reset_TB <= '0';
        WAIT FOR 800ns;

        NextAddress_TB <= "0" & x"0044";
        Load_TB <= '1';
        WAIT FOR 400ns;

        Load_TB <= '0';
        WAIT FOR 400ns;
    END PROCESS;
END Simulation;