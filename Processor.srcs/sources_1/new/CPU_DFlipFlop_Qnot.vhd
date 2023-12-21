----------------------------------------------------------------------------------
-- Engineer: Richard Blažek
-- Create Date: 11/27/2023 01:51:10 PM
-- Module Name: CPU_DFlipFlop_Qnot - Behavioral
----------------------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;

ENTITY CPU_DFlipFlop_Qnot IS
    PORT (
        D, Clock, Reset : IN STD_LOGIC;
        Q, Q_not : OUT STD_LOGIC);
END CPU_DFlipFlop_Qnot;

ARCHITECTURE Behavioral OF CPU_DFlipFlop_Qnot IS

    CONSTANT AND_gate_delay : TIME := 9ns;
    CONSTANT NAND_gate_delay : TIME := 7ns;
    CONSTANT OR_gate_delay : TIME := 7ns;
    CONSTANT NOR_gate_delay : TIME := 8ns;
    CONSTANT XOR_gate_delay : TIME := 4ns;
    CONSTANT XNOR_gate_delay : TIME := 4ns;
    CONSTANT NOT_gate_delay : TIME := 3ns;

    SIGNAL X1, X2, X3, X4A, X4B : STD_LOGIC;
    SIGNAL X5, X6, X7, X7_not, X8, X9 : STD_LOGIC;
    SIGNAL X10A, X10B, X11A, X11B, X12A, X12B : STD_LOGIC;

BEGIN
    X1 <= X10A AND Clock AFTER AND_gate_delay;
    X2 <= X1 AND X6 AFTER AND_gate_delay;
    X3 <= NOT X2 AFTER NOT_gate_delay;
    X4A <= X3 AND D AFTER AND_gate_delay;
    X4B <= NOT Reset AFTER NOT_gate_delay;
    X5 <= X4A AND X4B AFTER AND_gate_delay;
    X6 <= NOT X5 AFTER NOT_gate_delay;
    X7 <= X6 AND X10A AFTER AND_gate_delay;
    X7_not <= NOT X7 AFTER NOT_gate_delay;
    X8 <= X7_not AND Clock AFTER AND_gate_delay;
    X9 <= X8 AND X4B AFTER AND_gate_delay;
    X10A <= NOT X9 AFTER NOT_gate_delay;
    X10B <= X3 AND X12A AFTER AND_gate_delay;
    X11A <= X10A AND X12B AFTER AND_gate_delay;
    X11B <= X10B AND X4B AFTER AND_gate_delay;
    X12A <= NOT X11A AFTER NOT_gate_delay;
    X12B <= NOT X11B AFTER NOT_gate_delay;

    Q <= X12A;
    Q_not <= X12B;
END Behavioral;