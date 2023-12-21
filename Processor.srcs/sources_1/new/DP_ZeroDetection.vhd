----------------------------------------------------------------------------------
-- Engineer: Richard Blažek
-- Create Date: 11/08/2023 05:40:10 PM
-- Module Name: DP_ZeroDetection - Behavioral
----------------------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;

ENTITY DP_ZeroDetection IS
    PORT (
        I : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
        Z : OUT STD_LOGIC);
END DP_ZeroDetection;

ARCHITECTURE Behavioral OF DP_ZeroDetection IS
    CONSTANT AND_gate_delay : TIME := 9ns;
    CONSTANT NAND_gate_delay : TIME := 7ns;
    CONSTANT OR_gate_delay : TIME := 7ns;
    CONSTANT NOR_gate_delay : TIME := 8ns;
    CONSTANT XOR_gate_delay : TIME := 4ns;
    CONSTANT XNOR_gate_delay : TIME := 4ns;
    CONSTANT NOT_gate_delay : TIME := 3ns;

    SIGNAL A0, A1, A2, A3, A4, A5, A6, A7, A8, A9, A10, A11, A12, A13, A14, A15 : STD_LOGIC;
    SIGNAL B0, B1, B2, B3, B4, B5, B6, B7 : STD_LOGIC;
    SIGNAL C0, C1, C2, C3 : STD_LOGIC;
    SIGNAL D0, D1 : STD_LOGIC;
    SIGNAL E0 : STD_LOGIC;

BEGIN
    A0 <= I(0) OR I(1) AFTER OR_gate_delay;
    A1 <= I(2) OR I(3) AFTER OR_gate_delay;
    A2 <= I(4) OR I(5) AFTER OR_gate_delay;
    A3 <= I(6) OR I(7) AFTER OR_gate_delay;
    A4 <= I(8) OR I(9) AFTER OR_gate_delay;
    A5 <= I(10) OR I(11) AFTER OR_gate_delay;
    A6 <= I(12) OR I(13) AFTER OR_gate_delay;
    A7 <= I(14) OR I(15) AFTER OR_gate_delay;
    A8 <= I(16) OR I(17) AFTER OR_gate_delay;
    A9 <= I(18) OR I(19) AFTER OR_gate_delay;
    A10 <= I(20) OR I(21) AFTER OR_gate_delay;
    A11 <= I(22) OR I(23) AFTER OR_gate_delay;
    A12 <= I(24) OR I(25) AFTER OR_gate_delay;
    A13 <= I(26) OR I(27) AFTER OR_gate_delay;
    A14 <= I(28) OR I(29) AFTER OR_gate_delay;
    A15 <= I(30) OR I(31) AFTER OR_gate_delay;

    B0 <= A0 OR A1 AFTER OR_gate_delay;
    B1 <= A2 OR A3 AFTER OR_gate_delay;
    B2 <= A4 OR A5 AFTER OR_gate_delay;
    B3 <= A6 OR A7 AFTER OR_gate_delay;
    B4 <= A8 OR A9 AFTER OR_gate_delay;
    B5 <= A10 OR A11 AFTER OR_gate_delay;
    B6 <= A12 OR A13 AFTER OR_gate_delay;
    B7 <= A14 OR A15 AFTER OR_gate_delay;

    C0 <= B0 OR B1 AFTER OR_gate_delay;
    C1 <= B2 OR B3 AFTER OR_gate_delay;
    C2 <= B4 OR B5 AFTER OR_gate_delay;
    C3 <= B6 OR B7 AFTER OR_gate_delay;

    D0 <= C0 OR C1 AFTER OR_gate_delay;
    D1 <= C2 OR C3 AFTER OR_gate_delay;

    E0 <= D0 OR D1 AFTER OR_gate_delay;

    Z <= NOT E0 AFTER NOT_gate_delay;
END Behavioral;