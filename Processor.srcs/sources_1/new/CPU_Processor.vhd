----------------------------------------------------------------------------------
-- Engineer: Richard Blažek
-- Create Date: 12/07/2023 10:49:10 AM
-- Module Name: CPU_Processor - Behavioral
----------------------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;

ENTITY CPU_Processor IS
    PORT (Clock, Reset : IN STD_LOGIC);
END CPU_Processor;

ARCHITECTURE Behavioral OF CPU_Processor IS
    CONSTANT AND_gate_delay : TIME := 9ns;
    CONSTANT NAND_gate_delay : TIME := 7ns;
    CONSTANT OR_gate_delay : TIME := 7ns;
    CONSTANT NOR_gate_delay : TIME := 8ns;
    CONSTANT XOR_gate_delay : TIME := 4ns;
    CONSTANT XNOR_gate_delay : TIME := 4ns;
    CONSTANT NOT_gate_delay : TIME := 3ns;

    COMPONENT CPU_ControlMemory IS
        PORT (
            Address : IN STD_LOGIC_VECTOR (16 DOWNTO 0);
            NA : OUT STD_LOGIC_VECTOR (16 DOWNTO 0); -- 34-50
            MS : OUT STD_LOGIC_VECTOR (2 DOWNTO 0); -- 31-33
            MC : OUT STD_LOGIC; -- 30
            IL : OUT STD_LOGIC; -- 29
            PI : OUT STD_LOGIC; -- 28
            PL : OUT STD_LOGIC; -- 27
            TD : OUT STD_LOGIC_VECTOR (3 DOWNTO 0); -- 23-26
            TA : OUT STD_LOGIC_VECTOR (3 DOWNTO 0); -- 19-22
            TB : OUT STD_LOGIC_VECTOR (3 DOWNTO 0); -- 15-18
            MB : OUT STD_LOGIC; -- 14
            FS : OUT STD_LOGIC_VECTOR (4 DOWNTO 0); -- 09-13
            MD : OUT STD_LOGIC; -- 08
            RW : OUT STD_LOGIC; -- 07
            MM : OUT STD_LOGIC; -- 06
            MW : OUT STD_LOGIC; -- 05
            RV : OUT STD_LOGIC; -- 04
            RC : OUT STD_LOGIC; -- 03
            RN : OUT STD_LOGIC; -- 02
            RZ : OUT STD_LOGIC; -- 01
            FL : OUT STD_LOGIC); -- 00
    END COMPONENT;

    COMPONENT CPU_IR IS
        PORT (
            Input : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
            IL, Clock : IN STD_LOGIC;
            OpCode : OUT STD_LOGIC_VECTOR (16 DOWNTO 0);
            DR, SA, SB : OUT STD_LOGIC_VECTOR (4 DOWNTO 0));
    END COMPONENT;

    COMPONENT CPU_SignExtend IS
        PORT (
            Input : IN STD_LOGIC_VECTOR (9 DOWNTO 0);
            Output : OUT STD_LOGIC_VECTOR (31 DOWNTO 0));
    END COMPONENT;

    COMPONENT CPU_PC IS
        PORT (
            Clock, PI, PL, Reset : IN STD_LOGIC;
            Displacement : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
            InstAdd : OUT STD_LOGIC_VECTOR (31 DOWNTO 0));
    END COMPONENT;

    COMPONENT CPU_Mux2_32Bit IS
        PORT (
            I0, I1 : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
            S : IN STD_LOGIC;
            Y : OUT STD_LOGIC_VECTOR (31 DOWNTO 0));
    END COMPONENT;

    COMPONENT CPU_RAM IS
        PORT (
            Clock : IN STD_LOGIC;
            Address : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
            DataIn : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
            WriteEnable : IN STD_LOGIC;
            DataOut : OUT STD_LOGIC_VECTOR (31 DOWNTO 0));
    END COMPONENT;

    COMPONENT CPU_ZeroFill IS
        PORT (
            Input : IN STD_LOGIC_VECTOR (4 DOWNTO 0);
            Output : OUT STD_LOGIC_VECTOR (31 DOWNTO 0));
    END COMPONENT;

    COMPONENT DP_Datapath IS
        PORT (
            IR_IN, DATA_IN : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
            MB, MD, Clock, RW, Reset : IN STD_LOGIC;
            FS, DR, SA, SB : IN STD_LOGIC_VECTOR (4 DOWNTO 0);
            TA, TB, TD : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
            DATA_OUT, ADD : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
            C, N, Z, V : OUT STD_LOGIC);
    END COMPONENT;

    COMPONENT CPU_StatusRegister IS
        PORT (
            C, Reset_C, N, Reset_N : IN STD_LOGIC;
            V, Reset_V, Z, Reset_Z : IN STD_LOGIC;
            LoadFlags, Clock : IN STD_LOGIC;
            StatusVector : OUT STD_LOGIC_VECTOR (3 DOWNTO 0));
    END COMPONENT;

    COMPONENT CPU_SMux IS
        PORT (
            Zero, One, C, V, Z, N, Not_C, Not_Z : IN STD_LOGIC;
            MS : IN STD_LOGIC_VECTOR (2 DOWNTO 0);
            Y : OUT STD_LOGIC);
    END COMPONENT;

    COMPONENT CPU_Mux2_17Bit IS
        PORT (
            I0, I1 : IN STD_LOGIC_VECTOR (16 DOWNTO 0);
            S : IN STD_LOGIC;
            Y : OUT STD_LOGIC_VECTOR (16 DOWNTO 0));
    END COMPONENT;

    COMPONENT CPU_CAR IS
        PORT (
            NextAddress : IN STD_LOGIC_VECTOR (16 DOWNTO 0);
            Load, Clock, Reset : IN STD_LOGIC;
            Address : OUT STD_LOGIC_VECTOR (16 DOWNTO 0));
    END COMPONENT;

    SIGNAL Address, NA, IR_OpCode, NextAddress : STD_LOGIC_VECTOR (16 DOWNTO 0);
    SIGNAL C, N, V, Z, NotC, NotZ, CAR_Load : STD_LOGIC;
    SIGNAL FL, IL, MB, MC, MD, MM, MW : STD_LOGIC;
    SIGNAL PI, PL, RC, RN, RV, RW, RZ : STD_LOGIC;
    SIGNAL TA, TB, TD, StatusVector : STD_LOGIC_VECTOR (3 DOWNTO 0);
    SIGNAL MS : STD_LOGIC_VECTOR (2 DOWNTO 0);
    SIGNAL FS : STD_LOGIC_VECTOR (4 DOWNTO 0);
    SIGNAL DP_IR_IN, DP_ADDR, DP_DATA_OUT : STD_LOGIC_VECTOR (31 DOWNTO 0);
    SIGNAL RAM_Address, RAM_DataOut : STD_LOGIC_VECTOR (31 DOWNTO 0);
    SIGNAL Displacement, InstAddr : STD_LOGIC_VECTOR (31 DOWNTO 0);
    SIGNAL DR, SA, SB : STD_LOGIC_VECTOR (4 DOWNTO 0);
    SIGNAL DR_SB : STD_LOGIC_VECTOR (9 DOWNTO 0);

BEGIN
    ControlROM : CPU_ControlMemory PORT MAP(
        Address => Address,
        NA => NA,
        FL => FL,
        IL => IL,
        MB => MB,
        MC => MC,
        MD => MD,
        MM => MM,
        MW => MW,
        PI => PI,
        PL => PL,
        RC => RC,
        RN => RN,
        RV => RV,
        RW => RW,
        RZ => RZ,
        TA => TA,
        TB => TB,
        TD => TD,
        MS => MS,
        FS => FS
    );

    IR : CPU_IR PORT MAP(
        Clock => Clock,
        IL => IL,
        Input => RAM_DataOut,
        OpCode => IR_OpCode,
        DR => DR,
        SA => SA,
        SB => SB
    );
    DR_SB <= DR & SB;

    SignExtend : CPU_SignExtend PORT MAP(
        Input => DR_SB,
        Output => Displacement
    );

    PC : CPU_PC PORT MAP(
        Clock => Clock,
        Reset => Reset,
        PI => PI,
        PL => PL,
        Displacement => Displacement,
        InstAdd => InstAddr
    );

    ZeroFill : CPU_ZeroFill PORT MAP(
        Input => SB,
        Output => DP_IR_IN
    );

    MuxM : CPU_Mux2_32Bit PORT MAP(
        I0 => DP_ADDR,
        I1 => InstAddr,
        S => MM,
        Y => RAM_Address
    );

    Datapath : DP_Datapath PORT MAP(
        Clock => Clock,
        Reset => Reset,
        FS => FS,
        SA => SA,
        SB => SB,
        DR => DR,
        TA => TA,
        TB => TB,
        TD => TD,
        MB => MB,
        MD => MD,
        RW => RW,
        IR_IN => DP_IR_IN,
        DATA_IN => RAM_DataOut,
        ADD => DP_ADDR,
        DATA_OUT => DP_DATA_OUT,
        C => C,
        N => N,
        V => V,
        Z => Z
    );

    RAM : CPU_RAM PORT MAP(
        Address => RAM_Address,
        Clock => Clock,
        WriteEnable => MW,
        DataIn => DP_DATA_OUT,
        DataOut => RAM_DataOut
    );

    MuxC : CPU_Mux2_17Bit PORT MAP(
        I0 => NA,
        I1 => IR_OpCode,
        S => MC,
        Y => NextAddress
    );

    Status : CPU_StatusRegister PORT MAP(
        C => C,
        N => N,
        V => V,
        Z => Z,
        Reset_C => RC,
        Reset_N => RN,
        Reset_V => RV,
        Reset_Z => RZ,
        LoadFlags => FL,
        Clock => Clock,
        StatusVector => StatusVector
    );

    NotC <= NOT StatusVector(0) AFTER NOT_gate_delay;
    NotZ <= NOT StatusVector(2) AFTER NOT_gate_delay;
    SMux : CPU_SMux PORT MAP(
        Zero => '0',
        One => '1',
        C => StatusVector(0),
        V => StatusVector(1),
        Z => StatusVector(2),
        N => StatusVector(3),
        Not_C => NotC,
        Not_Z => NotZ,
        MS => MS,
        Y => CAR_Load
    );

    CAR : CPU_CAR PORT MAP(
        NextAddress => NextAddress,
        Load => CAR_Load,
        Clock => Clock,
        Reset => Reset,
        Address => Address
    );

END Behavioral;