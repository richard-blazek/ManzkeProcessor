----------------------------------------------------------------------------------
-- Engineer: Richard Blažek 
-- Create Date: 11/14/2023 05:31:12 PM
-- Module Name: DP_Datapath_TB - Simulation
----------------------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;

ENTITY DP_Datapath_TB IS
    -- Ports not needed for simulation
END DP_Datapath_TB;

ARCHITECTURE Simulation OF DP_Datapath_TB IS
    COMPONENT DP_Datapath IS
        PORT (
            IR_IN, DATA_IN : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
            MB, MD, Clock, RW, Reset : IN STD_LOGIC;
            FS, DR, SA, SB : IN STD_LOGIC_VECTOR (4 DOWNTO 0);
            TA, TB, TD : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
            DATA_OUT, ADD : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
            C, N, Z, V : OUT STD_LOGIC);
    END COMPONENT;

    SIGNAL C_TB, N_TB, Z_TB, V_TB, MB_TB, MD_TB, Clock_TB, RW_TB : STD_LOGIC := '0';
    SIGNAL IR_IN_TB, DATA_IN_TB, DATA_OUT_TB, ADD_TB : STD_LOGIC_VECTOR (31 DOWNTO 0) := x"00000000";
    SIGNAL FS_TB, SA_TB, SB_TB, DR_TB : STD_LOGIC_VECTOR (4 DOWNTO 0) := "00000";
    SIGNAL TA_TB, TB_TB, TD_TB : STD_LOGIC_VECTOR (3 DOWNTO 0) := "0000";

BEGIN
    uut : DP_Datapath PORT MAP(
        IR_IN => IR_IN_TB,
        DATA_IN => DATA_IN_TB,
        MB => MB_TB,
        MD => MD_TB,
        Clock => Clock_TB,
        RW => RW_TB,
        FS => FS_TB,
        DR => DR_TB,
        SA => SA_TB,
        SB => SB_TB,
        TA => TA_TB,
        TB => TB_TB,
        TD => TD_TB,
        DATA_OUT => DATA_OUT_TB,
        ADD => ADD_TB,
        C => C_TB,
        N => N_TB,
        Z => Z_TB,
        V => V_TB,
        Reset => '0'
    );

    Clock_TB <= NOT Clock_TB AFTER 1600ns;

    sim_proc : PROCESS BEGIN
        -- # Part I: Initialising registers  
        MD_TB <= '1';
        RW_TB <= '1';
        WAIT FOR 800ns;

        DR_TB <= "00000";
        DATA_IN_TB <= x"0154d884";
        WAIT FOR 3200ns;
        DR_TB <= "00001";
        DATA_IN_TB <= x"0154d883";
        WAIT FOR 3200ns;
        DR_TB <= "00010";
        DATA_IN_TB <= x"0154d882";
        WAIT FOR 3200ns;
        DR_TB <= "00011";
        DATA_IN_TB <= x"0154d881";
        WAIT FOR 3200ns;
        DR_TB <= "00100";
        DATA_IN_TB <= x"0154d880";
        WAIT FOR 3200ns;
        DR_TB <= "00101";
        DATA_IN_TB <= x"0154d87f";
        WAIT FOR 3200ns;
        DR_TB <= "00110";
        DATA_IN_TB <= x"0154d87e";
        WAIT FOR 3200ns;
        DR_TB <= "00111";
        DATA_IN_TB <= x"0154d87d";
        WAIT FOR 3200ns;
        DR_TB <= "01000";
        DATA_IN_TB <= x"0154d87c";
        WAIT FOR 3200ns;
        DR_TB <= "01001";
        DATA_IN_TB <= x"0154d87b";
        WAIT FOR 3200ns;
        DR_TB <= "01010";
        DATA_IN_TB <= x"0154d87a";
        WAIT FOR 3200ns;
        DR_TB <= "01011";
        DATA_IN_TB <= x"0154d879";
        WAIT FOR 3200ns;
        DR_TB <= "01100";
        DATA_IN_TB <= x"0154d878";
        WAIT FOR 3200ns;
        DR_TB <= "01101";
        DATA_IN_TB <= x"0154d877";
        WAIT FOR 3200ns;
        DR_TB <= "01110";
        DATA_IN_TB <= x"0154d876";
        WAIT FOR 3200ns;
        DR_TB <= "01111";
        DATA_IN_TB <= x"0154d875";
        WAIT FOR 3200ns;
        DR_TB <= "10000";
        DATA_IN_TB <= x"0154d874";
        WAIT FOR 3200ns;
        DR_TB <= "10001";
        DATA_IN_TB <= x"0154d873";
        WAIT FOR 3200ns;
        DR_TB <= "10010";
        DATA_IN_TB <= x"0154d872";
        WAIT FOR 3200ns;
        DR_TB <= "10011";
        DATA_IN_TB <= x"0154d871";
        WAIT FOR 3200ns;
        DR_TB <= "10100";
        DATA_IN_TB <= x"0154d870";
        WAIT FOR 3200ns;
        DR_TB <= "10101";
        DATA_IN_TB <= x"0154d86f";
        WAIT FOR 3200ns;
        DR_TB <= "10110";
        DATA_IN_TB <= x"0154d86e";
        WAIT FOR 3200ns;
        DR_TB <= "10111";
        DATA_IN_TB <= x"0154d86d";
        WAIT FOR 3200ns;
        DR_TB <= "11000";
        DATA_IN_TB <= x"0154d86c";
        WAIT FOR 3200ns;
        DR_TB <= "11001";
        DATA_IN_TB <= x"0154d86b";
        WAIT FOR 3200ns;
        DR_TB <= "11010";
        DATA_IN_TB <= x"0154d86a";
        WAIT FOR 3200ns;
        DR_TB <= "11011";
        DATA_IN_TB <= x"0154d869";
        WAIT FOR 3200ns;
        DR_TB <= "11100";
        DATA_IN_TB <= x"0154d868";
        WAIT FOR 3200ns;
        DR_TB <= "11101";
        DATA_IN_TB <= x"0154d867";
        WAIT FOR 3200ns;
        DR_TB <= "11110";
        DATA_IN_TB <= x"0154d866";
        WAIT FOR 3200ns;
        DR_TB <= "11111";
        DATA_IN_TB <= x"0154d865";
        WAIT FOR 3200ns;
        TD_TB <= "0001";
        DATA_IN_TB <= x"0154d864";
        WAIT FOR 3200ns;
        TD_TB <= "0010";
        DATA_IN_TB <= x"0154d863";
        WAIT FOR 3200ns;
        TD_TB <= "0011";
        DATA_IN_TB <= x"0154d862";
        WAIT FOR 3200ns;
        TD_TB <= "0100";
        DATA_IN_TB <= x"0154d861";
        WAIT FOR 3200ns;
        TD_TB <= "0101";
        DATA_IN_TB <= x"0154d860";
        WAIT FOR 3200ns;
        TD_TB <= "0110";
        DATA_IN_TB <= x"0154d85f";
        WAIT FOR 3200ns;
        TD_TB <= "0111";
        DATA_IN_TB <= x"0154d85e";
        WAIT FOR 3200ns;
        TD_TB <= "1000";
        DATA_IN_TB <= x"0154d85d";
        WAIT FOR 3200ns;
        TD_TB <= "1001";
        DATA_IN_TB <= x"0154d85c";
        WAIT FOR 3200ns;
        TD_TB <= "1010";
        DATA_IN_TB <= x"0154d85b";
        WAIT FOR 3200ns;
        TD_TB <= "1011";
        DATA_IN_TB <= x"0154d85a";
        WAIT FOR 3200ns;
        TD_TB <= "1100";
        DATA_IN_TB <= x"0154d859";
        WAIT FOR 3200ns;
        TD_TB <= "1101";
        DATA_IN_TB <= x"0154d858";
        WAIT FOR 3200ns;
        TD_TB <= "1110";
        DATA_IN_TB <= x"0154d857";
        WAIT FOR 3200ns;
        TD_TB <= "1111";
        DATA_IN_TB <= x"0154d856";
        WAIT FOR 3200ns;

        -- # Part II: 15 operations, with B from the register file
        TD_TB <= "0000";
        MD_TB <= '0';
        DR_TB <= "01000";
        SA_TB <= "01101";
        SB_TB <= "10010";

        -- a XOR b
        FS_TB <= "01100";
        WAIT FOR 6400ns;
        -- NOT a
        FS_TB <= "01110";
        WAIT FOR 6400ns;
        -- a OR B
        FS_TB <= "01010";
        WAIT FOR 6400ns;
        -- a + 1
        FS_TB <= "00001";
        WAIT FOR 6400ns;
        -- a AND B
        FS_TB <= "01000";
        WAIT FOR 6400ns;
        -- a (== NOT a + 1)
        FS_TB <= "00111";
        WAIT FOR 6400ns;
        -- a - 1
        FS_TB <= "00110";
        WAIT FOR 6400ns;
        -- b >> 1
        FS_TB <= "11000";
        WAIT FOR 6400ns;
        -- a + NOT b + 1 (= a - b)
        FS_TB <= "00101";
        WAIT FOR 6400ns;
        -- b
        FS_TB <= "10000";
        WAIT FOR 6400ns;
        -- a + NOT b
        FS_TB <= "00100";
        WAIT FOR 6400ns;
        -- b << 1
        FS_TB <= "10100";
        WAIT FOR 6400ns;
        -- a + b + 1
        FS_TB <= "00011";
        WAIT FOR 6400ns;
        -- a + b
        FS_TB <= "00010";
        WAIT FOR 6400ns;
        -- a
        FS_TB <= "00000";
        WAIT FOR 6400ns;

        -- # Part III: 10/15 operations, with B = 22337668
        MB_TB <= '1';
        SB_TB <= "00000";
        IR_IN_TB <= x"0154D884";

        -- a XOR b
        FS_TB <= "01100";
        WAIT FOR 6400ns;
        -- a OR B
        FS_TB <= "01010";
        WAIT FOR 6400ns;
        -- a AND B
        FS_TB <= "01000";
        WAIT FOR 6400ns;
        -- b >> 1
        FS_TB <= "11000";
        WAIT FOR 6400ns;
        -- a + NOT b + 1 (= a - b)
        FS_TB <= "00101";
        WAIT FOR 6400ns;
        -- b
        FS_TB <= "10000";
        WAIT FOR 6400ns;
        -- a + NOT b
        FS_TB <= "00100";
        WAIT FOR 6400ns;
        -- b << 1
        FS_TB <= "10100";
        WAIT FOR 6400ns;
        -- a + b + 1
        FS_TB <= "00011";
        WAIT FOR 6400ns;
        -- a + b
        FS_TB <= "00010";
        WAIT FOR 6400ns;
    END PROCESS;

END Simulation;