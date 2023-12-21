----------------------------------------------------------------------------------
-- Engineer: Richard Blažek
-- Create Date: 11/03/2023 09:30:53 AM 
-- Module Name: DP_FullAdder - Behavioral
----------------------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;

ENTITY DP_FullAdder IS
    PORT (
        X, Y, Z : IN STD_LOGIC;
        S, C : OUT STD_LOGIC);
END DP_FullAdder;

ARCHITECTURE Behavioral OF DP_FullAdder IS
    CONSTANT AND_gate_delay : TIME := 9ns;
    CONSTANT NAND_gate_delay : TIME := 7ns;
    CONSTANT OR_gate_delay : TIME := 7ns;
    CONSTANT NOR_gate_delay : TIME := 8ns;
    CONSTANT XOR_gate_delay : TIME := 4ns;
    CONSTANT XNOR_gate_delay : TIME := 4ns;
    CONSTANT NOT_gate_delay : TIME := 3ns;

    SIGNAL Z_Delayed, XZ_Delayed : STD_LOGIC;
    SIGNAL X_xor_Y, X_xor_Y_xor_Z : STD_LOGIC;
    SIGNAL XY, YZ, XZ, XY_or_YZ : STD_LOGIC;
BEGIN
    X_xor_Y <= X XOR Y AFTER XOR_gate_delay;
    Z_Delayed <= Z AFTER XOR_gate_delay;
    X_xor_Y_xor_Z <= X_xor_Y XOR Z_Delayed AFTER XOR_gate_delay;
    S <= X_xor_Y_xor_Z AFTER (2 * OR_gate_delay + AND_gate_delay) - (2 * XOR_gate_delay);

    XY <= X AND Y AFTER AND_gate_delay;
    YZ <= Y AND Z AFTER AND_gate_delay;
    XZ <= X AND Z AFTER AND_gate_delay;

    XY_or_YZ <= XY OR YZ AFTER OR_gate_delay;
    XZ_Delayed <= XZ AFTER OR_gate_delay;
    C <= XY_or_YZ OR XZ_Delayed AFTER OR_gate_delay;
END Behavioral;