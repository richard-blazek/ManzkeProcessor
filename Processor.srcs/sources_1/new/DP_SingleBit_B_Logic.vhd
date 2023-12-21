----------------------------------------------------------------------------------
-- Engineer: Richard Blažek 
-- Create Date: 11/04/2023 11:01:56 AM
-- Module Name: DP_SingleBit_B_Logic - Behavioral
----------------------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;

ENTITY DP_SingleBit_B_Logic IS
    PORT (
        B, S0, S1 : IN STD_LOGIC;
        Y : OUT STD_LOGIC);
END DP_SingleBit_B_Logic;

ARCHITECTURE Behavioral OF DP_SingleBit_B_Logic IS

    CONSTANT AND_gate_delay : TIME := 9ns;
    CONSTANT NAND_gate_delay : TIME := 7ns;
    CONSTANT OR_gate_delay : TIME := 7ns;
    CONSTANT NOR_gate_delay : TIME := 8ns;
    CONSTANT XOR_gate_delay : TIME := 4ns;
    CONSTANT XNOR_gate_delay : TIME := 4ns;
    CONSTANT NOT_gate_delay : TIME := 3ns;

    SIGNAL B_on, B_off, S0_delayed, S1_delayed, S0_en, S1_en : STD_LOGIC;

BEGIN
    B_on <= B AFTER NOT_gate_delay;
    B_off <= NOT B AFTER NOT_gate_delay;

    S0_delayed <= S0 AFTER NOT_gate_delay;
    S1_delayed <= S1 AFTER NOT_gate_delay;

    S0_en <= S0_delayed AND B_on AFTER AND_gate_delay;
    S1_en <= S1_delayed AND B_off AFTER AND_gate_delay;
    Y <= S0_en OR S1_en AFTER OR_gate_delay;
END Behavioral;