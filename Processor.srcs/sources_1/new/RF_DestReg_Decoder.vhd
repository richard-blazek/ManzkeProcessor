----------------------------------------------------------------------------------
-- Engineer: Richard Blažek 
-- Create Date: 10/19/2023 01:37:04 PM
-- Module Name: RF_DestReg_Decoder - Behavioral
----------------------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;

ENTITY RF_DestReg_Decoder IS
    PORT (
        I : IN STD_LOGIC_VECTOR (4 DOWNTO 0);
        O0, O1, O2, O3, O4, O5, O6, O7 : OUT STD_LOGIC;
        O8, O9, O10, O11, O12, O13, O14, O15 : OUT STD_LOGIC;
        O16, O17, O18, O19, O20, O21, O22, O23 : OUT STD_LOGIC;
        O24, O25, O26, O27, O28, O29, O30, O31 : OUT STD_LOGIC);
END RF_DestReg_Decoder;

ARCHITECTURE Behavioral OF RF_DestReg_Decoder IS
    --  Propagation Delay according to Student ID - 22 337 668(DEC)
    CONSTANT AND_gate_delay : TIME := 9ns;
    CONSTANT NAND_gate_delay : TIME := 7ns;
    CONSTANT OR_gate_delay : TIME := 7ns;
    CONSTANT NOR_gate_delay : TIME := 8ns;
    CONSTANT XOR_gate_delay : TIME := 4ns;
    CONSTANT XNOR_gate_delay : TIME := 4ns;
    CONSTANT NOT_gate_delay : TIME := 3ns;

    SIGNAL on_I0, on_I1, on_I2, on_I3, on_I4 : STD_LOGIC;
    SIGNAL off_I0, off_I1, off_I2, off_I3, off_I4 : STD_LOGIC;

    SIGNAL I0, I1, I00, I01, I10, I11, I000, I001, I010, I011, I100, I101, I110, I111 : STD_LOGIC;
    SIGNAL I0000, I0001, I0010, I0011, I0100, I0101, I0110, I0111, I1000, I1001, I1010, I1011, I1100, I1101, I1110, I1111 : STD_LOGIC;
    SIGNAL I00000, I00001, I00010, I00011, I00100, I00101, I00110, I00111 : STD_LOGIC;
    SIGNAL I01000, I01001, I01010, I01011, I01100, I01101, I01110, I01111 : STD_LOGIC;
    SIGNAL I10000, I10001, I10010, I10011, I10100, I10101, I10110, I10111 : STD_LOGIC;
    SIGNAL I11000, I11001, I11010, I11011, I11100, I11101, I11110, I11111 : STD_LOGIC;

BEGIN
    on_I0 <= I(0) AFTER NOT_gate_delay + AND_gate_delay * 3;
    on_I1 <= I(1) AFTER NOT_gate_delay + AND_gate_delay * 2;
    on_I2 <= I(2) AFTER NOT_gate_delay + AND_gate_delay;
    on_I3 <= I(3) AFTER NOT_gate_delay;
    on_I4 <= I(4) AFTER NOT_gate_delay;

    off_I0 <= NOT I(0) AFTER NOT_gate_delay + AND_gate_delay * 3;
    off_I1 <= NOT I(1) AFTER NOT_gate_delay + AND_gate_delay * 2;
    off_I2 <= NOT I(2) AFTER NOT_gate_delay + AND_gate_delay;
    off_I3 <= NOT I(3) AFTER NOT_gate_delay;
    off_I4 <= NOT I(4) AFTER NOT_gate_delay;

    I0 <= off_I4;
    I1 <= on_I4;

    I00 <= I0 AND off_I3 AFTER AND_gate_delay;
    I01 <= I0 AND on_I3 AFTER AND_gate_delay;
    I10 <= I1 AND off_I3 AFTER AND_gate_delay;
    I11 <= I1 AND on_I3 AFTER AND_gate_delay;

    I000 <= I00 AND off_I2 AFTER AND_gate_delay;
    I001 <= I00 AND on_I2 AFTER AND_gate_delay;
    I010 <= I01 AND off_I2 AFTER AND_gate_delay;
    I011 <= I01 AND on_I2 AFTER AND_gate_delay;
    I100 <= I10 AND off_I2 AFTER AND_gate_delay;
    I101 <= I10 AND on_I2 AFTER AND_gate_delay;
    I110 <= I11 AND off_I2 AFTER AND_gate_delay;
    I111 <= I11 AND on_I2 AFTER AND_gate_delay;

    I0000 <= I000 AND off_I1 AFTER AND_gate_delay;
    I0001 <= I000 AND on_I1 AFTER AND_gate_delay;
    I0010 <= I001 AND off_I1 AFTER AND_gate_delay;
    I0011 <= I001 AND on_I1 AFTER AND_gate_delay;
    I0100 <= I010 AND off_I1 AFTER AND_gate_delay;
    I0101 <= I010 AND on_I1 AFTER AND_gate_delay;
    I0110 <= I011 AND off_I1 AFTER AND_gate_delay;
    I0111 <= I011 AND on_I1 AFTER AND_gate_delay;
    I1000 <= I100 AND off_I1 AFTER AND_gate_delay;
    I1001 <= I100 AND on_I1 AFTER AND_gate_delay;
    I1010 <= I101 AND off_I1 AFTER AND_gate_delay;
    I1011 <= I101 AND on_I1 AFTER AND_gate_delay;
    I1100 <= I110 AND off_I1 AFTER AND_gate_delay;
    I1101 <= I110 AND on_I1 AFTER AND_gate_delay;
    I1110 <= I111 AND off_I1 AFTER AND_gate_delay;
    I1111 <= I111 AND on_I1 AFTER AND_gate_delay;

    I00000 <= I0000 AND off_I0 AFTER AND_gate_delay;
    I00001 <= I0000 AND on_I0 AFTER AND_gate_delay;
    I00010 <= I0001 AND off_I0 AFTER AND_gate_delay;
    I00011 <= I0001 AND on_I0 AFTER AND_gate_delay;
    I00100 <= I0010 AND off_I0 AFTER AND_gate_delay;
    I00101 <= I0010 AND on_I0 AFTER AND_gate_delay;
    I00110 <= I0011 AND off_I0 AFTER AND_gate_delay;
    I00111 <= I0011 AND on_I0 AFTER AND_gate_delay;
    I01000 <= I0100 AND off_I0 AFTER AND_gate_delay;
    I01001 <= I0100 AND on_I0 AFTER AND_gate_delay;
    I01010 <= I0101 AND off_I0 AFTER AND_gate_delay;
    I01011 <= I0101 AND on_I0 AFTER AND_gate_delay;
    I01100 <= I0110 AND off_I0 AFTER AND_gate_delay;
    I01101 <= I0110 AND on_I0 AFTER AND_gate_delay;
    I01110 <= I0111 AND off_I0 AFTER AND_gate_delay;
    I01111 <= I0111 AND on_I0 AFTER AND_gate_delay;
    I10000 <= I1000 AND off_I0 AFTER AND_gate_delay;
    I10001 <= I1000 AND on_I0 AFTER AND_gate_delay;
    I10010 <= I1001 AND off_I0 AFTER AND_gate_delay;
    I10011 <= I1001 AND on_I0 AFTER AND_gate_delay;
    I10100 <= I1010 AND off_I0 AFTER AND_gate_delay;
    I10101 <= I1010 AND on_I0 AFTER AND_gate_delay;
    I10110 <= I1011 AND off_I0 AFTER AND_gate_delay;
    I10111 <= I1011 AND on_I0 AFTER AND_gate_delay;
    I11000 <= I1100 AND off_I0 AFTER AND_gate_delay;
    I11001 <= I1100 AND on_I0 AFTER AND_gate_delay;
    I11010 <= I1101 AND off_I0 AFTER AND_gate_delay;
    I11011 <= I1101 AND on_I0 AFTER AND_gate_delay;
    I11100 <= I1110 AND off_I0 AFTER AND_gate_delay;
    I11101 <= I1110 AND on_I0 AFTER AND_gate_delay;
    I11110 <= I1111 AND off_I0 AFTER AND_gate_delay;
    I11111 <= I1111 AND on_I0 AFTER AND_gate_delay;

    O0 <= I00000;
    O1 <= I00001;
    O2 <= I00010;
    O3 <= I00011;
    O4 <= I00100;
    O5 <= I00101;
    O6 <= I00110;
    O7 <= I00111;
    O8 <= I01000;
    O9 <= I01001;
    O10 <= I01010;
    O11 <= I01011;
    O12 <= I01100;
    O13 <= I01101;
    O14 <= I01110;
    O15 <= I01111;
    O16 <= I10000;
    O17 <= I10001;
    O18 <= I10010;
    O19 <= I10011;
    O20 <= I10100;
    O21 <= I10101;
    O22 <= I10110;
    O23 <= I10111;
    O24 <= I11000;
    O25 <= I11001;
    O26 <= I11010;
    O27 <= I11011;
    O28 <= I11100;
    O29 <= I11101;
    O30 <= I11110;
    O31 <= I11111;

END Behavioral;