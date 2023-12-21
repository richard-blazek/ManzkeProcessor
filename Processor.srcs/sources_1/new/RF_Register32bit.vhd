----------------------------------------------------------------------------------
-- Engineer: Richard Blažek 
-- Create Date: 10/06/2023 04:37:40 PM
-- Module Name: RF_Register32bit - Behavioral
----------------------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;

ENTITY RF_Register32bit IS
    PORT (
        Clock, Load, Reset : IN STD_LOGIC;
        D : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
        Q : OUT STD_LOGIC_VECTOR(31 DOWNTO 0));
END RF_Register32bit;

ARCHITECTURE Behavioral OF RF_Register32bit IS
    CONSTANT AND_gate_delay : TIME := 9ns;
    CONSTANT NAND_gate_delay : TIME := 7ns;
    CONSTANT OR_gate_delay : TIME := 7ns;
    CONSTANT NOR_gate_delay : TIME := 8ns;
    CONSTANT XOR_gate_delay : TIME := 4ns;
    CONSTANT XNOR_gate_delay : TIME := 4ns;
    CONSTANT NOT_gate_delay : TIME := 3ns;

    COMPONENT CPU_DFlipFlop IS
        PORT (
            D, Clock, Reset : IN STD_LOGIC;
            Q : OUT STD_LOGIC);
    END COMPONENT;

    SIGNAL not_Load : STD_LOGIC;
    SIGNAL Q_tmp, Q_keep, D_load, D_new : STD_LOGIC_VECTOR (31 DOWNTO 0);

BEGIN
    not_Load <= NOT Load AFTER NOT_gate_delay;
    Q_keep <= Q_tmp AND (31 DOWNTO 0 => not_Load) AFTER AND_gate_delay;
    D_load <= D AND (31 DOWNTO 0 => Load) AFTER AND_gate_delay;
    D_new <= Q_keep OR D_load AFTER OR_gate_delay;

    Bit0 : CPU_DFlipFlop PORT MAP(Clock => Clock, Reset => Reset, D => D_new(0), Q => Q_tmp(0));
    Bit1 : CPU_DFlipFlop PORT MAP(Clock => Clock, Reset => Reset, D => D_new(1), Q => Q_tmp(1));
    Bit2 : CPU_DFlipFlop PORT MAP(Clock => Clock, Reset => Reset, D => D_new(2), Q => Q_tmp(2));
    Bit3 : CPU_DFlipFlop PORT MAP(Clock => Clock, Reset => Reset, D => D_new(3), Q => Q_tmp(3));
    Bit4 : CPU_DFlipFlop PORT MAP(Clock => Clock, Reset => Reset, D => D_new(4), Q => Q_tmp(4));
    Bit5 : CPU_DFlipFlop PORT MAP(Clock => Clock, Reset => Reset, D => D_new(5), Q => Q_tmp(5));
    Bit6 : CPU_DFlipFlop PORT MAP(Clock => Clock, Reset => Reset, D => D_new(6), Q => Q_tmp(6));
    Bit7 : CPU_DFlipFlop PORT MAP(Clock => Clock, Reset => Reset, D => D_new(7), Q => Q_tmp(7));
    Bit8 : CPU_DFlipFlop PORT MAP(Clock => Clock, Reset => Reset, D => D_new(8), Q => Q_tmp(8));
    Bit9 : CPU_DFlipFlop PORT MAP(Clock => Clock, Reset => Reset, D => D_new(9), Q => Q_tmp(9));
    Bit10 : CPU_DFlipFlop PORT MAP(Clock => Clock, Reset => Reset, D => D_new(10), Q => Q_tmp(10));
    Bit11 : CPU_DFlipFlop PORT MAP(Clock => Clock, Reset => Reset, D => D_new(11), Q => Q_tmp(11));
    Bit12 : CPU_DFlipFlop PORT MAP(Clock => Clock, Reset => Reset, D => D_new(12), Q => Q_tmp(12));
    Bit13 : CPU_DFlipFlop PORT MAP(Clock => Clock, Reset => Reset, D => D_new(13), Q => Q_tmp(13));
    Bit14 : CPU_DFlipFlop PORT MAP(Clock => Clock, Reset => Reset, D => D_new(14), Q => Q_tmp(14));
    Bit15 : CPU_DFlipFlop PORT MAP(Clock => Clock, Reset => Reset, D => D_new(15), Q => Q_tmp(15));
    Bit16 : CPU_DFlipFlop PORT MAP(Clock => Clock, Reset => Reset, D => D_new(16), Q => Q_tmp(16));
    Bit17 : CPU_DFlipFlop PORT MAP(Clock => Clock, Reset => Reset, D => D_new(17), Q => Q_tmp(17));
    Bit18 : CPU_DFlipFlop PORT MAP(Clock => Clock, Reset => Reset, D => D_new(18), Q => Q_tmp(18));
    Bit19 : CPU_DFlipFlop PORT MAP(Clock => Clock, Reset => Reset, D => D_new(19), Q => Q_tmp(19));
    Bit20 : CPU_DFlipFlop PORT MAP(Clock => Clock, Reset => Reset, D => D_new(20), Q => Q_tmp(20));
    Bit21 : CPU_DFlipFlop PORT MAP(Clock => Clock, Reset => Reset, D => D_new(21), Q => Q_tmp(21));
    Bit22 : CPU_DFlipFlop PORT MAP(Clock => Clock, Reset => Reset, D => D_new(22), Q => Q_tmp(22));
    Bit23 : CPU_DFlipFlop PORT MAP(Clock => Clock, Reset => Reset, D => D_new(23), Q => Q_tmp(23));
    Bit24 : CPU_DFlipFlop PORT MAP(Clock => Clock, Reset => Reset, D => D_new(24), Q => Q_tmp(24));
    Bit25 : CPU_DFlipFlop PORT MAP(Clock => Clock, Reset => Reset, D => D_new(25), Q => Q_tmp(25));
    Bit26 : CPU_DFlipFlop PORT MAP(Clock => Clock, Reset => Reset, D => D_new(26), Q => Q_tmp(26));
    Bit27 : CPU_DFlipFlop PORT MAP(Clock => Clock, Reset => Reset, D => D_new(27), Q => Q_tmp(27));
    Bit28 : CPU_DFlipFlop PORT MAP(Clock => Clock, Reset => Reset, D => D_new(28), Q => Q_tmp(28));
    Bit29 : CPU_DFlipFlop PORT MAP(Clock => Clock, Reset => Reset, D => D_new(29), Q => Q_tmp(29));
    Bit30 : CPU_DFlipFlop PORT MAP(Clock => Clock, Reset => Reset, D => D_new(30), Q => Q_tmp(30));
    Bit31 : CPU_DFlipFlop PORT MAP(Clock => Clock, Reset => Reset, D => D_new(31), Q => Q_tmp(31));

    Q <= Q_tmp;
END Behavioral;