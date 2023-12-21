----------------------------------------------------------------------------------
-- Engineer: Richard Blažek
-- Create Date: 10/17/2023 06:25:35 PM
-- Module Name: RF_Mux16_1bit - Behavioral
----------------------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;

ENTITY RF_Mux16_1bit IS
    PORT (
        I0, I1, I2, I3, I4, I5, I6, I7 : IN STD_LOGIC;
        I8, I9, I10, I11, I12, I13, I14, I15 : IN STD_LOGIC;
        S : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
        Y : OUT STD_LOGIC);
END RF_Mux16_1bit;

ARCHITECTURE Behavioral OF RF_Mux16_1bit IS
    COMPONENT RF_Mux2_1bit IS
        PORT (
            I0, I1, S : IN STD_LOGIC;
            Y : OUT STD_LOGIC);
    END COMPONENT;

    SIGNAL B0, B1, B00, B01, B10, B11, B000, B001, B010, B011, B100, B101, B110, B111 : STD_LOGIC;

BEGIN
    twomuxB000 : RF_Mux2_1bit PORT MAP(I0 => I0, I1 => I1, S => S(0), Y => B000);
    twomuxB001 : RF_Mux2_1bit PORT MAP(I0 => I2, I1 => I3, S => S(0), Y => B001);
    twomuxB010 : RF_Mux2_1bit PORT MAP(I0 => I4, I1 => I5, S => S(0), Y => B010);
    twomuxB011 : RF_Mux2_1bit PORT MAP(I0 => I6, I1 => I7, S => S(0), Y => B011);
    twomuxB100 : RF_Mux2_1bit PORT MAP(I0 => I8, I1 => I9, S => S(0), Y => B100);
    twomuxB101 : RF_Mux2_1bit PORT MAP(I0 => I10, I1 => I11, S => S(0), Y => B101);
    twomuxB110 : RF_Mux2_1bit PORT MAP(I0 => I12, I1 => I13, S => S(0), Y => B110);
    twomuxB111 : RF_Mux2_1bit PORT MAP(I0 => I14, I1 => I15, S => S(0), Y => B111);

    twomuxB00 : RF_Mux2_1bit PORT MAP(I0 => B000, I1 => B001, S => S(1), Y => B00);
    twomuxB01 : RF_Mux2_1bit PORT MAP(I0 => B010, I1 => B011, S => S(1), Y => B01);
    twomuxB10 : RF_Mux2_1bit PORT MAP(I0 => B100, I1 => B101, S => S(1), Y => B10);
    twomuxB11 : RF_Mux2_1bit PORT MAP(I0 => B110, I1 => B111, S => S(1), Y => B11);

    twomuxB0 : RF_Mux2_1bit PORT MAP(I0 => B00, I1 => B01, S => S(2), Y => B0);
    twomuxB1 : RF_Mux2_1bit PORT MAP(I0 => B10, I1 => B11, S => S(2), Y => B1);

    twomuxY : RF_Mux2_1bit PORT MAP(I0 => B0, I1 => B1, S => S(3), Y => Y);
END Behavioral;