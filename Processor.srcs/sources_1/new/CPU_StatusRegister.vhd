----------------------------------------------------------------------------------
-- Engineer: Richard Blažek
-- Create Date: 11/28/2023 09:42:11 AM
-- Module Name: CPU_StatusRegister - Behavioral
----------------------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;

ENTITY CPU_StatusRegister IS
    PORT (
        C, Reset_C, N, Reset_N : IN STD_LOGIC;
        V, Reset_V, Z, Reset_Z : IN STD_LOGIC;
        LoadFlags, Clock : IN STD_LOGIC;
        StatusVector : OUT STD_LOGIC_VECTOR (3 DOWNTO 0));
END CPU_StatusRegister;

ARCHITECTURE Behavioral OF CPU_StatusRegister IS
    COMPONENT CPU_DFlipFlop IS
        PORT (
            D, Clock, Reset : IN STD_LOGIC;
            Q : OUT STD_LOGIC);
    END COMPONENT;

    CONSTANT AND_gate_delay : TIME := 9ns;
    CONSTANT NAND_gate_delay : TIME := 7ns;
    CONSTANT OR_gate_delay : TIME := 7ns;
    CONSTANT NOR_gate_delay : TIME := 8ns;
    CONSTANT XOR_gate_delay : TIME := 4ns;
    CONSTANT XNOR_gate_delay : TIME := 4ns;
    CONSTANT NOT_gate_delay : TIME := 3ns;

    SIGNAL LoadFlags_not, C_Q, N_Q, V_Q, Z_Q : STD_LOGIC;
    SIGNAL C_old, C_new, N_old, N_new, V_old, V_new, Z_old, Z_new : STD_LOGIC;
    SIGNAL C_D, N_D, V_D, Z_D : STD_LOGIC;
BEGIN

    LoadFlags_not <= NOT LoadFlags AFTER NOT_gate_delay;

    C_old <= C_Q AND LoadFlags_not AFTER AND_gate_delay;
    N_old <= N_Q AND LoadFlags_not AFTER AND_gate_delay;
    V_old <= V_Q AND LoadFlags_not AFTER AND_gate_delay;
    Z_old <= Z_Q AND LoadFlags_not AFTER AND_gate_delay;

    C_new <= C AND LoadFlags AFTER AND_gate_delay;
    N_new <= N AND LoadFlags AFTER AND_gate_delay;
    V_new <= V AND LoadFlags AFTER AND_gate_delay;
    Z_new <= Z AND LoadFlags AFTER AND_gate_delay;

    C_D <= C_old OR C_new AFTER OR_gate_delay;
    N_D <= N_old OR N_new AFTER OR_gate_delay;
    V_D <= V_old OR V_new AFTER OR_gate_delay;
    Z_D <= Z_old OR Z_new AFTER OR_gate_delay;

    C_FF : CPU_DFlipFlop PORT MAP(D => C_D, Clock => Clock, Reset => Reset_C, Q => C_Q);
    N_FF : CPU_DFlipFlop PORT MAP(D => N_D, Clock => Clock, Reset => Reset_N, Q => N_Q);
    V_FF : CPU_DFlipFlop PORT MAP(D => V_D, Clock => Clock, Reset => Reset_V, Q => V_Q);
    Z_FF : CPU_DFlipFlop PORT MAP(D => Z_D, Clock => Clock, Reset => Reset_Z, Q => Z_Q);

    StatusVector(0) <= C_Q;
    StatusVector(1) <= V_Q;
    StatusVector(2) <= Z_Q;
    StatusVector(3) <= N_Q;

END Behavioral;