----------------------------------------------------------------------------------
-- Engineer: Richard Blažek
-- Create Date: 11/08/2023 06:07:01 PM
-- Module Name: DP_FunctionalUnit - Behavioral
----------------------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;

ENTITY DP_FunctionalUnit IS
    PORT (
        A, B : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
        FS : IN STD_LOGIC_VECTOR (4 DOWNTO 0);
        C, N, Z, V : OUT STD_LOGIC;
        F : OUT STD_LOGIC_VECTOR (31 DOWNTO 0));
END DP_FunctionalUnit;

ARCHITECTURE Behavioral OF DP_FunctionalUnit IS

    COMPONENT DP_ZeroDetection IS
        PORT (
            I : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
            Z : OUT STD_LOGIC);
    END COMPONENT;

    COMPONENT DP_CFlagMux2_1Bit IS
        PORT (
            I0, I1, S : IN STD_LOGIC;
            Y : OUT STD_LOGIC);
    END COMPONENT;

    COMPONENT CPU_Mux2_32Bit IS
        PORT (
            I0, I1 : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
            S : IN STD_LOGIC;
            Y : OUT STD_LOGIC_VECTOR (31 DOWNTO 0));
    END COMPONENT;

    COMPONENT DP_Shifter IS
        PORT (
            B : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
            SL, SR : IN STD_LOGIC;
            G : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
            C : OUT STD_LOGIC);
    END COMPONENT;

    COMPONENT DP_ArithmeticLogicUnit IS
        PORT (
            A, B : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
            C_in, S0, S1, S2 : IN STD_LOGIC;
            C, V : OUT STD_LOGIC;
            G : OUT STD_LOGIC_VECTOR (31 DOWNTO 0));
    END COMPONENT;

    SIGNAL Shifter_C, ALU_C : STD_LOGIC;
    SIGNAL Shifter_G, ALU_G, MuxF_Y : STD_LOGIC_VECTOR (31 DOWNTO 0);

BEGIN
    Shifter : DP_Shifter PORT MAP(B => B, SL => FS(2), SR => FS(3), G => Shifter_G, C => Shifter_C);
    ALU : DP_ArithmeticLogicUnit PORT MAP(A => A, B => B, C_in => FS(0), S0 => FS(1), S1 => FS(2), S2 => FS(3), C => ALU_C, V => V, G => ALU_G);
    MuxF : CPU_Mux2_32Bit PORT MAP(I0 => ALU_G, I1 => Shifter_G, S => FS(4), Y => MuxF_Y);
    ZFlag : DP_ZeroDetection PORT MAP(I => MuxF_Y, Z => Z);
    CFlag : DP_CFlagMux2_1Bit PORT MAP(I0 => ALU_C, I1 => Shifter_C, S => FS(4), Y => C);
    F <= MuxF_Y;
    N <= MuxF_Y(31);
END Behavioral;