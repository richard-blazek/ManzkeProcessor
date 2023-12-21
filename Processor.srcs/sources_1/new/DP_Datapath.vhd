----------------------------------------------------------------------------------
-- Engineer: Richard Blažek
-- Create Date: 11/14/2023 04:35:09 PM
-- Module Name: DP_Datapath - Behavioral
----------------------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;

ENTITY DP_Datapath IS
    PORT (
        IR_IN, DATA_IN : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
        MB, MD, Clock, RW, Reset : IN STD_LOGIC;
        FS, DR, SA, SB : IN STD_LOGIC_VECTOR (4 DOWNTO 0);
        TA, TB, TD : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
        DATA_OUT, ADD : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
        C, N, Z, V : OUT STD_LOGIC);
END DP_Datapath;

ARCHITECTURE Behavioral OF DP_Datapath IS
    COMPONENT RF_RegisterFile_32_15 IS
        PORT (
            SA, SB, DR : IN STD_LOGIC_VECTOR (4 DOWNTO 0);
            TA, TB, TD : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
            D : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
            RW, Clock, Reset : IN STD_LOGIC;
            A, B : OUT STD_LOGIC_VECTOR (31 DOWNTO 0));
    END COMPONENT;

    COMPONENT DP_FunctionalUnit IS
        PORT (
            A, B : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
            FS : IN STD_LOGIC_VECTOR (4 DOWNTO 0);
            C, N, Z, V : OUT STD_LOGIC;
            F : OUT STD_LOGIC_VECTOR (31 DOWNTO 0));
    END COMPONENT;

    COMPONENT CPU_Mux2_32Bit IS
        PORT (
            I0, I1 : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
            S : IN STD_LOGIC;
            Y : OUT STD_LOGIC_VECTOR (31 DOWNTO 0));
    END COMPONENT;

    SIGNAL RegFile_A, RegFile_B, RegFile_D, MuxB_Z, FunctionalUnit_F : STD_LOGIC_VECTOR (31 DOWNTO 0);

BEGIN
    RegFile : RF_RegisterFile_32_15 PORT MAP(
        Clock => Clock,
        D => RegFile_D,
        DR => DR,
        SA => SA,
        SB => SB,
        RW => RW,
        TA => TA,
        TB => TB,
        TD => TD,
        A => RegFile_A,
        B => RegFile_B,
        Reset => Reset
    );

    FunctionalUnit : DP_FunctionalUnit PORT MAP(
        A => RegFile_A,
        B => MuxB_Z,
        FS => FS,
        C => C,
        V => V,
        N => N,
        Z => Z,
        F => FunctionalUnit_F
    );

    MuxB : CPU_Mux2_32Bit PORT MAP(
        I0 => RegFile_B,
        I1 => IR_IN,
        S => MB,
        Y => MuxB_Z
    );

    MuxD : CPU_Mux2_32Bit PORT MAP(
        I0 => FunctionalUnit_F,
        I1 => DATA_IN,
        S => MD,
        Y => RegFile_D
    );

    ADD <= RegFile_A;
    DATA_OUT <= MuxB_Z;
END Behavioral;