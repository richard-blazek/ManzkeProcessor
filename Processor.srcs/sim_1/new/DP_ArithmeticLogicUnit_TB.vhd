----------------------------------------------------------------------------------
-- Engineer: Richard Blazek
-- Create Date: 11/07/2023 12:04:30 PM
-- Module Name: DP_ArithmeticLogicUnit_TB - Simulation
----------------------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;

ENTITY DP_ArithmeticLogicUnit_TB IS
    -- No ports
END DP_ArithmeticLogicUnit_TB;

ARCHITECTURE Simulation OF DP_ArithmeticLogicUnit_TB IS
    COMPONENT DP_ArithmeticLogicUnit IS
        PORT (
            A, B : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
            C_in, S0, S1, S2 : IN STD_LOGIC;
            C, V : OUT STD_LOGIC;
            G : OUT STD_LOGIC_VECTOR (31 DOWNTO 0));
    END COMPONENT;

    SIGNAL A_TB, B_TB, G_TB : STD_LOGIC_VECTOR (31 DOWNTO 0);
    SIGNAL C_in_TB, S0_TB, S1_TB, S2_TB, C_TB, V_TB : STD_LOGIC;

    CONSTANT StudentID : STD_LOGIC_VECTOR (27 DOWNTO 0) := x"154D884";

BEGIN
    uut : DP_ArithmeticLogicUnit PORT MAP(
        A => A_TB,
        B => B_TB,
        C_in => C_in_TB,
        S0 => S0_TB,
        S1 => S1_TB,
        S2 => S2_TB,
        C => C_TB,
        V => V_TB,
        G => G_TB
    );

    sim_proc : PROCESS BEGIN

        A_TB <= x"22337668"; -- A + 0
        B_TB <= x"613300FF";
        C_in_TB <= '0';
        S0_TB <= '0';
        S1_TB <= '0';
        S2_TB <= '0';
        WAIT FOR 2000ns;

        A_TB <= x"22337668"; -- A + 1
        B_TB <= x"613300FF";
        C_in_TB <= '1';
        S0_TB <= '0';
        S1_TB <= '0';
        S2_TB <= '0';
        WAIT FOR 2000ns;

        A_TB <= x"22337668"; -- A + B
        B_TB <= x"613300FF";
        C_in_TB <= '0';
        S0_TB <= '1';
        S1_TB <= '0';
        S2_TB <= '0';
        WAIT FOR 2000ns;

        A_TB <= x"22337668"; -- A + B + 1
        B_TB <= x"613300FF";
        C_in_TB <= '1';
        S0_TB <= '1';
        S1_TB <= '0';
        S2_TB <= '0';
        WAIT FOR 2000ns;

        A_TB <= x"22337668"; -- A + not B
        B_TB <= x"613300FF";
        C_in_TB <= '0';
        S0_TB <= '0';
        S1_TB <= '1';
        S2_TB <= '0';
        WAIT FOR 2000ns;

        A_TB <= x"22337668"; -- A + not B + 1 == A - B
        B_TB <= x"613300FF";
        C_in_TB <= '1';
        S0_TB <= '0';
        S1_TB <= '1';
        S2_TB <= '0';
        WAIT FOR 2000ns;

        A_TB <= x"22337668"; -- A + (-1) == A - 1
        B_TB <= x"613300FF";
        C_in_TB <= '0';
        S0_TB <= '1';
        S1_TB <= '1';
        S2_TB <= '0';
        WAIT FOR 2000ns;

        A_TB <= x"22337668"; -- A and B
        B_TB <= x"613300FF";
        C_in_TB <= '0';
        S0_TB <= '0';
        S1_TB <= '0';
        S2_TB <= '1';
        WAIT FOR 2000ns;

        A_TB <= x"22337668"; -- A or B
        B_TB <= x"613300FF";
        C_in_TB <= '0';
        S0_TB <= '1';
        S1_TB <= '0';
        S2_TB <= '1';
        WAIT FOR 2000ns;

        A_TB <= x"22337668"; -- A xor B
        B_TB <= x"613300FF";
        C_in_TB <= '0';
        S0_TB <= '0';
        S1_TB <= '1';
        S2_TB <= '1';
        WAIT FOR 2000ns;

        A_TB <= x"22337668"; -- not A
        B_TB <= x"613300FF";
        C_in_TB <= '0';
        S0_TB <= '1';
        S1_TB <= '1';
        S2_TB <= '1';
        WAIT FOR 2000ns;

    END PROCESS;

END Simulation;