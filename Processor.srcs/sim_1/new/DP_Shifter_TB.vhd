----------------------------------------------------------------------------------
-- Engineer: Richard Blažek
-- Create Date: 11/08/2023 04:37:37 PM
-- Module Name: DP_Shifter_TB - Simulation
----------------------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;

ENTITY DP_Shifter_TB IS
    -- No ports
END DP_Shifter_TB;

ARCHITECTURE Simulation OF DP_Shifter_TB IS
    COMPONENT DP_Shifter IS
        PORT (
            B : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
            SL, SR : IN STD_LOGIC;
            G : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
            C : OUT STD_LOGIC);
    END COMPONENT;

    SIGNAL SL_TB, SR_TB, C_TB : STD_LOGIC;
    SIGNAL B_TB, G_TB : STD_LOGIC_VECTOR (31 DOWNTO 0);

BEGIN
    uut : DP_Shifter PORT MAP(SL => SL_TB, SR => SR_TB, B => B_TB, G => G_TB, C => C_TB);

    proc_sim : PROCESS BEGIN
        B_TB <= x"22337668";
        SL_TB <= '0';
        SR_TB <= '0';
        WAIT FOR 100ns;

        B_TB <= x"22337668";
        SL_TB <= '1';
        SR_TB <= '0';
        WAIT FOR 100ns;

        B_TB <= x"22337668";
        SL_TB <= '0';
        SR_TB <= '1';
        WAIT FOR 100ns;

        B_TB <= x"22337668";
        SL_TB <= '1';
        SR_TB <= '1';
        WAIT FOR 100ns;
    END PROCESS;

END Simulation;