----------------------------------------------------------------------------------
-- Engineer: Richard Blažek
-- Create Date: 12/03/2023 12:52:26 PM
-- Module Name: CPU_IR_TB - Simulation
----------------------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;

ENTITY CPU_IR_TB IS
    -- No ports for simulation
END CPU_IR_TB;

ARCHITECTURE Simulation OF CPU_IR_TB IS
    COMPONENT CPU_IR IS
        PORT (
            Input : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
            IL, Clock : IN STD_LOGIC;
            OpCode : OUT STD_LOGIC_VECTOR (16 DOWNTO 0);
            DR, SA, SB : OUT STD_LOGIC_VECTOR (4 DOWNTO 0));
    END COMPONENT;

    SIGNAL IL, Clock : STD_LOGIC := '0';
    SIGNAL Input : STD_LOGIC_VECTOR (31 DOWNTO 0);
    SIGNAL OpCode : STD_LOGIC_VECTOR (16 DOWNTO 0);
    SIGNAL DR, SA, SB : STD_LOGIC_VECTOR (4 DOWNTO 0);
    CONSTANT StudentID : STD_LOGIC_VECTOR := x"154D884";

BEGIN
    uut : CPU_IR PORT MAP(Clock => Clock, IL => IL, Input => Input, OpCode => OpCode, DR => DR, SA => SA, SB => SB);
    Clock <= NOT Clock AFTER 100ns;

    ps : PROCESS BEGIN
        Input <= "0" & x"0025" & "00010" & "00010" & "00011";
        WAIT FOR 1000ns;

        IL <= '1';
        WAIT FOR 1000ns;
    END PROCESS;
END Simulation;