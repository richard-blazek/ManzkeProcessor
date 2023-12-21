----------------------------------------------------------------------------------
-- Engineer: Richard Blažek
-- Create Date: 11/28/2023 06:52:07 PM
-- Module Name: CPU_SignExtend - Behavioral
----------------------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;

ENTITY CPU_SignExtend IS
    PORT (
        Input : IN STD_LOGIC_VECTOR (9 DOWNTO 0);
        Output : OUT STD_LOGIC_VECTOR (31 DOWNTO 0));
END CPU_SignExtend;

ARCHITECTURE Behavioral OF CPU_SignExtend IS
BEGIN
    Output <= (31 DOWNTO 10 => Input(9)) & Input;
END Behavioral;