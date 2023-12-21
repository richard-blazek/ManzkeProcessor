----------------------------------------------------------------------------------
-- Engineer: Richard Blažek 
-- Create Date: 10/17/2023 06:41:17 PM
-- Module Name: RF_Mux32_1bit - Behavioral
----------------------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;

ENTITY RF_Mux32_1bit IS
    PORT (
        I0, I1, I2, I3, I4, I5, I6, I7 : IN STD_LOGIC;
        I8, I9, I10, I11, I12, I13, I14, I15 : IN STD_LOGIC;
        I16, I17, I18, I19, I20, I21, I22, I23 : IN STD_LOGIC;
        I24, I25, I26, I27, I28, I29, I30, I31 : IN STD_LOGIC;
        S : IN STD_LOGIC_VECTOR (4 DOWNTO 0);
        Y : OUT STD_LOGIC);
END RF_Mux32_1bit;

ARCHITECTURE Behavioral OF RF_Mux32_1bit IS
    COMPONENT RF_Mux16_1bit IS
        PORT (
            I0, I1, I2, I3, I4, I5, I6, I7 : IN STD_LOGIC;
            I8, I9, I10, I11, I12, I13, I14, I15 : IN STD_LOGIC;
            S : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
            Y : OUT STD_LOGIC);
    END COMPONENT;
    COMPONENT RF_Mux2_1bit IS
        PORT (
            I0, I1, S : IN STD_LOGIC;
            Y : OUT STD_LOGIC);
    END COMPONENT;
    SIGNAL B0, B1 : STD_LOGIC;

BEGIN
    mux0 : RF_Mux16_1bit PORT MAP(
        S => S(3 DOWNTO 0),
        I0 => I0, I1 => I1, I2 => I2, I3 => I3, I4 => I4, I5 => I5, I6 => I6, I7 => I7,
        I8 => I8, I9 => I9, I10 => I10, I11 => I11, I12 => I12, I13 => I13, I14 => I14, I15 => I15,
        Y => B0
    );
    mux1 : RF_Mux16_1bit PORT MAP(
        S => S(3 DOWNTO 0),
        I0 => I16, I1 => I17, I2 => I18, I3 => I19, I4 => I20, I5 => I21, I6 => I22, I7 => I23,
        I8 => I24, I9 => I25, I10 => I26, I11 => I27, I12 => I28, I13 => I29, I14 => I30, I15 => I31,
        Y => B1
    );
    twomux : RF_Mux2_1bit PORT MAP(I0 => B0, I1 => B1, S => S(4), Y => Y);
END Behavioral;