----------------------------------------------------------------------------------
-- Engineer: Richard Blažek
-- Create Date: 12/03/2023 10:26:04 PM
-- Module Name: CPU_ControlMemory_TB - Simulation
----------------------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;

ENTITY CPU_ControlMemory_TB IS
    -- No ports
END CPU_ControlMemory_TB;

ARCHITECTURE Simulation OF CPU_ControlMemory_TB IS
    COMPONENT CPU_ControlMemory IS
        PORT (
            Address : IN STD_LOGIC_VECTOR (16 DOWNTO 0);
            NA : OUT STD_LOGIC_VECTOR (16 DOWNTO 0); -- 34-50
            MS : OUT STD_LOGIC_VECTOR (2 DOWNTO 0); -- 31-33
            MC : OUT STD_LOGIC; -- 30
            IL : OUT STD_LOGIC; -- 29
            PI : OUT STD_LOGIC; -- 28
            PL : OUT STD_LOGIC; -- 27
            TD : OUT STD_LOGIC_VECTOR (3 DOWNTO 0); -- 23-26
            TA : OUT STD_LOGIC_VECTOR (3 DOWNTO 0); -- 19-22
            TB : OUT STD_LOGIC_VECTOR (3 DOWNTO 0); -- 15-18
            MB : OUT STD_LOGIC; -- 14
            FS : OUT STD_LOGIC_VECTOR (4 DOWNTO 0); -- 09-13
            MD : OUT STD_LOGIC; -- 08
            RW : OUT STD_LOGIC; -- 07
            MM : OUT STD_LOGIC; -- 06
            MW : OUT STD_LOGIC; -- 05
            RV : OUT STD_LOGIC; -- 04
            RC : OUT STD_LOGIC; -- 03
            RN : OUT STD_LOGIC; -- 02
            RZ : OUT STD_LOGIC; -- 01
            FL : OUT STD_LOGIC); -- 00
    END COMPONENT;

    SIGNAL Address : STD_LOGIC_VECTOR (16 DOWNTO 0);
    SIGNAL NA : STD_LOGIC_VECTOR (16 DOWNTO 0);
    SIGNAL MS : STD_LOGIC_VECTOR (2 DOWNTO 0);
    SIGNAL MC : STD_LOGIC;
    SIGNAL IL : STD_LOGIC;
    SIGNAL PI : STD_LOGIC;
    SIGNAL PL : STD_LOGIC;
    SIGNAL TD : STD_LOGIC_VECTOR (3 DOWNTO 0);
    SIGNAL TA : STD_LOGIC_VECTOR (3 DOWNTO 0);
    SIGNAL TB : STD_LOGIC_VECTOR (3 DOWNTO 0);
    SIGNAL MB : STD_LOGIC;
    SIGNAL FS : STD_LOGIC_VECTOR (4 DOWNTO 0);
    SIGNAL MD : STD_LOGIC;
    SIGNAL RW : STD_LOGIC;
    SIGNAL MM : STD_LOGIC;
    SIGNAL MW : STD_LOGIC;
    SIGNAL RV : STD_LOGIC;
    SIGNAL RC : STD_LOGIC;
    SIGNAL RN : STD_LOGIC;
    SIGNAL RZ : STD_LOGIC;
    SIGNAL FL : STD_LOGIC;

    CONSTANT StudentID : STD_LOGIC_VECTOR := x"154D884";

BEGIN
    uut : CPU_ControlMemory PORT MAP(
        Address => Address,
        NA => NA,
        MS => MS,
        MC => MC,
        IL => IL,
        PI => PI,
        PL => PL,
        TD => TD,
        TA => TA,
        TB => TB,
        MB => MB,
        FS => FS,
        MD => MD,
        RW => RW,
        MM => MM,
        MW => MW,
        RV => RV,
        RC => RC,
        RN => RN,
        RZ => RZ,
        FL => FL
    );

    ps : PROCESS BEGIN
        Address <= "00000000000000000";
        WAIT FOR 10ns;
        Address <= "00000000000000001";
        WAIT FOR 10ns;
        Address <= "00000000000000010";
        WAIT FOR 10ns;
        Address <= "00000000000000011";
        WAIT FOR 10ns;
        Address <= "00000000000000100";
        WAIT FOR 10ns;
        Address <= "00000000000000101";
        WAIT FOR 10ns;
        Address <= "00000000000000110";
        WAIT FOR 10ns;
        Address <= "00000000000000111";
        WAIT FOR 10ns;
        Address <= "00000000000001000";
        WAIT FOR 10ns;
        Address <= "00000000000001001";
        WAIT FOR 10ns;
        Address <= "00000000000001010";
        WAIT FOR 10ns;
        Address <= "00000000000001011";
        WAIT FOR 10ns;
        Address <= "00000000000001100";
        WAIT FOR 10ns;
        Address <= "00000000000001101";
        WAIT FOR 10ns;
        Address <= "00000000000001110";
        WAIT FOR 10ns;
        Address <= "00000000000001111";
        WAIT FOR 10ns;
        Address <= "00000000000010000";
        WAIT FOR 10ns;
        Address <= "00000000000010001";
        WAIT FOR 10ns;
        Address <= "00000000000010010";
        WAIT FOR 10ns;
        Address <= "00000000000010011";
        WAIT FOR 10ns;
        Address <= "00000000000010100";
        WAIT FOR 10ns;
        Address <= "00000000000010101";
        WAIT FOR 10ns;
        Address <= "00000000000010110";
        WAIT FOR 10ns;
        Address <= "00000000000010111";
        WAIT FOR 10ns;
        Address <= "00000000000011000";
        WAIT FOR 10ns;
        Address <= "00000000000011001";
        WAIT FOR 10ns;
        Address <= "00000000000011010";
        WAIT FOR 10ns;
        Address <= "00000000000011011";
        WAIT FOR 10ns;
        Address <= "00000000000011100";
        WAIT FOR 10ns;
        Address <= "00000000000011101";
        WAIT FOR 10ns;
        Address <= "00000000000011110";
        WAIT FOR 10ns;
        Address <= "00000000000011111";
        WAIT FOR 10ns;
        Address <= "00000000000100000";
        WAIT FOR 10ns;
        Address <= "00000000000100001";
        WAIT FOR 10ns;
        Address <= "00000000000100010";
        WAIT FOR 10ns;
        Address <= "00000000000100011";
        WAIT FOR 10ns;
        Address <= "00000000000100100";
        WAIT FOR 10ns;
        Address <= "00000000000100101";
        WAIT FOR 10ns;
        Address <= "00000000000100110";
        WAIT FOR 10ns;
        Address <= "00000000000100111";
        WAIT FOR 10ns;
        Address <= "00000000000101000";
        WAIT FOR 10ns;
        Address <= "00000000000101001";
        WAIT FOR 10ns;
        Address <= "00000000000101010";
        WAIT FOR 10ns;
        Address <= "00000000000101011";
        WAIT FOR 10ns;
        Address <= "00000000000101100";
        WAIT FOR 10ns;
        Address <= "00000000000101101";
        WAIT FOR 10ns;
        Address <= "00000000000101110";
        WAIT FOR 10ns;
        Address <= "00000000000101111";
        WAIT FOR 10ns;
        Address <= "00000000000110000";
        WAIT FOR 10ns;
        Address <= "00000000000110001";
        WAIT FOR 10ns;
        Address <= "00000000000110010";
        WAIT FOR 10ns;
        Address <= "00000000000110011";
        WAIT FOR 10ns;
        Address <= "00000000000110100";
        WAIT FOR 10ns;
        Address <= "00000000000110101";
        WAIT FOR 10ns;
        Address <= "00000000000110110";
        WAIT FOR 10ns;
        Address <= "00000000000110111";
        WAIT FOR 10ns;
        Address <= "00000000000111000";
        WAIT FOR 10ns;
        Address <= "00000000000111001";
        WAIT FOR 10ns;
        Address <= "00000000000111010";
        WAIT FOR 10ns;
        Address <= "00000000000111011";
        WAIT FOR 10ns;
        Address <= "00000000000111100";
        WAIT FOR 10ns;
        Address <= "00000000000111101";
        WAIT FOR 10ns;
        Address <= "00000000000111110";
        WAIT FOR 10ns;
        Address <= "00000000000111111";
        WAIT FOR 10ns;
        Address <= "00000000001000000";
        WAIT FOR 10ns;
        Address <= "00000000001000001";
        WAIT FOR 10ns;
        Address <= "00000000001000010";
        WAIT FOR 10ns;
        Address <= "00000000001000011";
        WAIT FOR 10ns;
        Address <= "00000000001000100";
        WAIT FOR 10ns;
        Address <= "00000000001000101";
        WAIT FOR 10ns;
        Address <= "00000000001000110";
        WAIT FOR 10ns;
        Address <= "00000000001000111";
        WAIT FOR 10ns;
        Address <= "00000000001001000";
        WAIT FOR 10ns;
        Address <= "00000000001001001";
        WAIT FOR 10ns;
        Address <= "00000000001001010";
        WAIT FOR 10ns;
        Address <= "00000000001001011";
        WAIT FOR 10ns;
        Address <= "00000000001001100";
        WAIT FOR 10ns;
        Address <= "00000000001001101";
        WAIT FOR 10ns;
        Address <= "00000000001001110";
        WAIT FOR 10ns;
        Address <= "00000000001001111";
        WAIT FOR 10ns;
        Address <= "00000000001010000";
        WAIT FOR 10ns;
        Address <= "00000000001010001";
        WAIT FOR 10ns;
        Address <= "00000000001010010";
        WAIT FOR 10ns;
        Address <= "00000000001010011";
        WAIT FOR 10ns;
        Address <= "00000000001010100";
        WAIT FOR 10ns;
        Address <= "00000000001010101";
        WAIT FOR 10ns;
        Address <= "00000000001010110";
        WAIT FOR 10ns;
        Address <= "00000000001010111";
        WAIT FOR 10ns;
        Address <= "00000000001011000";
        WAIT FOR 10ns;
        Address <= "00000000001011001";
        WAIT FOR 10ns;
        Address <= "00000000001011010";
        WAIT FOR 10ns;
        Address <= "00000000001011011";
        WAIT FOR 10ns;
        Address <= "00000000001011100";
        WAIT FOR 10ns;
        Address <= "00000000001011101";
        WAIT FOR 10ns;
        Address <= "00000000001011110";
        WAIT FOR 10ns;
        Address <= "00000000001011111";
        WAIT FOR 10ns;
        Address <= "00000000001100000";
        WAIT FOR 10ns;
        Address <= "00000000001100001";
        WAIT FOR 10ns;
        Address <= "00000000001100010";
        WAIT FOR 10ns;
        Address <= "00000000001100011";
        WAIT FOR 10ns;
        Address <= "00000000001100100";
        WAIT FOR 10ns;
        Address <= "00000000001100101";
        WAIT FOR 10ns;
        Address <= "00000000001100110";
        WAIT FOR 10ns;
        Address <= "00000000001100111";
        WAIT FOR 10ns;
        Address <= "00000000001101000";
        WAIT FOR 10ns;
        Address <= "00000000001101001";
        WAIT FOR 10ns;
        Address <= "00000000001101010";
        WAIT FOR 10ns;
        Address <= "00000000001101011";
        WAIT FOR 10ns;
        Address <= "00000000001101100";
        WAIT FOR 10ns;
        Address <= "00000000001101101";
        WAIT FOR 10ns;
        Address <= "00000000001101110";
        WAIT FOR 10ns;
        Address <= "00000000001101111";
        WAIT FOR 10ns;
        Address <= "00000000001110000";
        WAIT FOR 10ns;
        Address <= "00000000001110001";
        WAIT FOR 10ns;
        Address <= "00000000001110010";
        WAIT FOR 10ns;
        Address <= "00000000001110011";
        WAIT FOR 10ns;
        Address <= "00000000001110100";
        WAIT FOR 10ns;
        Address <= "00000000001110101";
        WAIT FOR 10ns;
        Address <= "00000000001110110";
        WAIT FOR 10ns;
        Address <= "00000000001110111";
        WAIT FOR 10ns;
        Address <= "00000000001111000";
        WAIT FOR 10ns;
        Address <= "00000000001111001";
        WAIT FOR 10ns;
        Address <= "00000000001111010";
        WAIT FOR 10ns;
        Address <= "00000000001111011";
        WAIT FOR 10ns;
        Address <= "00000000001111100";
        WAIT FOR 10ns;
        Address <= "00000000001111101";
        WAIT FOR 10ns;
        Address <= "00000000001111110";
        WAIT FOR 10ns;
        Address <= "00000000001111111";
        WAIT FOR 10ns;
    END PROCESS;

END Simulation;