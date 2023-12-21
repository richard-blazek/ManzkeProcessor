----------------------------------------------------------------------------------
-- Engineer: Richard Blažek
-- Create Date: 11/08/2023 07:12:10 PM
-- Module Name: DP_FunctionalUnit_TB - Simulation
----------------------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;

ENTITY DP_FunctionalUnit_TB IS
    -- No ports needed for simulation
END DP_FunctionalUnit_TB;

ARCHITECTURE Simulation OF DP_FunctionalUnit_TB IS
    COMPONENT DP_FunctionalUnit IS
        PORT (
            A, B : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
            FS : IN STD_LOGIC_VECTOR (4 DOWNTO 0);
            C, N, Z, V : OUT STD_LOGIC;
            F : OUT STD_LOGIC_VECTOR (31 DOWNTO 0));
    END COMPONENT;

    SIGNAL A_TB, B_TB, F_TB : STD_LOGIC_VECTOR (31 DOWNTO 0);
    SIGNAL FS_TB : STD_LOGIC_VECTOR (4 DOWNTO 0);
    SIGNAL C_TB, N_TB, Z_TB, V_TB : STD_LOGIC;

BEGIN
    uut : DP_FunctionalUnit PORT MAP(A => A_TB, B => B_TB, FS => FS_TB, C => C_TB, N => N_TB, Z => Z_TB, V => V_TB, F => F_TB);

    proc_sim : PROCESS BEGIN

        A_TB <= x"0154D884"; -- 22337668
        B_TB <= x"0154D88A";

        -- a XOR b
        FS_TB <= "01100";
        WAIT FOR 2000ns;

        -- NOT a
        FS_TB <= "01110";
        WAIT FOR 2000ns;

        -- a OR B
        FS_TB <= "01010";
        WAIT FOR 2000ns;

        -- a + 1
        FS_TB <= "00001";
        WAIT FOR 2000ns;

        -- a AND B
        FS_TB <= "01000";
        WAIT FOR 2000ns;

        -- a (== NOT a + 1)
        FS_TB <= "00111";
        WAIT FOR 2000ns;

        -- a - 1
        FS_TB <= "00110";
        WAIT FOR 2000ns;

        -- b >> 1
        FS_TB <= "11000";
        WAIT FOR 2000ns;

        -- a + NOT b + 1 (= a - b)
        FS_TB <= "00101";
        WAIT FOR 2000ns;

        -- b
        FS_TB <= "10000";
        WAIT FOR 2000ns;

        -- a + NOT b
        FS_TB <= "00100";
        WAIT FOR 2000ns;

        -- b << 1
        FS_TB <= "10100";
        WAIT FOR 2000ns;

        -- a + b + 1
        FS_TB <= "00011";
        WAIT FOR 2000ns;

        -- a + b
        FS_TB <= "00010";
        WAIT FOR 2000ns;

        -- a
        FS_TB <= "00000";
        WAIT FOR 2000ns;

    END PROCESS;

END Simulation;