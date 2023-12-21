----------------------------------------------------------------------------------
-- Engineer: Richard Blažek
-- Create Date: 11/08/2023 05:14:00 PM
-- Module Name: DP_CFlagMux2_1Bit - Behavioral
----------------------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;

ENTITY DP_CFlagMux2_1Bit IS
    PORT (
        I0, I1, S : IN STD_LOGIC;
        Y : OUT STD_LOGIC);
END DP_CFlagMux2_1Bit;

ARCHITECTURE Behavioral OF DP_CFlagMux2_1Bit IS
    CONSTANT AND_gate_delay : TIME := 9ns;
    CONSTANT NAND_gate_delay : TIME := 7ns;
    CONSTANT OR_gate_delay : TIME := 7ns;
    CONSTANT NOR_gate_delay : TIME := 8ns;
    CONSTANT XOR_gate_delay : TIME := 4ns;
    CONSTANT XNOR_gate_delay : TIME := 4ns;
    CONSTANT NOT_gate_delay : TIME := 3ns;

    SIGNAL I0_delayed, I1_delayed, S_on, S_off, I0_en, I1_en : STD_LOGIC;

BEGIN
    S_off <= NOT S AFTER NOT_gate_delay;
    S_on <= S AFTER NOT_gate_delay;
    I0_delayed <= I0 AFTER NOT_gate_delay;
    I1_delayed <= I1 AFTER NOT_gate_delay;

    I0_en <= S_off AND I0_delayed AFTER AND_gate_delay;
    I1_en <= S_on AND I1_delayed AFTER AND_gate_delay;

    Y <= I0_en OR I1_en AFTER OR_gate_delay;
END Behavioral;