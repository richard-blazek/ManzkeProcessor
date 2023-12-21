----------------------------------------------------------------------------------
-- Engineer: Richard Blažek
-- Create Date: 11/27/2023 10:50:13 AM
-- Module Name: CPU_DFlipFlop - Behavioral
----------------------------------------------------------------------------------
LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;

ENTITY CPU_DFlipFlop IS
    PORT (
        D, Clock, Reset : IN STD_LOGIC;
        Q : OUT STD_LOGIC);
END CPU_DFlipFlop;

ARCHITECTURE Behavioral OF CPU_DFlipFlop IS

    CONSTANT AND_gate_delay : TIME := 9ns;
    CONSTANT NAND_gate_delay : TIME := 7ns;
    CONSTANT OR_gate_delay : TIME := 7ns;
    CONSTANT NOR_gate_delay : TIME := 8ns;
    CONSTANT XOR_gate_delay : TIME := 4ns;
    CONSTANT XNOR_gate_delay : TIME := 4ns;
    CONSTANT NOT_gate_delay : TIME := 3ns;

    SIGNAL X1, X2, X3, X4A, X4B, X5, X6 : STD_LOGIC;
    SIGNAL X7, X7_not, X8, X9A, X9B : STD_LOGIC;
    SIGNAL X10A, X10A_not, X10B, X11, X12 : STD_LOGIC;

BEGIN

    X1 <= Clock AND X10B AFTER AND_gate_delay;
    X2 <= X1 AND X6 AFTER AND_gate_delay;
    X3 <= NOT X2 AFTER NOT_gate_delay;
    X4A <= X3 AND D AFTER AND_gate_delay;
    X4B <= NOT Reset AFTER NOT_gate_delay;
    X5 <= X4A AND X4B AFTER AND_gate_delay;
    X6 <= NOT X5 AFTER NOT_gate_delay;
    X7 <= X6 AND X10B AFTER AND_gate_delay;
    X7_not <= NOT X7 AFTER NOT_gate_delay;
    X8 <= X7_not AND Clock AFTER AND_gate_delay;
    X9A <= X3 AND X12 AFTER AND_gate_delay;
    X9B <= X4B AND X8 AFTER AND_gate_delay;
    X10A <= X9A AND X4B AFTER AND_gate_delay;
    X10A_not <= NOT X10A AFTER NOT_gate_delay;
    X10B <= NOT X9B AFTER NOT_gate_delay;
    X11 <= X10A_not AND X10B AFTER AND_gate_delay;
    X12 <= NOT X11 AFTER NOT_gate_delay;

    Q <= X12;

END Behavioral;