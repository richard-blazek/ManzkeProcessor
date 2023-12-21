----------------------------------------------------------------------------------
-- Engineer: Richard Blažek
-- Create Date: 10/20/2023 04:12:19 PM
-- Module Name: RF_RegisterFile_32_15_TB - Simulation
----------------------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;

ENTITY RF_RegisterFile_32_15_TB IS
    --  Ports aren't needed for simulation
END RF_RegisterFile_32_15_TB;

ARCHITECTURE Simulation OF RF_RegisterFile_32_15_TB IS

    COMPONENT RF_RegisterFile_32_15
        PORT (
            SA, SB, DR : IN STD_LOGIC_VECTOR (4 DOWNTO 0);
            TA, TB, TD : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
            D : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
            RW, Clock, Reset : IN STD_LOGIC;
            A, B : OUT STD_LOGIC_VECTOR (31 DOWNTO 0));
    END COMPONENT;

    SIGNAL SA_TB, SB_TB, DR_TB : STD_LOGIC_VECTOR (4 DOWNTO 0) := "00000";
    SIGNAL TA_TB, TB_TB, TD_TB : STD_LOGIC_VECTOR (3 DOWNTO 0) := "0000";
    SIGNAL A_TB, B_TB, D_TB : STD_LOGIC_VECTOR (31 DOWNTO 0) := x"00000000";
    SIGNAL RW_TB, Clock_TB : STD_LOGIC := '0';

    CONSTANT StudentID : STD_LOGIC_VECTOR (27 DOWNTO 0) := x"154D884";
    CONSTANT PERIOD : TIME := 1000ns;

BEGIN
    uut : RF_RegisterFile_32_15 PORT MAP(
        SA => SA_TB,
        SB => SB_TB,
        DR => DR_TB,
        TA => TA_TB,
        TB => TB_TB,
        TD => TD_TB,
        A => A_TB,
        B => B_TB,
        D => D_TB,
        RW => RW_TB,
        Clock => Clock_TB,
        Reset => '0'
    );

    Clock_TB <= NOT Clock_TB AFTER PERIOD / 2;

    stim_proc : PROCESS BEGIN
        -- Regular reg. testing

        SA_TB <= "00000";
        SB_TB <= "00001";
        DR_TB <= "00000";
        TA_TB <= "0000";
        TB_TB <= "0000";
        TD_TB <= "0000";
        D_TB <= x"22337668";
        RW_TB <= '1';
        WAIT UNTIL Clock_TB'event AND Clock_TB = '1';
        WAIT FOR PERIOD / 2;

        SA_TB <= "00001";
        SB_TB <= "00010";
        DR_TB <= "00001";
        TA_TB <= "0000";
        TB_TB <= "0000";
        TD_TB <= "0000";
        D_TB <= x"22337669";
        RW_TB <= '1';
        WAIT UNTIL Clock_TB'event AND Clock_TB = '1';
        WAIT FOR PERIOD / 2;

        SA_TB <= "00010";
        SB_TB <= "00011";
        DR_TB <= "00010";
        TA_TB <= "0000";
        TB_TB <= "0000";
        TD_TB <= "0000";
        D_TB <= x"2233766a";
        RW_TB <= '1';
        WAIT UNTIL Clock_TB'event AND Clock_TB = '1';
        WAIT FOR PERIOD / 2;

        SA_TB <= "00011";
        SB_TB <= "00100";
        DR_TB <= "00011";
        TA_TB <= "0000";
        TB_TB <= "0000";
        TD_TB <= "0000";
        D_TB <= x"2233766b";
        RW_TB <= '1';
        WAIT UNTIL Clock_TB'event AND Clock_TB = '1';
        WAIT FOR PERIOD / 2;

        SA_TB <= "00100";
        SB_TB <= "00101";
        DR_TB <= "00100";
        TA_TB <= "0000";
        TB_TB <= "0000";
        TD_TB <= "0000";
        D_TB <= x"2233766c";
        RW_TB <= '1';
        WAIT UNTIL Clock_TB'event AND Clock_TB = '1';
        WAIT FOR PERIOD / 2;

        SA_TB <= "00101";
        SB_TB <= "00110";
        DR_TB <= "00101";
        TA_TB <= "0000";
        TB_TB <= "0000";
        TD_TB <= "0000";
        D_TB <= x"2233766d";
        RW_TB <= '1';
        WAIT UNTIL Clock_TB'event AND Clock_TB = '1';
        WAIT FOR PERIOD / 2;

        SA_TB <= "00110";
        SB_TB <= "00111";
        DR_TB <= "00110";
        TA_TB <= "0000";
        TB_TB <= "0000";
        TD_TB <= "0000";
        D_TB <= x"2233766e";
        RW_TB <= '1';
        WAIT UNTIL Clock_TB'event AND Clock_TB = '1';
        WAIT FOR PERIOD / 2;

        SA_TB <= "00111";
        SB_TB <= "01000";
        DR_TB <= "00111";
        TA_TB <= "0000";
        TB_TB <= "0000";
        TD_TB <= "0000";
        D_TB <= x"2233766f";
        RW_TB <= '1';
        WAIT UNTIL Clock_TB'event AND Clock_TB = '1';
        WAIT FOR PERIOD / 2;

        SA_TB <= "01000";
        SB_TB <= "01001";
        DR_TB <= "01000";
        TA_TB <= "0000";
        TB_TB <= "0000";
        TD_TB <= "0000";
        D_TB <= x"22337670";
        RW_TB <= '1';
        WAIT UNTIL Clock_TB'event AND Clock_TB = '1';
        WAIT FOR PERIOD / 2;

        SA_TB <= "01001";
        SB_TB <= "01010";
        DR_TB <= "01001";
        TA_TB <= "0000";
        TB_TB <= "0000";
        TD_TB <= "0000";
        D_TB <= x"22337671";
        RW_TB <= '1';
        WAIT UNTIL Clock_TB'event AND Clock_TB = '1';
        WAIT FOR PERIOD / 2;

        SA_TB <= "01010";
        SB_TB <= "01011";
        DR_TB <= "01010";
        TA_TB <= "0000";
        TB_TB <= "0000";
        TD_TB <= "0000";
        D_TB <= x"22337672";
        RW_TB <= '1';
        WAIT UNTIL Clock_TB'event AND Clock_TB = '1';
        WAIT FOR PERIOD / 2;

        SA_TB <= "01011";
        SB_TB <= "01100";
        DR_TB <= "01011";
        TA_TB <= "0000";
        TB_TB <= "0000";
        TD_TB <= "0000";
        D_TB <= x"22337673";
        RW_TB <= '1';
        WAIT UNTIL Clock_TB'event AND Clock_TB = '1';
        WAIT FOR PERIOD / 2;

        SA_TB <= "01100";
        SB_TB <= "01101";
        DR_TB <= "01100";
        TA_TB <= "0000";
        TB_TB <= "0000";
        TD_TB <= "0000";
        D_TB <= x"22337674";
        RW_TB <= '1';
        WAIT UNTIL Clock_TB'event AND Clock_TB = '1';
        WAIT FOR PERIOD / 2;

        SA_TB <= "01101";
        SB_TB <= "01110";
        DR_TB <= "01101";
        TA_TB <= "0000";
        TB_TB <= "0000";
        TD_TB <= "0000";
        D_TB <= x"22337675";
        RW_TB <= '1';
        WAIT UNTIL Clock_TB'event AND Clock_TB = '1';
        WAIT FOR PERIOD / 2;

        SA_TB <= "01110";
        SB_TB <= "01111";
        DR_TB <= "01110";
        TA_TB <= "0000";
        TB_TB <= "0000";
        TD_TB <= "0000";
        D_TB <= x"22337676";
        RW_TB <= '1';
        WAIT UNTIL Clock_TB'event AND Clock_TB = '1';
        WAIT FOR PERIOD / 2;

        SA_TB <= "01111";
        SB_TB <= "10000";
        DR_TB <= "01111";
        TA_TB <= "0000";
        TB_TB <= "0000";
        TD_TB <= "0000";
        D_TB <= x"22337677";
        RW_TB <= '1';
        WAIT UNTIL Clock_TB'event AND Clock_TB = '1';
        WAIT FOR PERIOD / 2;

        SA_TB <= "10000";
        SB_TB <= "10001";
        DR_TB <= "10000";
        TA_TB <= "0000";
        TB_TB <= "0000";
        TD_TB <= "0000";
        D_TB <= x"22337678";
        RW_TB <= '1';
        WAIT UNTIL Clock_TB'event AND Clock_TB = '1';
        WAIT FOR PERIOD / 2;

        SA_TB <= "10001";
        SB_TB <= "10010";
        DR_TB <= "10001";
        TA_TB <= "0000";
        TB_TB <= "0000";
        TD_TB <= "0000";
        D_TB <= x"22337679";
        RW_TB <= '1';
        WAIT UNTIL Clock_TB'event AND Clock_TB = '1';
        WAIT FOR PERIOD / 2;

        SA_TB <= "10010";
        SB_TB <= "10011";
        DR_TB <= "10010";
        TA_TB <= "0000";
        TB_TB <= "0000";
        TD_TB <= "0000";
        D_TB <= x"2233767a";
        RW_TB <= '1';
        WAIT UNTIL Clock_TB'event AND Clock_TB = '1';
        WAIT FOR PERIOD / 2;

        SA_TB <= "10011";
        SB_TB <= "10100";
        DR_TB <= "10011";
        TA_TB <= "0000";
        TB_TB <= "0000";
        TD_TB <= "0000";
        D_TB <= x"2233767b";
        RW_TB <= '1';
        WAIT UNTIL Clock_TB'event AND Clock_TB = '1';
        WAIT FOR PERIOD / 2;

        SA_TB <= "10100";
        SB_TB <= "10101";
        DR_TB <= "10100";
        TA_TB <= "0000";
        TB_TB <= "0000";
        TD_TB <= "0000";
        D_TB <= x"2233767c";
        RW_TB <= '1';
        WAIT UNTIL Clock_TB'event AND Clock_TB = '1';
        WAIT FOR PERIOD / 2;

        SA_TB <= "10101";
        SB_TB <= "10110";
        DR_TB <= "10101";
        TA_TB <= "0000";
        TB_TB <= "0000";
        TD_TB <= "0000";
        D_TB <= x"2233767d";
        RW_TB <= '1';
        WAIT UNTIL Clock_TB'event AND Clock_TB = '1';
        WAIT FOR PERIOD / 2;

        SA_TB <= "10110";
        SB_TB <= "10111";
        DR_TB <= "10110";
        TA_TB <= "0000";
        TB_TB <= "0000";
        TD_TB <= "0000";
        D_TB <= x"2233767e";
        RW_TB <= '1';
        WAIT UNTIL Clock_TB'event AND Clock_TB = '1';
        WAIT FOR PERIOD / 2;

        SA_TB <= "10111";
        SB_TB <= "11000";
        DR_TB <= "10111";
        TA_TB <= "0000";
        TB_TB <= "0000";
        TD_TB <= "0000";
        D_TB <= x"2233767f";
        RW_TB <= '1';
        WAIT UNTIL Clock_TB'event AND Clock_TB = '1';
        WAIT FOR PERIOD / 2;

        SA_TB <= "11000";
        SB_TB <= "11001";
        DR_TB <= "11000";
        TA_TB <= "0000";
        TB_TB <= "0000";
        TD_TB <= "0000";
        D_TB <= x"22337680";
        RW_TB <= '1';
        WAIT UNTIL Clock_TB'event AND Clock_TB = '1';
        WAIT FOR PERIOD / 2;

        SA_TB <= "11001";
        SB_TB <= "11010";
        DR_TB <= "11001";
        TA_TB <= "0000";
        TB_TB <= "0000";
        TD_TB <= "0000";
        D_TB <= x"22337681";
        RW_TB <= '1';
        WAIT UNTIL Clock_TB'event AND Clock_TB = '1';
        WAIT FOR PERIOD / 2;

        SA_TB <= "11010";
        SB_TB <= "11011";
        DR_TB <= "11010";
        TA_TB <= "0000";
        TB_TB <= "0000";
        TD_TB <= "0000";
        D_TB <= x"22337682";
        RW_TB <= '1';
        WAIT UNTIL Clock_TB'event AND Clock_TB = '1';
        WAIT FOR PERIOD / 2;

        SA_TB <= "11011";
        SB_TB <= "11100";
        DR_TB <= "11011";
        TA_TB <= "0000";
        TB_TB <= "0000";
        TD_TB <= "0000";
        D_TB <= x"22337683";
        RW_TB <= '1';
        WAIT UNTIL Clock_TB'event AND Clock_TB = '1';
        WAIT FOR PERIOD / 2;

        SA_TB <= "11100";
        SB_TB <= "11101";
        DR_TB <= "11100";
        TA_TB <= "0000";
        TB_TB <= "0000";
        TD_TB <= "0000";
        D_TB <= x"22337684";
        RW_TB <= '1';
        WAIT UNTIL Clock_TB'event AND Clock_TB = '1';
        WAIT FOR PERIOD / 2;

        SA_TB <= "11101";
        SB_TB <= "11110";
        DR_TB <= "11101";
        TA_TB <= "0000";
        TB_TB <= "0000";
        TD_TB <= "0000";
        D_TB <= x"22337685";
        RW_TB <= '1';
        WAIT UNTIL Clock_TB'event AND Clock_TB = '1';
        WAIT FOR PERIOD / 2;

        SA_TB <= "11110";
        SB_TB <= "11111";
        DR_TB <= "11110";
        TA_TB <= "0000";
        TB_TB <= "0000";
        TD_TB <= "0000";
        D_TB <= x"22337686";
        RW_TB <= '1';
        WAIT UNTIL Clock_TB'event AND Clock_TB = '1';
        WAIT FOR PERIOD / 2;

        SA_TB <= "11111";
        SB_TB <= "00000";
        DR_TB <= "11111";
        TA_TB <= "0000";
        TB_TB <= "0000";
        TD_TB <= "0000";
        D_TB <= x"22337687";
        RW_TB <= '1';
        WAIT UNTIL Clock_TB'event AND Clock_TB = '1';
        WAIT FOR PERIOD / 2;

        -- Temp reg. testing

        SA_TB <= "00000";
        SB_TB <= "00000";
        DR_TB <= "00000";
        TA_TB <= "0001";
        TB_TB <= "0010";
        TD_TB <= "0001";
        D_TB <= x"22337689";
        RW_TB <= '1';
        WAIT UNTIL Clock_TB'event AND Clock_TB = '1';
        WAIT FOR PERIOD / 2;

        SA_TB <= "00000";
        SB_TB <= "00000";
        DR_TB <= "00000";
        TA_TB <= "0010";
        TB_TB <= "0011";
        TD_TB <= "0010";
        D_TB <= x"2233768a";
        RW_TB <= '1';
        WAIT UNTIL Clock_TB'event AND Clock_TB = '1';
        WAIT FOR PERIOD / 2;

        SA_TB <= "00000";
        SB_TB <= "00000";
        DR_TB <= "00000";
        TA_TB <= "0011";
        TB_TB <= "0100";
        TD_TB <= "0011";
        D_TB <= x"2233768b";
        RW_TB <= '1';
        WAIT UNTIL Clock_TB'event AND Clock_TB = '1';
        WAIT FOR PERIOD / 2;

        SA_TB <= "00000";
        SB_TB <= "00000";
        DR_TB <= "00000";
        TA_TB <= "0100";
        TB_TB <= "0101";
        TD_TB <= "0100";
        D_TB <= x"2233768c";
        RW_TB <= '1';
        WAIT UNTIL Clock_TB'event AND Clock_TB = '1';
        WAIT FOR PERIOD / 2;

        SA_TB <= "00000";
        SB_TB <= "00000";
        DR_TB <= "00000";
        TA_TB <= "0101";
        TB_TB <= "0110";
        TD_TB <= "0101";
        D_TB <= x"2233768d";
        RW_TB <= '1';
        WAIT UNTIL Clock_TB'event AND Clock_TB = '1';
        WAIT FOR PERIOD / 2;

        SA_TB <= "00000";
        SB_TB <= "00000";
        DR_TB <= "00000";
        TA_TB <= "0110";
        TB_TB <= "0111";
        TD_TB <= "0110";
        D_TB <= x"2233768e";
        RW_TB <= '1';
        WAIT UNTIL Clock_TB'event AND Clock_TB = '1';
        WAIT FOR PERIOD / 2;

        SA_TB <= "00000";
        SB_TB <= "00000";
        DR_TB <= "00000";
        TA_TB <= "0111";
        TB_TB <= "1000";
        TD_TB <= "0111";
        D_TB <= x"2233768f";
        RW_TB <= '1';
        WAIT UNTIL Clock_TB'event AND Clock_TB = '1';
        WAIT FOR PERIOD / 2;

        SA_TB <= "00000";
        SB_TB <= "00000";
        DR_TB <= "00000";
        TA_TB <= "1000";
        TB_TB <= "1001";
        TD_TB <= "1000";
        D_TB <= x"22337690";
        RW_TB <= '1';
        WAIT UNTIL Clock_TB'event AND Clock_TB = '1';
        WAIT FOR PERIOD / 2;

        SA_TB <= "00000";
        SB_TB <= "00000";
        DR_TB <= "00000";
        TA_TB <= "1001";
        TB_TB <= "1010";
        TD_TB <= "1001";
        D_TB <= x"22337691";
        RW_TB <= '1';
        WAIT UNTIL Clock_TB'event AND Clock_TB = '1';
        WAIT FOR PERIOD / 2;

        SA_TB <= "00000";
        SB_TB <= "00000";
        DR_TB <= "00000";
        TA_TB <= "1010";
        TB_TB <= "1011";
        TD_TB <= "1010";
        D_TB <= x"22337692";
        RW_TB <= '1';
        WAIT UNTIL Clock_TB'event AND Clock_TB = '1';
        WAIT FOR PERIOD / 2;

        SA_TB <= "00000";
        SB_TB <= "00000";
        DR_TB <= "00000";
        TA_TB <= "1011";
        TB_TB <= "1100";
        TD_TB <= "1011";
        D_TB <= x"22337693";
        RW_TB <= '1';
        WAIT UNTIL Clock_TB'event AND Clock_TB = '1';
        WAIT FOR PERIOD / 2;

        SA_TB <= "00000";
        SB_TB <= "00000";
        DR_TB <= "00000";
        TA_TB <= "1100";
        TB_TB <= "1101";
        TD_TB <= "1100";
        D_TB <= x"22337694";
        RW_TB <= '1';
        WAIT UNTIL Clock_TB'event AND Clock_TB = '1';
        WAIT FOR PERIOD / 2;

        SA_TB <= "00000";
        SB_TB <= "00000";
        DR_TB <= "00000";
        TA_TB <= "1101";
        TB_TB <= "1110";
        TD_TB <= "1101";
        D_TB <= x"22337695";
        RW_TB <= '1';
        WAIT UNTIL Clock_TB'event AND Clock_TB = '1';
        WAIT FOR PERIOD / 2;

        SA_TB <= "00000";
        SB_TB <= "00000";
        DR_TB <= "00000";
        TA_TB <= "1110";
        TB_TB <= "1111";
        TD_TB <= "1110";
        D_TB <= x"22337696";
        RW_TB <= '1';
        WAIT UNTIL Clock_TB'event AND Clock_TB = '1';
        WAIT FOR PERIOD / 2;

        SA_TB <= "00000";
        SB_TB <= "00000";
        DR_TB <= "00000";
        TA_TB <= "1111";
        TB_TB <= "1111";
        TD_TB <= "1111";
        D_TB <= x"22337697";
        RW_TB <= '1';
        WAIT UNTIL Clock_TB'event AND Clock_TB = '1';
        WAIT FOR PERIOD / 2;

        -- Write disabled

        SA_TB <= "00000";
        SB_TB <= "00000";
        DR_TB <= "00000";
        TA_TB <= "0010";
        TB_TB <= "0001";
        TD_TB <= "0010";
        D_TB <= x"12345678";
        RW_TB <= '0';
        WAIT UNTIL Clock_TB'event AND Clock_TB = '1';
        WAIT FOR PERIOD / 2;

        SA_TB <= "00000";
        SB_TB <= "00001";
        DR_TB <= "00001";
        TA_TB <= "0000";
        TB_TB <= "0000";
        TD_TB <= "0000";
        D_TB <= x"12345678";
        RW_TB <= '0';
        WAIT UNTIL Clock_TB'event AND Clock_TB = '1';
        WAIT FOR PERIOD / 2;
    END PROCESS;
END Simulation;