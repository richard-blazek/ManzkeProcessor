----------------------------------------------------------------------------------
-- Engineer: Richard Blažek
-- Create Date: 11/08/2023 01:23:08 PM
-- Module Name: DP_ShifterCFlagMux2_1Bit_TB - Behavioral
----------------------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;

ENTITY DP_ShifterCFlagMux2_1Bit_TB IS
    -- No ports
END DP_ShifterCFlagMux2_1Bit_TB;

ARCHITECTURE Behavioral OF DP_ShifterCFlagMux2_1Bit_TB IS
    COMPONENT DP_ShifterCFlagMux2_1Bit IS
        PORT (
            SL, SR, MSB, LSB : IN STD_LOGIC;
            C : OUT STD_LOGIC);
    END COMPONENT;

    CONSTANT StudentID : STD_LOGIC_VECTOR (27 DOWNTO 0) := x"154D884";
    SIGNAL SL_TB, SR_TB, MSB_TB, LSB_TB, C_TB : STD_LOGIC;

BEGIN
    uut : DP_ShifterCFlagMux2_1Bit PORT MAP(SL => SL_TB, SR => SR_TB, MSB => MSB_TB, LSB => LSB_TB, C => C_TB);

    proc_sim : PROCESS BEGIN
        SL_TB <= '0';
        SR_TB <= '0';
        MSB_TB <= '1';
        LSB_TB <= '1';
        WAIT FOR 100ns;

        SL_TB <= '1';
        SR_TB <= '0';
        MSB_TB <= '1';
        LSB_TB <= '1';
        WAIT FOR 100ns;

        SL_TB <= '0';
        SR_TB <= '1';
        MSB_TB <= '0';
        LSB_TB <= '1';
        WAIT FOR 100ns;

        SL_TB <= '1';
        SR_TB <= '1';
        MSB_TB <= '1';
        LSB_TB <= '1';
        WAIT FOR 100ns;

        SL_TB <= '0';
        SR_TB <= '1';
        MSB_TB <= '1';
        LSB_TB <= '1';
        WAIT FOR 100ns;

        SL_TB <= '0';
        SR_TB <= '1';
        MSB_TB <= '1';
        LSB_TB <= '0';
        WAIT FOR 100ns;
    END PROCESS;
END Behavioral;