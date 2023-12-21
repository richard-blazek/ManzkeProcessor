----------------------------------------------------------------------------------
-- Engineer: Richard Blažek
-- Create Date: 11/04/2023 10:22:29 PM
-- Module Name: DP_SingleBit_LogicCircuit - Behavioral
----------------------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;

ENTITY DP_SingleBit_LogicCircuit IS
    PORT (
        A, B, S0, S1 : IN STD_LOGIC;
        Y : OUT STD_LOGIC);
END DP_SingleBit_LogicCircuit;

ARCHITECTURE Behavioral OF DP_SingleBit_LogicCircuit IS

    CONSTANT AND_gate_delay : TIME := 9ns;
    CONSTANT NAND_gate_delay : TIME := 7ns;
    CONSTANT OR_gate_delay : TIME := 7ns;
    CONSTANT NOR_gate_delay : TIME := 8ns;
    CONSTANT XOR_gate_delay : TIME := 4ns;
    CONSTANT XNOR_gate_delay : TIME := 4ns;
    CONSTANT NOT_gate_delay : TIME := 3ns;

    SIGNAL anded, ored, xored, noted : STD_LOGIC;
    SIGNAL andXX, orXX, xorXX, notXX, and0X, or0X, xor0X, not0X, and01, or01, xor01, not01 : STD_LOGIC;
    SIGNAL S0_not, S1_not, S0_on, S1_on, S0_off, S1_off : STD_LOGIC;
    SIGNAL Y1, Y2 : STD_LOGIC;

BEGIN
    anded <= A AND B AFTER AND_gate_delay;
    ored <= A OR B AFTER OR_gate_delay;
    xored <= A XOR B AFTER XOR_gate_delay;
    noted <= NOT A AFTER NOT_gate_delay;
    S0_not <= NOT S0 AFTER NOT_gate_delay;
    S1_not <= NOT S1 AFTER NOT_gate_delay;

    -- Added delays    
    andXX <= anded;
    orXX <= ored AFTER (AND_gate_delay - OR_gate_delay);
    xorXX <= xored AFTER (AND_gate_delay - XOR_gate_delay);
    notXX <= noted AFTER (AND_gate_delay - NOT_gate_delay);
    S0_on <= S0 AFTER AND_gate_delay;
    S1_on <= S1 AFTER 2 * AND_gate_delay;
    S0_off <= S0_not AFTER (AND_gate_delay - NOT_gate_delay);
    S1_off <= S1_not AFTER (2 * AND_gate_delay - NOT_gate_delay);
    and0X <= andXX AND S0_off AFTER AND_gate_delay;
    or0X <= orXX AND S0_on AFTER AND_gate_delay;
    xor0X <= xorXX AND S0_off AFTER AND_gate_delay;
    not0X <= notXX AND S0_on AFTER AND_gate_delay;

    and01 <= and0X AND S1_off AFTER AND_gate_delay;
    or01 <= or0X AND S1_off AFTER AND_gate_delay;
    xor01 <= xor0X AND S1_on AFTER AND_gate_delay;
    not01 <= not0X AND S1_on AFTER AND_gate_delay;

    Y1 <= and01 OR or01 AFTER OR_gate_delay;
    Y2 <= xor01 OR not01 AFTER OR_gate_delay;
    Y <= Y1 OR Y2 AFTER OR_gate_delay;
END Behavioral;