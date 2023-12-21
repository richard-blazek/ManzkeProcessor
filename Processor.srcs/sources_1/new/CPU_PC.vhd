----------------------------------------------------------------------------------
-- Engineer: Richard Blažek
-- Create Date: 11/27/2023 09:22:44 AM
-- Module Name: CPU_PC - Behavioral
----------------------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;

ENTITY CPU_PC IS
    PORT (
        Clock, PI, PL, Reset : IN STD_LOGIC;
        Displacement : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
        InstAdd : OUT STD_LOGIC_VECTOR (31 DOWNTO 0));
END CPU_PC;

ARCHITECTURE Behavioral OF CPU_PC IS
    COMPONENT RF_Register32bit IS
        PORT (
            Clock, Load, Reset : IN STD_LOGIC;
            D : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
            Q : OUT STD_LOGIC_VECTOR(31 DOWNTO 0));
    END COMPONENT;

    COMPONENT CPU_Mux2_32Bit IS
        PORT (
            I0, I1 : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
            S : IN STD_LOGIC;
            Y : OUT STD_LOGIC_VECTOR (31 DOWNTO 0));
    END COMPONENT;

    COMPONENT DP_RippleCarryAdder32Bit IS
        PORT (
            A, B : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
            C_in : IN STD_LOGIC;
            SUM : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
            C_out, V : OUT STD_LOGIC);
    END COMPONENT;

    CONSTANT AND_gate_delay : TIME := 9ns;
    CONSTANT NAND_gate_delay : TIME := 7ns;
    CONSTANT OR_gate_delay : TIME := 7ns;
    CONSTANT NOR_gate_delay : TIME := 8ns;
    CONSTANT XOR_gate_delay : TIME := 4ns;
    CONSTANT XNOR_gate_delay : TIME := 4ns;
    CONSTANT NOT_gate_delay : TIME := 3ns;

    SIGNAL B, SUM, D, Q : STD_LOGIC_VECTOR (31 DOWNTO 0);
    SIGNAL LoadTmp, Load : STD_LOGIC;

BEGIN
    PI_Mux : CPU_Mux2_32Bit PORT MAP(I0 => Displacement, I1 => x"00000001", S => PI, Y => B);
    Adder : DP_RippleCarryAdder32Bit PORT MAP(A => Q, B => B, C_in => '0', SUM => SUM);
    Reset_Mux : CPU_Mux2_32Bit PORT MAP(I0 => SUM, I1 => x"00000000", S => Reset, Y => D);
    PC : RF_Register32bit PORT MAP(Clock => Clock, Load => Load, Reset => '0', D => D, Q => Q);

    LoadTmp <= Reset OR PL AFTER OR_gate_delay;
    Load <= LoadTmp OR PI AFTER OR_gate_delay;
    InstAdd <= Q;

END Behavioral;