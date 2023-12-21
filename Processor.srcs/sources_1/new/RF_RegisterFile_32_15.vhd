----------------------------------------------------------------------------------
-- Engineer: Richard Blažek
-- Create Date: 10/20/2023 02:50:47 PM
-- Module Name: RF_RegisterFile_32_15 - Behavioral
----------------------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;

ENTITY RF_RegisterFile_32_15 IS
    PORT (
        SA, SB, DR : IN STD_LOGIC_VECTOR (4 DOWNTO 0);
        TA, TB, TD : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
        D : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
        RW, Clock, Reset : IN STD_LOGIC;
        A, B : OUT STD_LOGIC_VECTOR (31 DOWNTO 0));
END RF_RegisterFile_32_15;

ARCHITECTURE Behavioral OF RF_RegisterFile_32_15 IS

    COMPONENT RF_Register32bit
        PORT (
            Clock, Load, Reset : IN STD_LOGIC;
            D : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
            Q : OUT STD_LOGIC_VECTOR(31 DOWNTO 0));
    END COMPONENT;

    COMPONENT RF_DestReg_Decoder IS
        PORT (
            I : IN STD_LOGIC_VECTOR (4 DOWNTO 0);
            O0, O1, O2, O3, O4, O5, O6, O7 : OUT STD_LOGIC;
            O8, O9, O10, O11, O12, O13, O14, O15 : OUT STD_LOGIC;
            O16, O17, O18, O19, O20, O21, O22, O23 : OUT STD_LOGIC;
            O24, O25, O26, O27, O28, O29, O30, O31 : OUT STD_LOGIC);
    END COMPONENT;

    COMPONENT RF_TempDestReg_Decoder IS
        PORT (
            I : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
            O0, O1, O2, O3, O4, O5, O6, O7 : OUT STD_LOGIC;
            O8, O9, O10, O11, O12, O13, O14, O15 : OUT STD_LOGIC);
    END COMPONENT;

    COMPONENT RF_Mux32_32bit IS
        PORT (
            I0, I1, I2, I3, I4, I5, I6, I7 : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
            I8, I9, I10, I11, I12, I13, I14, I15 : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
            I16, I17, I18, I19, I20, I21, I22, I23 : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
            I24, I25, I26, I27, I28, I29, I30, I31 : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
            S : IN STD_LOGIC_VECTOR (4 DOWNTO 0);
            Y : OUT STD_LOGIC_VECTOR (31 DOWNTO 0));
    END COMPONENT;

    COMPONENT RF_Mux16_32bit IS
        PORT (
            I0, I1, I2, I3, I4, I5, I6, I7 : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
            I8, I9, I10, I11, I12, I13, I14, I15 : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
            S : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
            Y : OUT STD_LOGIC_VECTOR (31 DOWNTO 0));
    END COMPONENT;

    CONSTANT AND_gate_delay : TIME := 9ns;
    CONSTANT NAND_gate_delay : TIME := 7ns;
    CONSTANT OR_gate_delay : TIME := 7ns;
    CONSTANT NOR_gate_delay : TIME := 8ns;
    CONSTANT XOR_gate_delay : TIME := 4ns;
    CONSTANT XNOR_gate_delay : TIME := 4ns;
    CONSTANT NOT_gate_delay : TIME := 3ns;

    SIGNAL DR0, DR1, DR2, DR3, DR4, DR5, DR6, DR7, DR8, DR9, DR10, DR11, DR12, DR13, DR14, DR15 : STD_LOGIC;
    SIGNAL DR16, DR17, DR18, DR19, DR20, DR21, DR22, DR23, DR24, DR25, DR26, DR27, DR28, DR29, DR30, DR31 : STD_LOGIC;
    SIGNAL TD0, TD1, TD2, TD3, TD4, TD5, TD6, TD7, TD8, TD9, TD10, TD11, TD12, TD13, TD14, TD15 : STD_LOGIC;

    SIGNAL DR0_and_RW, DR1_and_RW, DR2_and_RW, DR3_and_RW, DR4_and_RW, DR5_and_RW, DR6_and_RW, DR7_and_RW : STD_LOGIC;
    SIGNAL DR8_and_RW, DR9_and_RW, DR10_and_RW, DR11_and_RW, DR12_and_RW, DR13_and_RW, DR14_and_RW, DR15_and_RW : STD_LOGIC;
    SIGNAL DR16_and_RW, DR17_and_RW, DR18_and_RW, DR19_and_RW, DR20_and_RW, DR21_and_RW, DR22_and_RW, DR23_and_RW : STD_LOGIC;
    SIGNAL DR24_and_RW, DR25_and_RW, DR26_and_RW, DR27_and_RW, DR28_and_RW, DR29_and_RW, DR30_and_RW, DR31_and_RW : STD_LOGIC;

    SIGNAL DR0_EN, DR1_EN, DR2_EN, DR3_EN, DR4_EN, DR5_EN, DR6_EN, DR7_EN : STD_LOGIC;
    SIGNAL DR8_EN, DR9_EN, DR10_EN, DR11_EN, DR12_EN, DR13_EN, DR14_EN, DR15_EN : STD_LOGIC;
    SIGNAL DR16_EN, DR17_EN, DR18_EN, DR19_EN, DR20_EN, DR21_EN, DR22_EN, DR23_EN : STD_LOGIC;
    SIGNAL DR24_EN, DR25_EN, DR26_EN, DR27_EN, DR28_EN, DR29_EN, DR30_EN, DR31_EN : STD_LOGIC;
    SIGNAL TD0_EN, TD1_EN, TD2_EN, TD3_EN, TD4_EN, TD5_EN, TD6_EN, TD7_EN : STD_LOGIC;
    SIGNAL TD8_EN, TD9_EN, TD10_EN, TD11_EN, TD12_EN, TD13_EN, TD14_EN, TD15_EN : STD_LOGIC;

    SIGNAL Q_R0, Q_R1, Q_R2, Q_R3, Q_R4, Q_R5, Q_R6, Q_R7 : STD_LOGIC_VECTOR (31 DOWNTO 0);
    SIGNAL Q_R8, Q_R9, Q_R10, Q_R11, Q_R12, Q_R13, Q_R14, Q_R15 : STD_LOGIC_VECTOR (31 DOWNTO 0);
    SIGNAL Q_R16, Q_R17, Q_R18, Q_R19, Q_R20, Q_R21, Q_R22, Q_R23 : STD_LOGIC_VECTOR (31 DOWNTO 0);
    SIGNAL Q_R24, Q_R25, Q_R26, Q_R27, Q_R28, Q_R29, Q_R30, Q_R31 : STD_LOGIC_VECTOR (31 DOWNTO 0);
    SIGNAL Q_T0, Q_T1, Q_T2, Q_T3, Q_T4, Q_T5, Q_T6, Q_T7 : STD_LOGIC_VECTOR (31 DOWNTO 0);
    SIGNAL Q_T8, Q_T9, Q_T10, Q_T11, Q_T12, Q_T13, Q_T14, Q_T15 : STD_LOGIC_VECTOR (31 DOWNTO 0);

    SIGNAL A_R, B_R : STD_LOGIC_VECTOR (31 DOWNTO 0);

BEGIN
    tdDecoder : RF_TempDestReg_Decoder PORT MAP(
        I => TD,
        O0 => TD0, O1 => TD1, O2 => TD2, O3 => TD3, O4 => TD4, O5 => TD5, O6 => TD6, O7 => TD7,
        O8 => TD8, O9 => TD9, O10 => TD10, O11 => TD11, O12 => TD12, O13 => TD13, O14 => TD14, O15 => TD15
    );
    drDecoder : RF_DestReg_Decoder PORT MAP(
        I => DR,
        O0 => DR0, O1 => DR1, O2 => DR2, O3 => DR3, O4 => DR4, O5 => DR5, O6 => DR6, O7 => DR7,
        O8 => DR8, O9 => DR9, O10 => DR10, O11 => DR11, O12 => DR12, O13 => DR13, O14 => DR14, O15 => DR15,
        O16 => DR16, O17 => DR17, O18 => DR18, O19 => DR19, O20 => DR20, O21 => DR21, O22 => DR22, O23 => DR23,
        O24 => DR24, O25 => DR25, O26 => DR26, O27 => DR27, O28 => DR28, O29 => DR29, O30 => DR30, O31 => DR31
    );

    DR0_and_RW <= DR0 AND RW AFTER AND_gate_delay;
    DR1_and_RW <= DR1 AND RW AFTER AND_gate_delay;
    DR2_and_RW <= DR2 AND RW AFTER AND_gate_delay;
    DR3_and_RW <= DR3 AND RW AFTER AND_gate_delay;
    DR4_and_RW <= DR4 AND RW AFTER AND_gate_delay;
    DR5_and_RW <= DR5 AND RW AFTER AND_gate_delay;
    DR6_and_RW <= DR6 AND RW AFTER AND_gate_delay;
    DR7_and_RW <= DR7 AND RW AFTER AND_gate_delay;
    DR8_and_RW <= DR8 AND RW AFTER AND_gate_delay;
    DR9_and_RW <= DR9 AND RW AFTER AND_gate_delay;
    DR10_and_RW <= DR10 AND RW AFTER AND_gate_delay;
    DR11_and_RW <= DR11 AND RW AFTER AND_gate_delay;
    DR12_and_RW <= DR12 AND RW AFTER AND_gate_delay;
    DR13_and_RW <= DR13 AND RW AFTER AND_gate_delay;
    DR14_and_RW <= DR14 AND RW AFTER AND_gate_delay;
    DR15_and_RW <= DR15 AND RW AFTER AND_gate_delay;
    DR16_and_RW <= DR16 AND RW AFTER AND_gate_delay;
    DR17_and_RW <= DR17 AND RW AFTER AND_gate_delay;
    DR18_and_RW <= DR18 AND RW AFTER AND_gate_delay;
    DR19_and_RW <= DR19 AND RW AFTER AND_gate_delay;
    DR20_and_RW <= DR20 AND RW AFTER AND_gate_delay;
    DR21_and_RW <= DR21 AND RW AFTER AND_gate_delay;
    DR22_and_RW <= DR22 AND RW AFTER AND_gate_delay;
    DR23_and_RW <= DR23 AND RW AFTER AND_gate_delay;
    DR24_and_RW <= DR24 AND RW AFTER AND_gate_delay;
    DR25_and_RW <= DR25 AND RW AFTER AND_gate_delay;
    DR26_and_RW <= DR26 AND RW AFTER AND_gate_delay;
    DR27_and_RW <= DR27 AND RW AFTER AND_gate_delay;
    DR28_and_RW <= DR28 AND RW AFTER AND_gate_delay;
    DR29_and_RW <= DR29 AND RW AFTER AND_gate_delay;
    DR30_and_RW <= DR30 AND RW AFTER AND_gate_delay;
    DR31_and_RW <= DR31 AND RW AFTER AND_gate_delay;

    DR0_EN <= DR0_and_RW AND TD0 AFTER AND_gate_delay;
    DR1_EN <= DR1_and_RW AND TD0 AFTER AND_gate_delay;
    DR2_EN <= DR2_and_RW AND TD0 AFTER AND_gate_delay;
    DR3_EN <= DR3_and_RW AND TD0 AFTER AND_gate_delay;
    DR4_EN <= DR4_and_RW AND TD0 AFTER AND_gate_delay;
    DR5_EN <= DR5_and_RW AND TD0 AFTER AND_gate_delay;
    DR6_EN <= DR6_and_RW AND TD0 AFTER AND_gate_delay;
    DR7_EN <= DR7_and_RW AND TD0 AFTER AND_gate_delay;
    DR8_EN <= DR8_and_RW AND TD0 AFTER AND_gate_delay;
    DR9_EN <= DR9_and_RW AND TD0 AFTER AND_gate_delay;
    DR10_EN <= DR10_and_RW AND TD0 AFTER AND_gate_delay;
    DR11_EN <= DR11_and_RW AND TD0 AFTER AND_gate_delay;
    DR12_EN <= DR12_and_RW AND TD0 AFTER AND_gate_delay;
    DR13_EN <= DR13_and_RW AND TD0 AFTER AND_gate_delay;
    DR14_EN <= DR14_and_RW AND TD0 AFTER AND_gate_delay;
    DR15_EN <= DR15_and_RW AND TD0 AFTER AND_gate_delay;
    DR16_EN <= DR16_and_RW AND TD0 AFTER AND_gate_delay;
    DR17_EN <= DR17_and_RW AND TD0 AFTER AND_gate_delay;
    DR18_EN <= DR18_and_RW AND TD0 AFTER AND_gate_delay;
    DR19_EN <= DR19_and_RW AND TD0 AFTER AND_gate_delay;
    DR20_EN <= DR20_and_RW AND TD0 AFTER AND_gate_delay;
    DR21_EN <= DR21_and_RW AND TD0 AFTER AND_gate_delay;
    DR22_EN <= DR22_and_RW AND TD0 AFTER AND_gate_delay;
    DR23_EN <= DR23_and_RW AND TD0 AFTER AND_gate_delay;
    DR24_EN <= DR24_and_RW AND TD0 AFTER AND_gate_delay;
    DR25_EN <= DR25_and_RW AND TD0 AFTER AND_gate_delay;
    DR26_EN <= DR26_and_RW AND TD0 AFTER AND_gate_delay;
    DR27_EN <= DR27_and_RW AND TD0 AFTER AND_gate_delay;
    DR28_EN <= DR28_and_RW AND TD0 AFTER AND_gate_delay;
    DR29_EN <= DR29_and_RW AND TD0 AFTER AND_gate_delay;
    DR30_EN <= DR30_and_RW AND TD0 AFTER AND_gate_delay;
    DR31_EN <= DR31_and_RW AND TD0 AFTER AND_gate_delay;

    TD1_EN <= TD1 AND RW AFTER AND_gate_delay;
    TD2_EN <= TD2 AND RW AFTER AND_gate_delay;
    TD3_EN <= TD3 AND RW AFTER AND_gate_delay;
    TD4_EN <= TD4 AND RW AFTER AND_gate_delay;
    TD5_EN <= TD5 AND RW AFTER AND_gate_delay;
    TD6_EN <= TD6 AND RW AFTER AND_gate_delay;
    TD7_EN <= TD7 AND RW AFTER AND_gate_delay;
    TD8_EN <= TD8 AND RW AFTER AND_gate_delay;
    TD9_EN <= TD9 AND RW AFTER AND_gate_delay;
    TD10_EN <= TD10 AND RW AFTER AND_gate_delay;
    TD11_EN <= TD11 AND RW AFTER AND_gate_delay;
    TD12_EN <= TD12 AND RW AFTER AND_gate_delay;
    TD13_EN <= TD13 AND RW AFTER AND_gate_delay;
    TD14_EN <= TD14 AND RW AFTER AND_gate_delay;
    TD15_EN <= TD15 AND RW AFTER AND_gate_delay;

    regularRegister0 : RF_Register32bit PORT MAP(Clock => Clock, Reset => Reset, Load => DR0_EN, D => D, Q => Q_R0);
    regularRegister1 : RF_Register32bit PORT MAP(Clock => Clock, Reset => Reset, Load => DR1_EN, D => D, Q => Q_R1);
    regularRegister2 : RF_Register32bit PORT MAP(Clock => Clock, Reset => Reset, Load => DR2_EN, D => D, Q => Q_R2);
    regularRegister3 : RF_Register32bit PORT MAP(Clock => Clock, Reset => Reset, Load => DR3_EN, D => D, Q => Q_R3);
    regularRegister4 : RF_Register32bit PORT MAP(Clock => Clock, Reset => Reset, Load => DR4_EN, D => D, Q => Q_R4);
    regularRegister5 : RF_Register32bit PORT MAP(Clock => Clock, Reset => Reset, Load => DR5_EN, D => D, Q => Q_R5);
    regularRegister6 : RF_Register32bit PORT MAP(Clock => Clock, Reset => Reset, Load => DR6_EN, D => D, Q => Q_R6);
    regularRegister7 : RF_Register32bit PORT MAP(Clock => Clock, Reset => Reset, Load => DR7_EN, D => D, Q => Q_R7);
    regularRegister8 : RF_Register32bit PORT MAP(Clock => Clock, Reset => Reset, Load => DR8_EN, D => D, Q => Q_R8);
    regularRegister9 : RF_Register32bit PORT MAP(Clock => Clock, Reset => Reset, Load => DR9_EN, D => D, Q => Q_R9);
    regularRegister10 : RF_Register32bit PORT MAP(Clock => Clock, Reset => Reset, Load => DR10_EN, D => D, Q => Q_R10);
    regularRegister11 : RF_Register32bit PORT MAP(Clock => Clock, Reset => Reset, Load => DR11_EN, D => D, Q => Q_R11);
    regularRegister12 : RF_Register32bit PORT MAP(Clock => Clock, Reset => Reset, Load => DR12_EN, D => D, Q => Q_R12);
    regularRegister13 : RF_Register32bit PORT MAP(Clock => Clock, Reset => Reset, Load => DR13_EN, D => D, Q => Q_R13);
    regularRegister14 : RF_Register32bit PORT MAP(Clock => Clock, Reset => Reset, Load => DR14_EN, D => D, Q => Q_R14);
    regularRegister15 : RF_Register32bit PORT MAP(Clock => Clock, Reset => Reset, Load => DR15_EN, D => D, Q => Q_R15);
    regularRegister16 : RF_Register32bit PORT MAP(Clock => Clock, Reset => Reset, Load => DR16_EN, D => D, Q => Q_R16);
    regularRegister17 : RF_Register32bit PORT MAP(Clock => Clock, Reset => Reset, Load => DR17_EN, D => D, Q => Q_R17);
    regularRegister18 : RF_Register32bit PORT MAP(Clock => Clock, Reset => Reset, Load => DR18_EN, D => D, Q => Q_R18);
    regularRegister19 : RF_Register32bit PORT MAP(Clock => Clock, Reset => Reset, Load => DR19_EN, D => D, Q => Q_R19);
    regularRegister20 : RF_Register32bit PORT MAP(Clock => Clock, Reset => Reset, Load => DR20_EN, D => D, Q => Q_R20);
    regularRegister21 : RF_Register32bit PORT MAP(Clock => Clock, Reset => Reset, Load => DR21_EN, D => D, Q => Q_R21);
    regularRegister22 : RF_Register32bit PORT MAP(Clock => Clock, Reset => Reset, Load => DR22_EN, D => D, Q => Q_R22);
    regularRegister23 : RF_Register32bit PORT MAP(Clock => Clock, Reset => Reset, Load => DR23_EN, D => D, Q => Q_R23);
    regularRegister24 : RF_Register32bit PORT MAP(Clock => Clock, Reset => Reset, Load => DR24_EN, D => D, Q => Q_R24);
    regularRegister25 : RF_Register32bit PORT MAP(Clock => Clock, Reset => Reset, Load => DR25_EN, D => D, Q => Q_R25);
    regularRegister26 : RF_Register32bit PORT MAP(Clock => Clock, Reset => Reset, Load => DR26_EN, D => D, Q => Q_R26);
    regularRegister27 : RF_Register32bit PORT MAP(Clock => Clock, Reset => Reset, Load => DR27_EN, D => D, Q => Q_R27);
    regularRegister28 : RF_Register32bit PORT MAP(Clock => Clock, Reset => Reset, Load => DR28_EN, D => D, Q => Q_R28);
    regularRegister29 : RF_Register32bit PORT MAP(Clock => Clock, Reset => Reset, Load => DR29_EN, D => D, Q => Q_R29);
    regularRegister30 : RF_Register32bit PORT MAP(Clock => Clock, Reset => Reset, Load => DR30_EN, D => D, Q => Q_R30);
    regularRegister31 : RF_Register32bit PORT MAP(Clock => Clock, Reset => Reset, Load => DR31_EN, D => D, Q => Q_R31);

    tempRegister1 : RF_Register32bit PORT MAP(Clock => Clock, Reset => Reset, Load => TD1_EN, D => D, Q => Q_T1);
    tempRegister2 : RF_Register32bit PORT MAP(Clock => Clock, Reset => Reset, Load => TD2_EN, D => D, Q => Q_T2);
    tempRegister3 : RF_Register32bit PORT MAP(Clock => Clock, Reset => Reset, Load => TD3_EN, D => D, Q => Q_T3);
    tempRegister4 : RF_Register32bit PORT MAP(Clock => Clock, Reset => Reset, Load => TD4_EN, D => D, Q => Q_T4);
    tempRegister5 : RF_Register32bit PORT MAP(Clock => Clock, Reset => Reset, Load => TD5_EN, D => D, Q => Q_T5);
    tempRegister6 : RF_Register32bit PORT MAP(Clock => Clock, Reset => Reset, Load => TD6_EN, D => D, Q => Q_T6);
    tempRegister7 : RF_Register32bit PORT MAP(Clock => Clock, Reset => Reset, Load => TD7_EN, D => D, Q => Q_T7);
    tempRegister8 : RF_Register32bit PORT MAP(Clock => Clock, Reset => Reset, Load => TD8_EN, D => D, Q => Q_T8);
    tempRegister9 : RF_Register32bit PORT MAP(Clock => Clock, Reset => Reset, Load => TD9_EN, D => D, Q => Q_T9);
    tempRegister10 : RF_Register32bit PORT MAP(Clock => Clock, Reset => Reset, Load => TD10_EN, D => D, Q => Q_T10);
    tempRegister11 : RF_Register32bit PORT MAP(Clock => Clock, Reset => Reset, Load => TD11_EN, D => D, Q => Q_T11);
    tempRegister12 : RF_Register32bit PORT MAP(Clock => Clock, Reset => Reset, Load => TD12_EN, D => D, Q => Q_T12);
    tempRegister13 : RF_Register32bit PORT MAP(Clock => Clock, Reset => Reset, Load => TD13_EN, D => D, Q => Q_T13);
    tempRegister14 : RF_Register32bit PORT MAP(Clock => Clock, Reset => Reset, Load => TD14_EN, D => D, Q => Q_T14);
    tempRegister15 : RF_Register32bit PORT MAP(Clock => Clock, Reset => Reset, Load => TD15_EN, D => D, Q => Q_T15);

    muxA_R : RF_Mux32_32bit PORT MAP(
        S => SA,
        I0 => Q_R0, I1 => Q_R1, I2 => Q_R2, I3 => Q_R3, I4 => Q_R4, I5 => Q_R5, I6 => Q_R6, I7 => Q_R7,
        I8 => Q_R8, I9 => Q_R9, I10 => Q_R10, I11 => Q_R11, I12 => Q_R12, I13 => Q_R13, I14 => Q_R14, I15 => Q_R15,
        I16 => Q_R16, I17 => Q_R17, I18 => Q_R18, I19 => Q_R19, I20 => Q_R20, I21 => Q_R21, I22 => Q_R22, I23 => Q_R23,
        I24 => Q_R24, I25 => Q_R25, I26 => Q_R26, I27 => Q_R27, I28 => Q_R28, I29 => Q_R29, I30 => Q_R30, I31 => Q_R31,
        Y => A_R
    );
    muxB_R : RF_Mux32_32bit PORT MAP(
        S => SB,
        I0 => Q_R0, I1 => Q_R1, I2 => Q_R2, I3 => Q_R3, I4 => Q_R4, I5 => Q_R5, I6 => Q_R6, I7 => Q_R7,
        I8 => Q_R8, I9 => Q_R9, I10 => Q_R10, I11 => Q_R11, I12 => Q_R12, I13 => Q_R13, I14 => Q_R14, I15 => Q_R15,
        I16 => Q_R16, I17 => Q_R17, I18 => Q_R18, I19 => Q_R19, I20 => Q_R20, I21 => Q_R21, I22 => Q_R22, I23 => Q_R23,
        I24 => Q_R24, I25 => Q_R25, I26 => Q_R26, I27 => Q_R27, I28 => Q_R28, I29 => Q_R29, I30 => Q_R30, I31 => Q_R31,
        Y => B_R
    );
    muxA_T : RF_Mux16_32bit PORT MAP(
        S => TA,
        I0 => A_R, I1 => Q_T1, I2 => Q_T2, I3 => Q_T3, I4 => Q_T4, I5 => Q_T5, I6 => Q_T6, I7 => Q_T7,
        I8 => Q_T8, I9 => Q_T9, I10 => Q_T10, I11 => Q_T11, I12 => Q_T12, I13 => Q_T13, I14 => Q_T14, I15 => Q_T15,
        Y => A
    );
    muxB_T : RF_Mux16_32bit PORT MAP(
        S => TB,
        I0 => B_R, I1 => Q_T1, I2 => Q_T2, I3 => Q_T3, I4 => Q_T4, I5 => Q_T5, I6 => Q_T6, I7 => Q_T7,
        I8 => Q_T8, I9 => Q_T9, I10 => Q_T10, I11 => Q_T11, I12 => Q_T12, I13 => Q_T13, I14 => Q_T14, I15 => Q_T15,
        Y => B
    );
END Behavioral;