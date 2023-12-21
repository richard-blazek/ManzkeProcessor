----------------------------------------------------------------------------------
-- Engineer: Richard Blažek
-- Create Date: 10/17/2023 06:18:51 PM 
-- Module Name: RF_Mux2_1bit - Behavioral
----------------------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;

ENTITY RF_Mux2_1bit IS
    PORT (
        I0, I1, S : IN STD_LOGIC;
        Y : OUT STD_LOGIC);
END RF_Mux2_1bit;

ARCHITECTURE Behavioral OF RF_Mux2_1bit IS
    --  Propagation Delay according to Student ID - 22 337 668(DEC)
    CONSTANT AND_gate_delay : TIME := 9ns;
    CONSTANT NAND_gate_delay : TIME := 7ns;
    CONSTANT OR_gate_delay : TIME := 7ns;
    CONSTANT NOR_gate_delay : TIME := 8ns;
    CONSTANT XOR_gate_delay : TIME := 4ns;
    CONSTANT XNOR_gate_delay : TIME := 4ns;
    CONSTANT NOT_gate_delay : TIME := 3ns;

    SIGNAL S_on, S_off, I0_and_S_off, I1_and_S_on : STD_LOGIC;
BEGIN
    S_off <= NOT S AFTER NOT_gate_delay;
    S_on <= S AFTER NOT_gate_delay;

    I0_and_S_off <= I0 AND S_off AFTER AND_gate_delay;
    I1_and_S_on <= I1 AND S_on AFTER AND_gate_delay;

    Y <= I0_and_S_off OR I1_and_S_on AFTER AND_gate_delay;
END Behavioral;