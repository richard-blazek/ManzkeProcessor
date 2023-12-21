----------------------------------------------------------------------------------
-- Engineer: Richard Blažek 
-- Create Date: 10/20/2023 02:21:13 PM
-- Module Name: RF_TempDestReg_Decoder - Behavioral
----------------------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;

ENTITY RF_TempDestReg_Decoder IS
    PORT (
        I : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
        O0, O1, O2, O3, O4, O5, O6, O7 : OUT STD_LOGIC;
        O8, O9, O10, O11, O12, O13, O14, O15 : OUT STD_LOGIC);
END RF_TempDestReg_Decoder;

ARCHITECTURE Behavioral OF RF_TempDestReg_Decoder IS
    --  Propagation Delay according to Student ID - 22 337 668(DEC)
    CONSTANT AND_gate_delay : TIME := 9ns;
    CONSTANT NAND_gate_delay : TIME := 7ns;
    CONSTANT OR_gate_delay : TIME := 7ns;
    CONSTANT NOR_gate_delay : TIME := 8ns;
    CONSTANT XOR_gate_delay : TIME := 4ns;
    CONSTANT XNOR_gate_delay : TIME := 4ns;
    CONSTANT NOT_gate_delay : TIME := 3ns;

    SIGNAL on_I0, on_I1, on_I2, on_I3 : STD_LOGIC;
    SIGNAL off_I0, off_I1, off_I2, off_I3 : STD_LOGIC;

    SIGNAL I0, I1, I00, I01, I10, I11, I000, I001, I010, I011, I100, I101, I110, I111 : STD_LOGIC;
    SIGNAL I0000, I0001, I0010, I0011, I0100, I0101, I0110, I0111 : STD_LOGIC;
    SIGNAL I1000, I1001, I1010, I1011, I1100, I1101, I1110, I1111 : STD_LOGIC;

BEGIN
    on_I0 <= I(0) AFTER NOT_gate_delay + AND_gate_delay * 2;
    on_I1 <= I(1) AFTER NOT_gate_delay + AND_gate_delay;
    on_I2 <= I(2) AFTER NOT_gate_delay;
    on_I3 <= I(3) AFTER NOT_gate_delay;

    off_I0 <= NOT I(0) AFTER NOT_gate_delay + AND_gate_delay * 2;
    off_I1 <= NOT I(1) AFTER NOT_gate_delay + AND_gate_delay;
    off_I2 <= NOT I(2) AFTER NOT_gate_delay;
    off_I3 <= NOT I(3) AFTER NOT_gate_delay;

    I0 <= off_I3;
    I1 <= on_I3;

    I00 <= I0 AND off_I2 AFTER AND_gate_delay;
    I01 <= I0 AND on_I2 AFTER AND_gate_delay;
    I10 <= I1 AND off_I2 AFTER AND_gate_delay;
    I11 <= I1 AND on_I2 AFTER AND_gate_delay;

    I000 <= I00 AND off_I1 AFTER AND_gate_delay;
    I001 <= I00 AND on_I1 AFTER AND_gate_delay;
    I010 <= I01 AND off_I1 AFTER AND_gate_delay;
    I011 <= I01 AND on_I1 AFTER AND_gate_delay;
    I100 <= I10 AND off_I1 AFTER AND_gate_delay;
    I101 <= I10 AND on_I1 AFTER AND_gate_delay;
    I110 <= I11 AND off_I1 AFTER AND_gate_delay;
    I111 <= I11 AND on_I1 AFTER AND_gate_delay;

    I0000 <= I000 AND off_I0 AFTER AND_gate_delay;
    I0001 <= I000 AND on_I0 AFTER AND_gate_delay;
    I0010 <= I001 AND off_I0 AFTER AND_gate_delay;
    I0011 <= I001 AND on_I0 AFTER AND_gate_delay;
    I0100 <= I010 AND off_I0 AFTER AND_gate_delay;
    I0101 <= I010 AND on_I0 AFTER AND_gate_delay;
    I0110 <= I011 AND off_I0 AFTER AND_gate_delay;
    I0111 <= I011 AND on_I0 AFTER AND_gate_delay;
    I1000 <= I100 AND off_I0 AFTER AND_gate_delay;
    I1001 <= I100 AND on_I0 AFTER AND_gate_delay;
    I1010 <= I101 AND off_I0 AFTER AND_gate_delay;
    I1011 <= I101 AND on_I0 AFTER AND_gate_delay;
    I1100 <= I110 AND off_I0 AFTER AND_gate_delay;
    I1101 <= I110 AND on_I0 AFTER AND_gate_delay;
    I1110 <= I111 AND off_I0 AFTER AND_gate_delay;
    I1111 <= I111 AND on_I0 AFTER AND_gate_delay;

    O0 <= I0000;
    O1 <= I0001;
    O2 <= I0010;
    O3 <= I0011;
    O4 <= I0100;
    O5 <= I0101;
    O6 <= I0110;
    O7 <= I0111;
    O8 <= I1000;
    O9 <= I1001;
    O10 <= I1010;
    O11 <= I1011;
    O12 <= I1100;
    O13 <= I1101;
    O14 <= I1110;
    O15 <= I1111;
END Behavioral;