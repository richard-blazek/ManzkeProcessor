----------------------------------------------------------------------------------
-- Engineer: Richard Blažek
-- Create Date: 11/06/2023 02:43:10 PM
-- Module Name: DP_32bit_LogicCircuit - Behavioral
----------------------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;

ENTITY DP_32bit_LogicCircuit IS
    PORT (
        A, B : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
        S0, S1 : IN STD_LOGIC;
        Y : OUT STD_LOGIC_VECTOR (31 DOWNTO 0));
END DP_32bit_LogicCircuit;

ARCHITECTURE Behavioral OF DP_32bit_LogicCircuit IS
    COMPONENT DP_SingleBit_LogicCircuit IS
        PORT (
            A, B, S0, S1 : IN STD_LOGIC;
            Y : OUT STD_LOGIC);
    END COMPONENT;

BEGIN
    BIT00 : DP_SingleBit_LogicCircuit PORT MAP(A => A(0), B => B(0), S0 => S0, S1 => S1, Y => Y(0));
    BIT01 : DP_SingleBit_LogicCircuit PORT MAP(A => A(1), B => B(1), S0 => S0, S1 => S1, Y => Y(1));
    BIT02 : DP_SingleBit_LogicCircuit PORT MAP(A => A(2), B => B(2), S0 => S0, S1 => S1, Y => Y(2));
    BIT03 : DP_SingleBit_LogicCircuit PORT MAP(A => A(3), B => B(3), S0 => S0, S1 => S1, Y => Y(3));
    BIT04 : DP_SingleBit_LogicCircuit PORT MAP(A => A(4), B => B(4), S0 => S0, S1 => S1, Y => Y(4));
    BIT05 : DP_SingleBit_LogicCircuit PORT MAP(A => A(5), B => B(5), S0 => S0, S1 => S1, Y => Y(5));
    BIT06 : DP_SingleBit_LogicCircuit PORT MAP(A => A(6), B => B(6), S0 => S0, S1 => S1, Y => Y(6));
    BIT07 : DP_SingleBit_LogicCircuit PORT MAP(A => A(7), B => B(7), S0 => S0, S1 => S1, Y => Y(7));
    BIT08 : DP_SingleBit_LogicCircuit PORT MAP(A => A(8), B => B(8), S0 => S0, S1 => S1, Y => Y(8));
    BIT09 : DP_SingleBit_LogicCircuit PORT MAP(A => A(9), B => B(9), S0 => S0, S1 => S1, Y => Y(9));
    BIT10 : DP_SingleBit_LogicCircuit PORT MAP(A => A(10), B => B(10), S0 => S0, S1 => S1, Y => Y(10));
    BIT11 : DP_SingleBit_LogicCircuit PORT MAP(A => A(11), B => B(11), S0 => S0, S1 => S1, Y => Y(11));
    BIT12 : DP_SingleBit_LogicCircuit PORT MAP(A => A(12), B => B(12), S0 => S0, S1 => S1, Y => Y(12));
    BIT13 : DP_SingleBit_LogicCircuit PORT MAP(A => A(13), B => B(13), S0 => S0, S1 => S1, Y => Y(13));
    BIT14 : DP_SingleBit_LogicCircuit PORT MAP(A => A(14), B => B(14), S0 => S0, S1 => S1, Y => Y(14));
    BIT15 : DP_SingleBit_LogicCircuit PORT MAP(A => A(15), B => B(15), S0 => S0, S1 => S1, Y => Y(15));
    BIT16 : DP_SingleBit_LogicCircuit PORT MAP(A => A(16), B => B(16), S0 => S0, S1 => S1, Y => Y(16));
    BIT17 : DP_SingleBit_LogicCircuit PORT MAP(A => A(17), B => B(17), S0 => S0, S1 => S1, Y => Y(17));
    BIT18 : DP_SingleBit_LogicCircuit PORT MAP(A => A(18), B => B(18), S0 => S0, S1 => S1, Y => Y(18));
    BIT19 : DP_SingleBit_LogicCircuit PORT MAP(A => A(19), B => B(19), S0 => S0, S1 => S1, Y => Y(19));
    BIT20 : DP_SingleBit_LogicCircuit PORT MAP(A => A(20), B => B(20), S0 => S0, S1 => S1, Y => Y(20));
    BIT21 : DP_SingleBit_LogicCircuit PORT MAP(A => A(21), B => B(21), S0 => S0, S1 => S1, Y => Y(21));
    BIT22 : DP_SingleBit_LogicCircuit PORT MAP(A => A(22), B => B(22), S0 => S0, S1 => S1, Y => Y(22));
    BIT23 : DP_SingleBit_LogicCircuit PORT MAP(A => A(23), B => B(23), S0 => S0, S1 => S1, Y => Y(23));
    BIT24 : DP_SingleBit_LogicCircuit PORT MAP(A => A(24), B => B(24), S0 => S0, S1 => S1, Y => Y(24));
    BIT25 : DP_SingleBit_LogicCircuit PORT MAP(A => A(25), B => B(25), S0 => S0, S1 => S1, Y => Y(25));
    BIT26 : DP_SingleBit_LogicCircuit PORT MAP(A => A(26), B => B(26), S0 => S0, S1 => S1, Y => Y(26));
    BIT27 : DP_SingleBit_LogicCircuit PORT MAP(A => A(27), B => B(27), S0 => S0, S1 => S1, Y => Y(27));
    BIT28 : DP_SingleBit_LogicCircuit PORT MAP(A => A(28), B => B(28), S0 => S0, S1 => S1, Y => Y(28));
    BIT29 : DP_SingleBit_LogicCircuit PORT MAP(A => A(29), B => B(29), S0 => S0, S1 => S1, Y => Y(29));
    BIT30 : DP_SingleBit_LogicCircuit PORT MAP(A => A(30), B => B(30), S0 => S0, S1 => S1, Y => Y(30));
    BIT31 : DP_SingleBit_LogicCircuit PORT MAP(A => A(31), B => B(31), S0 => S0, S1 => S1, Y => Y(31));

END Behavioral;