----------------------------------------------------------------------------------
-- Engineer: Richard Blažek
-- Create Date: 11/27/2023 04:41:40 PM
-- Module Name: CPU_JKFlipFlop - Behavioral
----------------------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;

ENTITY CPU_JKFlipFlop IS
    PORT (
        J, K, Clock, Reset : IN STD_LOGIC;
        Q, Q_not : OUT STD_LOGIC);
END CPU_JKFlipFlop;

ARCHITECTURE Behavioral OF CPU_JKFlipFlop IS

    COMPONENT CPU_DFlipFlop_Qnot IS
        PORT (
            D, Clock, Reset : IN STD_LOGIC;
            Q, Q_not : OUT STD_LOGIC);
    END COMPONENT;

    CONSTANT AND_gate_delay : TIME := 9ns;
    CONSTANT NAND_gate_delay : TIME := 7ns;
    CONSTANT OR_gate_delay : TIME := 7ns;
    CONSTANT NOR_gate_delay : TIME := 8ns;
    CONSTANT XOR_gate_delay : TIME := 4ns;
    CONSTANT XNOR_gate_delay : TIME := 4ns;
    CONSTANT NOT_gate_delay : TIME := 3ns;

    SIGNAL K_not, K_and, J_and : STD_LOGIC;
    SIGNAL FF_D, FF_Q, FF_Q_not : STD_LOGIC;

BEGIN

    K_not <= NOT K AFTER NOT_gate_delay;
    K_and <= K_not AND FF_Q AFTER AND_gate_delay;
    J_and <= J AND FF_Q_not AFTER AND_gate_delay;
    FF_D <= K_and OR J_and AFTER OR_gate_delay;

    ff : CPU_DFlipFlop_Qnot PORT MAP(D => FF_D, Clock => Clock, Reset => Reset, Q => FF_Q, Q_not => FF_Q_not);

    Q <= FF_Q;
    Q_not <= FF_Q_not;

END Behavioral;