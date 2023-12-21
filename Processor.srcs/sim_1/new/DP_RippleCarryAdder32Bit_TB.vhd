----------------------------------------------------------------------------------
-- Engineer: Richard Blažek 
-- Create Date: 11/03/2023 11:01:02 AM
-- Module Name: DP_RippleCarryAdder32Bit_TB - Simulation
----------------------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;

ENTITY DP_RippleCarryAdder32Bit_TB IS
    -- Simulation does not use ports
END DP_RippleCarryAdder32Bit_TB;

ARCHITECTURE Simulation OF DP_RippleCarryAdder32Bit_TB IS
    COMPONENT DP_RippleCarryAdder32Bit IS
        PORT (
            A, B : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
            C_in : IN STD_LOGIC;
            SUM : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
            C_out, V : OUT STD_LOGIC);
    END COMPONENT;

    CONSTANT StudentID : STD_LOGIC_VECTOR (27 DOWNTO 0) := x"154D884";

    SIGNAL A_TB, B_TB, SUM_TB : STD_LOGIC_VECTOR (31 DOWNTO 0);
    SIGNAL C_in_TB, C_out_TB, V_TB : STD_LOGIC;

BEGIN
    uut : DP_RippleCarryAdder32Bit PORT MAP(A => A_TB, B => B_TB, C_in => C_in_TB, SUM => SUM_TB, C_out => C_out_TB, V => V_TB);

    sim_proc : PROCESS
    BEGIN

        A_TB <= x"00000000";
        B_TB <= x"00000000";
        C_in_TB <= '0';
        WAIT FOR 2000ns;

        A_TB <= x"77777777";
        B_TB <= x"88888888";
        C_in_TB <= '0';
        WAIT FOR 2000ns;

        A_TB <= x"77777777";
        B_TB <= x"88888888";
        C_in_TB <= '1';
        WAIT FOR 2000ns;

        A_TB <= x"7FFFFFFF";
        B_TB <= x"00000001";
        C_in_TB <= '0';
        WAIT FOR 2000ns;

        A_TB <= x"80000000";
        B_TB <= x"80000000";
        C_in_TB <= '1';
        WAIT FOR 2000ns;

        A_TB <= x"22337668";
        B_TB <= x"ddcc8998";
        C_in_TB <= '0';
        WAIT FOR 2000ns;
    END PROCESS;
END Simulation;