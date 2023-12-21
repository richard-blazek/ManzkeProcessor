----------------------------------------------------------------------------------
-- Engineer: Richard Blažek
-- Create Date: 11/29/2023 12:34:19 PM
-- Module Name: CPU_SMux - Behavioral
----------------------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;

ENTITY CPU_SMux IS
    PORT (
        Zero, One, C, V, Z, N, Not_C, Not_Z : IN STD_LOGIC;
        MS : IN STD_LOGIC_VECTOR (2 DOWNTO 0);
        Y : OUT STD_LOGIC);
END CPU_SMux;

ARCHITECTURE Behavioral OF CPU_SMux IS
    --  Propagation Delay according to Student ID - 22 337 668(DEC)
    CONSTANT AND_gate_delay : TIME := 9ns;
    CONSTANT NAND_gate_delay : TIME := 7ns;
    CONSTANT OR_gate_delay : TIME := 7ns;
    CONSTANT NOR_gate_delay : TIME := 8ns;
    CONSTANT XOR_gate_delay : TIME := 4ns;
    CONSTANT XNOR_gate_delay : TIME := 4ns;
    CONSTANT NOT_gate_delay : TIME := 3ns;

    SIGNAL MS_not : STD_LOGIC_VECTOR (2 DOWNTO 0);

    SIGNAL and00, and01, and02, and03 : STD_LOGIC;

    SIGNAL and10, and11, and12, and13 : STD_LOGIC;
    SIGNAL and14, and15, and16, and17 : STD_LOGIC;

    SIGNAL and20, and21, and22, and23 : STD_LOGIC;
    SIGNAL and24, and25, and26, and27 : STD_LOGIC;

    SIGNAL l1or0, l1or1, l1or2, l1or3 : STD_LOGIC;
    SIGNAL l2or0, l2or1 : STD_LOGIC;

BEGIN
    MS_not(0) <= NOT MS(0) AFTER NOT_gate_delay;
    MS_not(1) <= NOT MS(1) AFTER NOT_gate_delay;
    MS_not(2) <= NOT MS(2) AFTER NOT_gate_delay;

    and00 <= MS_not(2) AND MS_not(1) AFTER AND_gate_delay;
    and10 <= and00 AND MS_not(0) AFTER AND_gate_delay;
    and20 <= and10 AND Zero AFTER AND_gate_delay;
    and11 <= and00 AND MS(0) AFTER AND_gate_delay;
    and21 <= and11 AND One AFTER AND_gate_delay;

    and01 <= MS_not(2) AND MS(1) AFTER AND_gate_delay;
    and12 <= and01 AND MS_not(0) AFTER AND_gate_delay;
    and22 <= and12 AND C AFTER AND_gate_delay;
    and13 <= and01 AND MS(0) AFTER AND_gate_delay;
    and23 <= and13 AND V AFTER AND_gate_delay;

    and02 <= MS(2) AND MS_not(1) AFTER AND_gate_delay;
    and14 <= and02 AND MS_not(0) AFTER AND_gate_delay;
    and24 <= and14 AND Z AFTER AND_gate_delay;
    and15 <= and02 AND MS(0) AFTER AND_gate_delay;
    and25 <= and15 AND N AFTER AND_gate_delay;

    and03 <= MS(2) AND MS(1) AFTER AND_gate_delay;
    and16 <= and03 AND MS_not(0) AFTER AND_gate_delay;
    and26 <= and16 AND Not_C AFTER AND_gate_delay;
    and17 <= and03 AND MS(0) AFTER AND_gate_delay;
    and27 <= and17 AND Not_Z AFTER AND_gate_delay;

    l1or0 <= and20 OR and21 AFTER OR_gate_delay;
    l1or1 <= and22 OR and23 AFTER OR_gate_delay;
    l1or2 <= and24 OR and25 AFTER OR_gate_delay;
    l1or3 <= and26 OR and27 AFTER OR_gate_delay;

    l2or0 <= l1or0 OR l1or1 AFTER OR_gate_delay;
    l2or1 <= l1or2 OR l1or3 AFTER OR_gate_delay;

    Y <= l2or0 OR l2or1 AFTER OR_gate_delay;

END Behavioral;