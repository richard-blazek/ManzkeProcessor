----------------------------------------------------------------------------------
-- Engineer: Richard Blažek
-- Create Date: 11/28/2023 05:03:49 PM
-- Module Name: CPU_Mux2_17Bit - Behavioral
----------------------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;

ENTITY CPU_Mux2_17Bit IS
    PORT (
        I0, I1 : IN STD_LOGIC_VECTOR (16 DOWNTO 0);
        S : IN STD_LOGIC;
        Y : OUT STD_LOGIC_VECTOR (16 DOWNTO 0));
END CPU_Mux2_17Bit;

ARCHITECTURE Behavioral OF CPU_Mux2_17Bit IS
    CONSTANT AND_gate_delay : TIME := 9ns;
    CONSTANT NAND_gate_delay : TIME := 7ns;
    CONSTANT OR_gate_delay : TIME := 7ns;
    CONSTANT NOR_gate_delay : TIME := 8ns;
    CONSTANT XOR_gate_delay : TIME := 4ns;
    CONSTANT XNOR_gate_delay : TIME := 4ns;
    CONSTANT NOT_gate_delay : TIME := 3ns;

    SIGNAL I0_delayed, I1_delayed, I0_EN, I1_EN : STD_LOGIC_VECTOR (16 DOWNTO 0);
    SIGNAL S_on, S_off : STD_LOGIC;
BEGIN

    S_off <= NOT S AFTER NOT_gate_delay;
    S_on <= S AFTER NOT_gate_delay;

    I0_delayed(0) <= I0(0) AFTER NOT_gate_delay;
    I1_delayed(0) <= I1(0) AFTER NOT_gate_delay;
    I0_EN(0) <= I0_delayed(0) AND S_off AFTER AND_gate_delay;
    I1_EN(0) <= I1_delayed(0) AND S_on AFTER AND_gate_delay;
    Y(0) <= I0_EN(0) OR I1_EN(0) AFTER OR_gate_delay;

    I0_delayed(1) <= I0(1) AFTER NOT_gate_delay;
    I1_delayed(1) <= I1(1) AFTER NOT_gate_delay;
    I0_EN(1) <= I0_delayed(1) AND S_off AFTER AND_gate_delay;
    I1_EN(1) <= I1_delayed(1) AND S_on AFTER AND_gate_delay;
    Y(1) <= I0_EN(1) OR I1_EN(1) AFTER OR_gate_delay;
    I0_delayed(2) <= I0(2) AFTER NOT_gate_delay;
    I1_delayed(2) <= I1(2) AFTER NOT_gate_delay;
    I0_EN(2) <= I0_delayed(2) AND S_off AFTER AND_gate_delay;
    I1_EN(2) <= I1_delayed(2) AND S_on AFTER AND_gate_delay;
    Y(2) <= I0_EN(2) OR I1_EN(2) AFTER OR_gate_delay;
    I0_delayed(3) <= I0(3) AFTER NOT_gate_delay;
    I1_delayed(3) <= I1(3) AFTER NOT_gate_delay;
    I0_EN(3) <= I0_delayed(3) AND S_off AFTER AND_gate_delay;
    I1_EN(3) <= I1_delayed(3) AND S_on AFTER AND_gate_delay;
    Y(3) <= I0_EN(3) OR I1_EN(3) AFTER OR_gate_delay;
    I0_delayed(4) <= I0(4) AFTER NOT_gate_delay;
    I1_delayed(4) <= I1(4) AFTER NOT_gate_delay;
    I0_EN(4) <= I0_delayed(4) AND S_off AFTER AND_gate_delay;
    I1_EN(4) <= I1_delayed(4) AND S_on AFTER AND_gate_delay;
    Y(4) <= I0_EN(4) OR I1_EN(4) AFTER OR_gate_delay;
    I0_delayed(5) <= I0(5) AFTER NOT_gate_delay;
    I1_delayed(5) <= I1(5) AFTER NOT_gate_delay;
    I0_EN(5) <= I0_delayed(5) AND S_off AFTER AND_gate_delay;
    I1_EN(5) <= I1_delayed(5) AND S_on AFTER AND_gate_delay;
    Y(5) <= I0_EN(5) OR I1_EN(5) AFTER OR_gate_delay;
    I0_delayed(6) <= I0(6) AFTER NOT_gate_delay;
    I1_delayed(6) <= I1(6) AFTER NOT_gate_delay;
    I0_EN(6) <= I0_delayed(6) AND S_off AFTER AND_gate_delay;
    I1_EN(6) <= I1_delayed(6) AND S_on AFTER AND_gate_delay;
    Y(6) <= I0_EN(6) OR I1_EN(6) AFTER OR_gate_delay;
    I0_delayed(7) <= I0(7) AFTER NOT_gate_delay;
    I1_delayed(7) <= I1(7) AFTER NOT_gate_delay;
    I0_EN(7) <= I0_delayed(7) AND S_off AFTER AND_gate_delay;
    I1_EN(7) <= I1_delayed(7) AND S_on AFTER AND_gate_delay;
    Y(7) <= I0_EN(7) OR I1_EN(7) AFTER OR_gate_delay;
    I0_delayed(8) <= I0(8) AFTER NOT_gate_delay;
    I1_delayed(8) <= I1(8) AFTER NOT_gate_delay;
    I0_EN(8) <= I0_delayed(8) AND S_off AFTER AND_gate_delay;
    I1_EN(8) <= I1_delayed(8) AND S_on AFTER AND_gate_delay;
    Y(8) <= I0_EN(8) OR I1_EN(8) AFTER OR_gate_delay;
    I0_delayed(9) <= I0(9) AFTER NOT_gate_delay;
    I1_delayed(9) <= I1(9) AFTER NOT_gate_delay;
    I0_EN(9) <= I0_delayed(9) AND S_off AFTER AND_gate_delay;
    I1_EN(9) <= I1_delayed(9) AND S_on AFTER AND_gate_delay;
    Y(9) <= I0_EN(9) OR I1_EN(9) AFTER OR_gate_delay;
    I0_delayed(10) <= I0(10) AFTER NOT_gate_delay;
    I1_delayed(10) <= I1(10) AFTER NOT_gate_delay;
    I0_EN(10) <= I0_delayed(10) AND S_off AFTER AND_gate_delay;
    I1_EN(10) <= I1_delayed(10) AND S_on AFTER AND_gate_delay;
    Y(10) <= I0_EN(10) OR I1_EN(10) AFTER OR_gate_delay;
    I0_delayed(11) <= I0(11) AFTER NOT_gate_delay;
    I1_delayed(11) <= I1(11) AFTER NOT_gate_delay;
    I0_EN(11) <= I0_delayed(11) AND S_off AFTER AND_gate_delay;
    I1_EN(11) <= I1_delayed(11) AND S_on AFTER AND_gate_delay;
    Y(11) <= I0_EN(11) OR I1_EN(11) AFTER OR_gate_delay;
    I0_delayed(12) <= I0(12) AFTER NOT_gate_delay;
    I1_delayed(12) <= I1(12) AFTER NOT_gate_delay;
    I0_EN(12) <= I0_delayed(12) AND S_off AFTER AND_gate_delay;
    I1_EN(12) <= I1_delayed(12) AND S_on AFTER AND_gate_delay;
    Y(12) <= I0_EN(12) OR I1_EN(12) AFTER OR_gate_delay;
    I0_delayed(13) <= I0(13) AFTER NOT_gate_delay;
    I1_delayed(13) <= I1(13) AFTER NOT_gate_delay;
    I0_EN(13) <= I0_delayed(13) AND S_off AFTER AND_gate_delay;
    I1_EN(13) <= I1_delayed(13) AND S_on AFTER AND_gate_delay;
    Y(13) <= I0_EN(13) OR I1_EN(13) AFTER OR_gate_delay;
    I0_delayed(14) <= I0(14) AFTER NOT_gate_delay;
    I1_delayed(14) <= I1(14) AFTER NOT_gate_delay;
    I0_EN(14) <= I0_delayed(14) AND S_off AFTER AND_gate_delay;
    I1_EN(14) <= I1_delayed(14) AND S_on AFTER AND_gate_delay;
    Y(14) <= I0_EN(14) OR I1_EN(14) AFTER OR_gate_delay;
    I0_delayed(15) <= I0(15) AFTER NOT_gate_delay;
    I1_delayed(15) <= I1(15) AFTER NOT_gate_delay;
    I0_EN(15) <= I0_delayed(15) AND S_off AFTER AND_gate_delay;
    I1_EN(15) <= I1_delayed(15) AND S_on AFTER AND_gate_delay;
    Y(15) <= I0_EN(15) OR I1_EN(15) AFTER OR_gate_delay;
    I0_delayed(16) <= I0(16) AFTER NOT_gate_delay;
    I1_delayed(16) <= I1(16) AFTER NOT_gate_delay;
    I0_EN(16) <= I0_delayed(16) AND S_off AFTER AND_gate_delay;
    I1_EN(16) <= I1_delayed(16) AND S_on AFTER AND_gate_delay;
    Y(16) <= I0_EN(16) OR I1_EN(16) AFTER OR_gate_delay;

END Behavioral;