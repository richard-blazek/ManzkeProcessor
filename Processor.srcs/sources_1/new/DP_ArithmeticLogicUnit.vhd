----------------------------------------------------------------------------------
-- Engineer: Richard Blažek
-- Create Date: 11/07/2023 10:46:57 AM
-- Module Name: DP_ArithmeticLogicUnit - Behavioral
----------------------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;

ENTITY DP_ArithmeticLogicUnit IS
    PORT (
        A, B : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
        C_in, S0, S1, S2 : IN STD_LOGIC;
        C, V : OUT STD_LOGIC;
        G : OUT STD_LOGIC_VECTOR (31 DOWNTO 0));
END DP_ArithmeticLogicUnit;

ARCHITECTURE Behavioral OF DP_ArithmeticLogicUnit IS
    COMPONENT DP_32Bit_B_Logic IS
        PORT (
            B : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
            S0, S1 : IN STD_LOGIC;
            Y : OUT STD_LOGIC_VECTOR (31 DOWNTO 0));
    END COMPONENT;

    COMPONENT DP_32bit_LogicCircuit IS
        PORT (
            A, B : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
            S0, S1 : IN STD_LOGIC;
            Y : OUT STD_LOGIC_VECTOR (31 DOWNTO 0));
    END COMPONENT;

    COMPONENT DP_RippleCarryAdder32Bit IS
        PORT (
            A, B : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
            C_in : IN STD_LOGIC;
            SUM : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
            C_out, V : OUT STD_LOGIC);
    END COMPONENT;

    COMPONENT CPU_Mux2_32Bit IS
        PORT (
            I0, I1 : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
            S : IN STD_LOGIC;
            Y : OUT STD_LOGIC_VECTOR (31 DOWNTO 0));
    END COMPONENT;

    SIGNAL Adder_A, Adder_B, Adder_SUM, LogicCircuit_Y, ALUMux_I1 : STD_LOGIC_VECTOR (31 DOWNTO 0);
    SIGNAL Adder_C_in, Adder_C_out, Adder_V, ALUMux_S : STD_LOGIC;

BEGIN
    Adder_A <= A AFTER 19ns;
    Adder_C_in <= C_in AFTER 19ns;
    V <= Adder_V AFTER 19ns;
    C <= Adder_C_out AFTER 19ns;
    ALUMux_S <= S2 AFTER 759ns;
    ALUMux_I1 <= LogicCircuit_Y AFTER 718ns;

    BLogic : DP_32Bit_B_Logic PORT MAP(B => B, S0 => S0, S1 => S1, Y => Adder_B);
    Adder : DP_RippleCarryAdder32Bit PORT MAP(
        A => Adder_A,
        B => Adder_B,
        C_in => Adder_C_in,
        SUM => Adder_SUM,
        C_out => Adder_C_out,
        V => Adder_V
    );
    LogicCircuit : DP_32bit_LogicCircuit PORT MAP(A => A, B => B, S0 => S0, S1 => S1, Y => LogicCircuit_Y);
    ALUMux : CPU_Mux2_32Bit PORT MAP(I0 => Adder_SUM, I1 => ALUMux_I1, S => ALUMux_S, Y => G);

END Behavioral;