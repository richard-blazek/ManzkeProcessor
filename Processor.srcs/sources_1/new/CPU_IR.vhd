----------------------------------------------------------------------------------
-- Engineer: Richard Blažek
-- Create Date: 12/03/2023 12:39:45 PM
-- Module Name: CPU_IR - Behavioral
----------------------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;

ENTITY CPU_IR IS
    PORT (
        Input : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
        IL, Clock : IN STD_LOGIC;
        OpCode : OUT STD_LOGIC_VECTOR (16 DOWNTO 0);
        DR, SA, SB : OUT STD_LOGIC_VECTOR (4 DOWNTO 0));
END CPU_IR;

ARCHITECTURE Behavioral OF CPU_IR IS
    COMPONENT RF_Register32bit IS
        PORT (
            Clock, Load, Reset : IN STD_LOGIC;
            D : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
            Q : OUT STD_LOGIC_VECTOR(31 DOWNTO 0));
    END COMPONENT;
    SIGNAL Q : STD_LOGIC_VECTOR(31 DOWNTO 0);

BEGIN
    registr : RF_Register32bit PORT MAP(Clock => Clock, Reset => '0', Load => IL, D => Input, Q => Q);

    OpCode <= Q(31 DOWNTO 15);
    DR <= Q(14 DOWNTO 10);
    SA <= Q(9 DOWNTO 5);
    SB <= Q(4 DOWNTO 0);
END Behavioral;