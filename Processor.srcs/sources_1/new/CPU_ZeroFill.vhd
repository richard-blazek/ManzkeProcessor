----------------------------------------------------------------------------------
-- Engineer: Richard Blažek
-- Create Date: 11/28/2023 03:29:19 PM
-- Module Name: CPU_ZeroFill - Behavioral
----------------------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;

ENTITY CPU_ZeroFill IS
    PORT (
        Input : IN STD_LOGIC_VECTOR (4 DOWNTO 0);
        Output : OUT STD_LOGIC_VECTOR (31 DOWNTO 0));
END CPU_ZeroFill;

ARCHITECTURE Behavioral OF CPU_ZeroFill IS
BEGIN
    Output <= x"0000" & x"00" & "000" & Input;
END Behavioral;