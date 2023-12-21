----------------------------------------------------------------------------------
-- Engineer: Richard Blažek 
-- Create Date: 11/03/2023 10:28:10 AM
-- Module Name: DP_RippleCarryAdder32Bit - Behavioral
----------------------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;

ENTITY DP_RippleCarryAdder32Bit IS
    PORT (
        A, B : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
        C_in : IN STD_LOGIC;
        SUM : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
        C_out, V : OUT STD_LOGIC);
END DP_RippleCarryAdder32Bit;

ARCHITECTURE Behavioral OF DP_RippleCarryAdder32Bit IS
    COMPONENT DP_FullAdder IS
        PORT (
            X, Y, Z : IN STD_LOGIC;
            S, C : OUT STD_LOGIC);
    END COMPONENT;

    CONSTANT AND_gate_delay : TIME := 9ns;
    CONSTANT NAND_gate_delay : TIME := 7ns;
    CONSTANT OR_gate_delay : TIME := 7ns;
    CONSTANT NOR_gate_delay : TIME := 8ns;
    CONSTANT XOR_gate_delay : TIME := 4ns;
    CONSTANT XNOR_gate_delay : TIME := 4ns;
    CONSTANT NOT_gate_delay : TIME := 3ns;

    SIGNAL A_delayed, B_delayed, SUM_tmp : STD_LOGIC_VECTOR (31 DOWNTO 0);
    SIGNAL C_30_delayed : STD_LOGIC;
    SIGNAL C_0, C_1, C_2, C_3, C_4, C_5, C_6, C_7, C_8, C_9, C_10, C_11, C_12, C_13, C_14, C_15 : STD_LOGIC;
    SIGNAL C_16, C_17, C_18, C_19, C_20, C_21, C_22, C_23, C_24, C_25, C_26, C_27, C_28, C_29, C_30, C_31 : STD_LOGIC;

BEGIN
    A_delayed(0) <= A(0);
    B_delayed(0) <= B(0);
    A_delayed(1) <= A(1) AFTER 23ns;
    B_delayed(1) <= B(1) AFTER 23ns;
    A_delayed(2) <= A(2) AFTER 46ns;
    B_delayed(2) <= B(2) AFTER 46ns;
    A_delayed(3) <= A(3) AFTER 69ns;
    B_delayed(3) <= B(3) AFTER 69ns;
    A_delayed(4) <= A(4) AFTER 92ns;
    B_delayed(4) <= B(4) AFTER 92ns;
    A_delayed(5) <= A(5) AFTER 115ns;
    B_delayed(5) <= B(5) AFTER 115ns;
    A_delayed(6) <= A(6) AFTER 138ns;
    B_delayed(6) <= B(6) AFTER 138ns;
    A_delayed(7) <= A(7) AFTER 161ns;
    B_delayed(7) <= B(7) AFTER 161ns;
    A_delayed(8) <= A(8) AFTER 184ns;
    B_delayed(8) <= B(8) AFTER 184ns;
    A_delayed(9) <= A(9) AFTER 207ns;
    B_delayed(9) <= B(9) AFTER 207ns;
    A_delayed(10) <= A(10) AFTER 230ns;
    B_delayed(10) <= B(10) AFTER 230ns;
    A_delayed(11) <= A(11) AFTER 253ns;
    B_delayed(11) <= B(11) AFTER 253ns;
    A_delayed(12) <= A(12) AFTER 276ns;
    B_delayed(12) <= B(12) AFTER 276ns;
    A_delayed(13) <= A(13) AFTER 299ns;
    B_delayed(13) <= B(13) AFTER 299ns;
    A_delayed(14) <= A(14) AFTER 322ns;
    B_delayed(14) <= B(14) AFTER 322ns;
    A_delayed(15) <= A(15) AFTER 345ns;
    B_delayed(15) <= B(15) AFTER 345ns;
    A_delayed(16) <= A(16) AFTER 368ns;
    B_delayed(16) <= B(16) AFTER 368ns;
    A_delayed(17) <= A(17) AFTER 391ns;
    B_delayed(17) <= B(17) AFTER 391ns;
    A_delayed(18) <= A(18) AFTER 414ns;
    B_delayed(18) <= B(18) AFTER 414ns;
    A_delayed(19) <= A(19) AFTER 437ns;
    B_delayed(19) <= B(19) AFTER 437ns;
    A_delayed(20) <= A(20) AFTER 460ns;
    B_delayed(20) <= B(20) AFTER 460ns;
    A_delayed(21) <= A(21) AFTER 483ns;
    B_delayed(21) <= B(21) AFTER 483ns;
    A_delayed(22) <= A(22) AFTER 506ns;
    B_delayed(22) <= B(22) AFTER 506ns;
    A_delayed(23) <= A(23) AFTER 529ns;
    B_delayed(23) <= B(23) AFTER 529ns;
    A_delayed(24) <= A(24) AFTER 552ns;
    B_delayed(24) <= B(24) AFTER 552ns;
    A_delayed(25) <= A(25) AFTER 575ns;
    B_delayed(25) <= B(25) AFTER 575ns;
    A_delayed(26) <= A(26) AFTER 598ns;
    B_delayed(26) <= B(26) AFTER 598ns;
    A_delayed(27) <= A(27) AFTER 621ns;
    B_delayed(27) <= B(27) AFTER 621ns;
    A_delayed(28) <= A(28) AFTER 644ns;
    B_delayed(28) <= B(28) AFTER 644ns;
    A_delayed(29) <= A(29) AFTER 667ns;
    B_delayed(29) <= B(29) AFTER 667ns;
    A_delayed(30) <= A(30) AFTER 690ns;
    B_delayed(30) <= B(30) AFTER 690ns;
    A_delayed(31) <= A(31) AFTER 713ns;
    B_delayed(31) <= B(31) AFTER 713ns;

    BIT00 : DP_FullAdder PORT MAP(X => A_delayed(0), Y => B_delayed(0), Z => C_in, S => SUM_tmp(0), C => C_0);
    BIT01 : DP_FullAdder PORT MAP(X => A_delayed(1), Y => B_delayed(1), Z => C_0, S => SUM_tmp(1), C => C_1);
    BIT02 : DP_FullAdder PORT MAP(X => A_delayed(2), Y => B_delayed(2), Z => C_1, S => SUM_tmp(2), C => C_2);
    BIT03 : DP_FullAdder PORT MAP(X => A_delayed(3), Y => B_delayed(3), Z => C_2, S => SUM_tmp(3), C => C_3);
    BIT04 : DP_FullAdder PORT MAP(X => A_delayed(4), Y => B_delayed(4), Z => C_3, S => SUM_tmp(4), C => C_4);
    BIT05 : DP_FullAdder PORT MAP(X => A_delayed(5), Y => B_delayed(5), Z => C_4, S => SUM_tmp(5), C => C_5);
    BIT06 : DP_FullAdder PORT MAP(X => A_delayed(6), Y => B_delayed(6), Z => C_5, S => SUM_tmp(6), C => C_6);
    BIT07 : DP_FullAdder PORT MAP(X => A_delayed(7), Y => B_delayed(7), Z => C_6, S => SUM_tmp(7), C => C_7);
    BIT08 : DP_FullAdder PORT MAP(X => A_delayed(8), Y => B_delayed(8), Z => C_7, S => SUM_tmp(8), C => C_8);
    BIT09 : DP_FullAdder PORT MAP(X => A_delayed(9), Y => B_delayed(9), Z => C_8, S => SUM_tmp(9), C => C_9);
    BIT10 : DP_FullAdder PORT MAP(X => A_delayed(10), Y => B_delayed(10), Z => C_9, S => SUM_tmp(10), C => C_10);
    BIT11 : DP_FullAdder PORT MAP(X => A_delayed(11), Y => B_delayed(11), Z => C_10, S => SUM_tmp(11), C => C_11);
    BIT12 : DP_FullAdder PORT MAP(X => A_delayed(12), Y => B_delayed(12), Z => C_11, S => SUM_tmp(12), C => C_12);
    BIT13 : DP_FullAdder PORT MAP(X => A_delayed(13), Y => B_delayed(13), Z => C_12, S => SUM_tmp(13), C => C_13);
    BIT14 : DP_FullAdder PORT MAP(X => A_delayed(14), Y => B_delayed(14), Z => C_13, S => SUM_tmp(14), C => C_14);
    BIT15 : DP_FullAdder PORT MAP(X => A_delayed(15), Y => B_delayed(15), Z => C_14, S => SUM_tmp(15), C => C_15);
    BIT16 : DP_FullAdder PORT MAP(X => A_delayed(16), Y => B_delayed(16), Z => C_15, S => SUM_tmp(16), C => C_16);
    BIT17 : DP_FullAdder PORT MAP(X => A_delayed(17), Y => B_delayed(17), Z => C_16, S => SUM_tmp(17), C => C_17);
    BIT18 : DP_FullAdder PORT MAP(X => A_delayed(18), Y => B_delayed(18), Z => C_17, S => SUM_tmp(18), C => C_18);
    BIT19 : DP_FullAdder PORT MAP(X => A_delayed(19), Y => B_delayed(19), Z => C_18, S => SUM_tmp(19), C => C_19);
    BIT20 : DP_FullAdder PORT MAP(X => A_delayed(20), Y => B_delayed(20), Z => C_19, S => SUM_tmp(20), C => C_20);
    BIT21 : DP_FullAdder PORT MAP(X => A_delayed(21), Y => B_delayed(21), Z => C_20, S => SUM_tmp(21), C => C_21);
    BIT22 : DP_FullAdder PORT MAP(X => A_delayed(22), Y => B_delayed(22), Z => C_21, S => SUM_tmp(22), C => C_22);
    BIT23 : DP_FullAdder PORT MAP(X => A_delayed(23), Y => B_delayed(23), Z => C_22, S => SUM_tmp(23), C => C_23);
    BIT24 : DP_FullAdder PORT MAP(X => A_delayed(24), Y => B_delayed(24), Z => C_23, S => SUM_tmp(24), C => C_24);
    BIT25 : DP_FullAdder PORT MAP(X => A_delayed(25), Y => B_delayed(25), Z => C_24, S => SUM_tmp(25), C => C_25);
    BIT26 : DP_FullAdder PORT MAP(X => A_delayed(26), Y => B_delayed(26), Z => C_25, S => SUM_tmp(26), C => C_26);
    BIT27 : DP_FullAdder PORT MAP(X => A_delayed(27), Y => B_delayed(27), Z => C_26, S => SUM_tmp(27), C => C_27);
    BIT28 : DP_FullAdder PORT MAP(X => A_delayed(28), Y => B_delayed(28), Z => C_27, S => SUM_tmp(28), C => C_28);
    BIT29 : DP_FullAdder PORT MAP(X => A_delayed(29), Y => B_delayed(29), Z => C_28, S => SUM_tmp(29), C => C_29);
    BIT30 : DP_FullAdder PORT MAP(X => A_delayed(30), Y => B_delayed(30), Z => C_29, S => SUM_tmp(30), C => C_30);
    BIT31 : DP_FullAdder PORT MAP(X => A_delayed(31), Y => B_delayed(31), Z => C_30, S => SUM_tmp(31), C => C_31);

    SUM(0) <= SUM_tmp(0) AFTER 717ns;
    SUM(1) <= SUM_tmp(1) AFTER 694ns;
    SUM(2) <= SUM_tmp(2) AFTER 671ns;
    SUM(3) <= SUM_tmp(3) AFTER 648ns;
    SUM(4) <= SUM_tmp(4) AFTER 625ns;
    SUM(5) <= SUM_tmp(5) AFTER 602ns;
    SUM(6) <= SUM_tmp(6) AFTER 579ns;
    SUM(7) <= SUM_tmp(7) AFTER 556ns;
    SUM(8) <= SUM_tmp(8) AFTER 533ns;
    SUM(9) <= SUM_tmp(9) AFTER 510ns;
    SUM(10) <= SUM_tmp(10) AFTER 487ns;
    SUM(11) <= SUM_tmp(11) AFTER 464ns;
    SUM(12) <= SUM_tmp(12) AFTER 441ns;
    SUM(13) <= SUM_tmp(13) AFTER 418ns;
    SUM(14) <= SUM_tmp(14) AFTER 395ns;
    SUM(15) <= SUM_tmp(15) AFTER 372ns;
    SUM(16) <= SUM_tmp(16) AFTER 349ns;
    SUM(17) <= SUM_tmp(17) AFTER 326ns;
    SUM(18) <= SUM_tmp(18) AFTER 303ns;
    SUM(19) <= SUM_tmp(19) AFTER 280ns;
    SUM(20) <= SUM_tmp(20) AFTER 257ns;
    SUM(21) <= SUM_tmp(21) AFTER 234ns;
    SUM(22) <= SUM_tmp(22) AFTER 211ns;
    SUM(23) <= SUM_tmp(23) AFTER 188ns;
    SUM(24) <= SUM_tmp(24) AFTER 165ns;
    SUM(25) <= SUM_tmp(25) AFTER 142ns;
    SUM(26) <= SUM_tmp(26) AFTER 119ns;
    SUM(27) <= SUM_tmp(27) AFTER 96ns;
    SUM(28) <= SUM_tmp(28) AFTER 73ns;
    SUM(29) <= SUM_tmp(29) AFTER 50ns;
    SUM(30) <= SUM_tmp(30) AFTER 27ns;
    SUM(31) <= SUM_tmp(31) AFTER 4ns;

    C_out <= C_31 AFTER 4ns;
    C_30_delayed <= C_30 AFTER 23ns;
    V <= C_31 XOR C_30_delayed AFTER XOR_gate_delay;

END Behavioral;