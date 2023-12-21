----------------------------------------------------------------------------------
-- Engineer: Richard Blažek
-- Create Date: 11/08/2023 01:15:27 PM
-- Module Name: DP_ShifterCFlagMux2_1Bit - Behavioral
----------------------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;

ENTITY DP_ShifterCFlagMux2_1Bit IS
    PORT (
        SL, SR, MSB, LSB : IN STD_LOGIC;
        C : OUT STD_LOGIC);
END DP_ShifterCFlagMux2_1Bit;

ARCHITECTURE Behavioral OF DP_ShifterCFlagMux2_1Bit IS
    CONSTANT AND_gate_delay : TIME := 9ns;
    CONSTANT NAND_gate_delay : TIME := 7ns;
    CONSTANT OR_gate_delay : TIME := 7ns;
    CONSTANT NOR_gate_delay : TIME := 8ns;
    CONSTANT XOR_gate_delay : TIME := 4ns;
    CONSTANT XNOR_gate_delay : TIME := 4ns;
    CONSTANT NOT_gate_delay : TIME := 3ns;

    SIGNAL CL, CR : STD_LOGIC;

BEGIN
    CL <= SL AND MSB AFTER AND_gate_delay;
    CR <= SR AND LSB AFTER AND_gate_delay;
    C <= CL XOR CR AFTER XOR_gate_delay;
END Behavioral;