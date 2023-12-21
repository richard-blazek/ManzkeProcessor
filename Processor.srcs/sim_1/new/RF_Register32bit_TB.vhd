----------------------------------------------------------------------------------
-- Engineer: Richard Blažek 
-- Create Date: 10/06/2023 04:43:34 PM
-- Module Name: RF_Register32bit_TB - Simulation
----------------------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;

ENTITY RF_Register32bit_TB IS
  -- Ports not needed for simulation
END RF_Register32bit_TB;

ARCHITECTURE Simulation OF RF_Register32bit_TB IS
  COMPONENT RF_Register32bit
    PORT (
      Clock, Load, Reset : IN STD_LOGIC;
      D : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
      Q : OUT STD_LOGIC_VECTOR(31 DOWNTO 0));
  END COMPONENT;

  SIGNAL Load_TB, Clock_TB : STD_LOGIC := '0';
  SIGNAL D_TB, Q_TB : STD_LOGIC_VECTOR (31 DOWNTO 0) := x"00000000";

  CONSTANT StudentID : STD_LOGIC_VECTOR := x"154D884";
  CONSTANT PERIOD : TIME := 200ns;

BEGIN
  uut : RF_Register32bit PORT MAP(
    Clock => Clock_TB,
    Load => Load_TB,
    D => D_TB,
    Reset => '0',
    Q => Q_TB
  );

  Clock_TB <= NOT Clock_TB AFTER PERIOD/2;

  stim_proc : PROCESS BEGIN
    D_TB <= x"00000000";
    Load_TB <= '1';
    WAIT FOR PERIOD * 2; -- Case A

    D_TB <= x"22337668";
    Load_TB <= '0';
    WAIT FOR PERIOD * 2; -- Case B

    D_TB <= x"22337668";
    Load_TB <= '1';
    WAIT FOR PERIOD * 2; -- Case C

    D_TB <= x"00000000";
    Load_TB <= '0';
    WAIT FOR PERIOD * 2; -- Case D
  END PROCESS;
END Simulation;