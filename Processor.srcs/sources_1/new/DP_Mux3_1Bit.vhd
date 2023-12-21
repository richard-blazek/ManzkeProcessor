----------------------------------------------------------------------------------
-- Engineer: Richard Blažek
-- Create Date: 11/07/2023 02:31:52 PM
-- Module Name: DP_Mux3_1Bit - Behavioral
----------------------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;

ENTITY DP_Mux3_1Bit IS
    PORT (
        I0, I1, I2, S0, S1 : IN STD_LOGIC;
        Y : OUT STD_LOGIC);
END DP_Mux3_1Bit;

ARCHITECTURE Behavioral OF DP_Mux3_1Bit IS
    CONSTANT AND_gate_delay : TIME := 9ns;
    CONSTANT NAND_gate_delay : TIME := 7ns;
    CONSTANT OR_gate_delay : TIME := 7ns;
    CONSTANT NOR_gate_delay : TIME := 8ns;
    CONSTANT XOR_gate_delay : TIME := 4ns;
    CONSTANT XNOR_gate_delay : TIME := 4ns;
    CONSTANT NOT_gate_delay : TIME := 3ns;

    SIGNAL S0_on, S0_off, S1_on, S1_off : STD_LOGIC;
    SIGNAL I0_delayed, I1_delayed, I2_delayed : STD_LOGIC;
    SIGNAL S00, S01, S10, S11, Y00, Y01, Y10, Y11, Y0, Y1 : STD_LOGIC;

BEGIN
    I0_delayed <= I0 AFTER (NOT_gate_delay + AND_gate_delay);
    I1_delayed <= I1 AFTER (NOT_gate_delay + AND_gate_delay);
    I2_delayed <= I2 AFTER (NOT_gate_delay + AND_gate_delay);

    S0_on <= S0 AFTER NOT_gate_delay;
    S1_on <= S1 AFTER NOT_gate_delay;
    S0_off <= NOT S0 AFTER NOT_gate_delay;
    S1_off <= NOT S1 AFTER NOT_gate_delay;

    S00 <= S0_off AND S1_off AFTER AND_gate_delay;
    S01 <= S0_on AND S1_off AFTER AND_gate_delay;
    S10 <= S0_off AND S1_on AFTER AND_gate_delay;
    S11 <= S0_on AND S1_on AFTER AND_gate_delay;

    Y00 <= S00 AND I0_delayed AFTER AND_gate_delay;
    Y01 <= S01 AND I1_delayed AFTER AND_gate_delay;
    Y10 <= S10 AND I2_delayed AFTER AND_gate_delay;
    Y11 <= S11 AND I0_delayed AFTER AND_gate_delay;

    Y0 <= Y00 OR Y01 AFTER OR_gate_delay;
    Y1 <= Y10 OR Y11 AFTER OR_gate_delay;
    Y <= Y0 OR Y1 AFTER OR_gate_delay;
END Behavioral;