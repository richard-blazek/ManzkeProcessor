----------------------------------------------------------------------------------
-- Engineer: Richard Blažek
-- Create Date: 12/01/2023 10:06:28 AM
-- Module Name: CPU_CAR - Behavioral
----------------------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;

ENTITY CPU_CAR IS
    PORT (
        NextAddress : IN STD_LOGIC_VECTOR (16 DOWNTO 0);
        Load, Clock, Reset : IN STD_LOGIC;
        Address : OUT STD_LOGIC_VECTOR (16 DOWNTO 0));
END CPU_CAR;

ARCHITECTURE Behavioral OF CPU_CAR IS
    COMPONENT CPU_JKFlipFlop IS
        PORT (
            J, K, Clock, Reset : IN STD_LOGIC;
            Q, Q_not : OUT STD_LOGIC);
    END COMPONENT;

    CONSTANT AND_gate_delay : TIME := 9ns;
    CONSTANT NAND_gate_delay : TIME := 7ns;
    CONSTANT OR_gate_delay : TIME := 7ns;
    CONSTANT NOR_gate_delay : TIME := 8ns;
    CONSTANT XOR_gate_delay : TIME := 4ns;
    CONSTANT XNOR_gate_delay : TIME := 4ns;
    CONSTANT NOT_gate_delay : TIME := 3ns;

    SIGNAL Increment : STD_LOGIC;
    SIGNAL AddressOut : STD_LOGIC_VECTOR (16 DOWNTO 0);
    SIGNAL QSum : STD_LOGIC_VECTOR (1 TO 15);
    SIGNAL ToggleFF, SetFF, ResetFF : STD_LOGIC_VECTOR (0 TO 16);
    SIGNAL J, K : STD_LOGIC_VECTOR (0 TO 16);

BEGIN

    Increment <= NOT Load AFTER NOT_gate_delay;

    QSum(1) <= AddressOut(0) AND AddressOut(1) AFTER AND_gate_delay;
    QSum(2) <= QSum(1) AND AddressOut(2) AFTER AND_gate_delay;
    QSum(3) <= QSum(2) AND AddressOut(3) AFTER AND_gate_delay;
    QSum(4) <= QSum(3) AND AddressOut(4) AFTER AND_gate_delay;
    QSum(5) <= QSum(4) AND AddressOut(5) AFTER AND_gate_delay;
    QSum(6) <= QSum(5) AND AddressOut(6) AFTER AND_gate_delay;
    QSum(7) <= QSum(6) AND AddressOut(7) AFTER AND_gate_delay;
    QSum(8) <= QSum(7) AND AddressOut(8) AFTER AND_gate_delay;
    QSum(9) <= QSum(8) AND AddressOut(9) AFTER AND_gate_delay;
    QSum(10) <= QSum(9) AND AddressOut(10) AFTER AND_gate_delay;
    QSum(11) <= QSum(10) AND AddressOut(11) AFTER AND_gate_delay;
    QSum(12) <= QSum(11) AND AddressOut(12) AFTER AND_gate_delay;
    QSum(13) <= QSum(12) AND AddressOut(13) AFTER AND_gate_delay;
    QSum(14) <= QSum(13) AND AddressOut(14) AFTER AND_gate_delay;
    QSum(15) <= QSum(14) AND AddressOut(15) AFTER AND_gate_delay;

    ToggleFF(0) <= Increment;
    ToggleFF(1) <= Increment AND AddressOut(0) AFTER AND_gate_delay;
    ToggleFF(2) <= Increment AND QSum(1) AFTER AND_gate_delay;
    ToggleFF(3) <= Increment AND QSum(2) AFTER AND_gate_delay;
    ToggleFF(4) <= Increment AND QSum(3) AFTER AND_gate_delay;
    ToggleFF(5) <= Increment AND QSum(4) AFTER AND_gate_delay;
    ToggleFF(6) <= Increment AND QSum(5) AFTER AND_gate_delay;
    ToggleFF(7) <= Increment AND QSum(6) AFTER AND_gate_delay;
    ToggleFF(8) <= Increment AND QSum(7) AFTER AND_gate_delay;
    ToggleFF(9) <= Increment AND QSum(8) AFTER AND_gate_delay;
    ToggleFF(10) <= Increment AND QSum(9) AFTER AND_gate_delay;
    ToggleFF(11) <= Increment AND QSum(10) AFTER AND_gate_delay;
    ToggleFF(12) <= Increment AND QSum(11) AFTER AND_gate_delay;
    ToggleFF(13) <= Increment AND QSum(12) AFTER AND_gate_delay;
    ToggleFF(14) <= Increment AND QSum(13) AFTER AND_gate_delay;
    ToggleFF(15) <= Increment AND QSum(14) AFTER AND_gate_delay;
    ToggleFF(16) <= Increment AND QSum(15) AFTER AND_gate_delay;

    SetFF(0) <= Load AND NextAddress(0) AFTER AND_gate_delay;
    SetFF(1) <= Load AND NextAddress(1) AFTER AND_gate_delay;
    SetFF(2) <= Load AND NextAddress(2) AFTER AND_gate_delay;
    SetFF(3) <= Load AND NextAddress(3) AFTER AND_gate_delay;
    SetFF(4) <= Load AND NextAddress(4) AFTER AND_gate_delay;
    SetFF(5) <= Load AND NextAddress(5) AFTER AND_gate_delay;
    SetFF(6) <= Load AND NextAddress(6) AFTER AND_gate_delay;
    SetFF(7) <= Load AND NextAddress(7) AFTER AND_gate_delay;
    SetFF(8) <= Load AND NextAddress(8) AFTER AND_gate_delay;
    SetFF(9) <= Load AND NextAddress(9) AFTER AND_gate_delay;
    SetFF(10) <= Load AND NextAddress(10) AFTER AND_gate_delay;
    SetFF(11) <= Load AND NextAddress(11) AFTER AND_gate_delay;
    SetFF(12) <= Load AND NextAddress(12) AFTER AND_gate_delay;
    SetFF(13) <= Load AND NextAddress(13) AFTER AND_gate_delay;
    SetFF(14) <= Load AND NextAddress(14) AFTER AND_gate_delay;
    SetFF(15) <= Load AND NextAddress(15) AFTER AND_gate_delay;
    SetFF(16) <= Load AND NextAddress(16) AFTER AND_gate_delay;

    ResetFF(0) <= Increment NOR NextAddress(0) AFTER NOR_gate_delay;
    ResetFF(1) <= Increment NOR NextAddress(1) AFTER NOR_gate_delay;
    ResetFF(2) <= Increment NOR NextAddress(2) AFTER NOR_gate_delay;
    ResetFF(3) <= Increment NOR NextAddress(3) AFTER NOR_gate_delay;
    ResetFF(4) <= Increment NOR NextAddress(4) AFTER NOR_gate_delay;
    ResetFF(5) <= Increment NOR NextAddress(5) AFTER NOR_gate_delay;
    ResetFF(6) <= Increment NOR NextAddress(6) AFTER NOR_gate_delay;
    ResetFF(7) <= Increment NOR NextAddress(7) AFTER NOR_gate_delay;
    ResetFF(8) <= Increment NOR NextAddress(8) AFTER NOR_gate_delay;
    ResetFF(9) <= Increment NOR NextAddress(9) AFTER NOR_gate_delay;
    ResetFF(10) <= Increment NOR NextAddress(10) AFTER NOR_gate_delay;
    ResetFF(11) <= Increment NOR NextAddress(11) AFTER NOR_gate_delay;
    ResetFF(12) <= Increment NOR NextAddress(12) AFTER NOR_gate_delay;
    ResetFF(13) <= Increment NOR NextAddress(13) AFTER NOR_gate_delay;
    ResetFF(14) <= Increment NOR NextAddress(14) AFTER NOR_gate_delay;
    ResetFF(15) <= Increment NOR NextAddress(15) AFTER NOR_gate_delay;
    ResetFF(16) <= Increment NOR NextAddress(16) AFTER NOR_gate_delay;

    J(0) <= SetFF(0) OR ToggleFF(0) AFTER OR_gate_delay;
    J(1) <= SetFF(1) OR ToggleFF(1) AFTER OR_gate_delay;
    J(2) <= SetFF(2) OR ToggleFF(2) AFTER OR_gate_delay;
    J(3) <= SetFF(3) OR ToggleFF(3) AFTER OR_gate_delay;
    J(4) <= SetFF(4) OR ToggleFF(4) AFTER OR_gate_delay;
    J(5) <= SetFF(5) OR ToggleFF(5) AFTER OR_gate_delay;
    J(6) <= SetFF(6) OR ToggleFF(6) AFTER OR_gate_delay;
    J(7) <= SetFF(7) OR ToggleFF(7) AFTER OR_gate_delay;
    J(8) <= SetFF(8) OR ToggleFF(8) AFTER OR_gate_delay;
    J(9) <= SetFF(9) OR ToggleFF(9) AFTER OR_gate_delay;
    J(10) <= SetFF(10) OR ToggleFF(10) AFTER OR_gate_delay;
    J(11) <= SetFF(11) OR ToggleFF(11) AFTER OR_gate_delay;
    J(12) <= SetFF(12) OR ToggleFF(12) AFTER OR_gate_delay;
    J(13) <= SetFF(13) OR ToggleFF(13) AFTER OR_gate_delay;
    J(14) <= SetFF(14) OR ToggleFF(14) AFTER OR_gate_delay;
    J(15) <= SetFF(15) OR ToggleFF(15) AFTER OR_gate_delay;
    J(16) <= SetFF(16) OR ToggleFF(16) AFTER OR_gate_delay;

    K(0) <= ResetFF(0) OR ToggleFF(0) AFTER OR_gate_delay;
    K(1) <= ResetFF(1) OR ToggleFF(1) AFTER OR_gate_delay;
    K(2) <= ResetFF(2) OR ToggleFF(2) AFTER OR_gate_delay;
    K(3) <= ResetFF(3) OR ToggleFF(3) AFTER OR_gate_delay;
    K(4) <= ResetFF(4) OR ToggleFF(4) AFTER OR_gate_delay;
    K(5) <= ResetFF(5) OR ToggleFF(5) AFTER OR_gate_delay;
    K(6) <= ResetFF(6) OR ToggleFF(6) AFTER OR_gate_delay;
    K(7) <= ResetFF(7) OR ToggleFF(7) AFTER OR_gate_delay;
    K(8) <= ResetFF(8) OR ToggleFF(8) AFTER OR_gate_delay;
    K(9) <= ResetFF(9) OR ToggleFF(9) AFTER OR_gate_delay;
    K(10) <= ResetFF(10) OR ToggleFF(10) AFTER OR_gate_delay;
    K(11) <= ResetFF(11) OR ToggleFF(11) AFTER OR_gate_delay;
    K(12) <= ResetFF(12) OR ToggleFF(12) AFTER OR_gate_delay;
    K(13) <= ResetFF(13) OR ToggleFF(13) AFTER OR_gate_delay;
    K(14) <= ResetFF(14) OR ToggleFF(14) AFTER OR_gate_delay;
    K(15) <= ResetFF(15) OR ToggleFF(15) AFTER OR_gate_delay;
    K(16) <= ResetFF(16) OR ToggleFF(16) AFTER OR_gate_delay;

    ff0 : CPU_JKFlipFlop PORT MAP(J => J(0), K => K(0), Clock => Clock, Reset => Reset, Q => AddressOut(0));
    ff1 : CPU_JKFlipFlop PORT MAP(J => J(1), K => K(1), Clock => Clock, Reset => Reset, Q => AddressOut(1));
    ff2 : CPU_JKFlipFlop PORT MAP(J => J(2), K => K(2), Clock => Clock, Reset => Reset, Q => AddressOut(2));
    ff3 : CPU_JKFlipFlop PORT MAP(J => J(3), K => K(3), Clock => Clock, Reset => Reset, Q => AddressOut(3));
    ff4 : CPU_JKFlipFlop PORT MAP(J => J(4), K => K(4), Clock => Clock, Reset => Reset, Q => AddressOut(4));
    ff5 : CPU_JKFlipFlop PORT MAP(J => J(5), K => K(5), Clock => Clock, Reset => Reset, Q => AddressOut(5));
    ff6 : CPU_JKFlipFlop PORT MAP(J => J(6), K => K(6), Clock => Clock, Reset => Reset, Q => AddressOut(6));
    ff7 : CPU_JKFlipFlop PORT MAP(J => J(7), K => K(7), Clock => Clock, Reset => Reset, Q => AddressOut(7));
    ff8 : CPU_JKFlipFlop PORT MAP(J => J(8), K => K(8), Clock => Clock, Reset => Reset, Q => AddressOut(8));
    ff9 : CPU_JKFlipFlop PORT MAP(J => J(9), K => K(9), Clock => Clock, Reset => Reset, Q => AddressOut(9));
    ff10 : CPU_JKFlipFlop PORT MAP(J => J(10), K => K(10), Clock => Clock, Reset => Reset, Q => AddressOut(10));
    ff11 : CPU_JKFlipFlop PORT MAP(J => J(11), K => K(11), Clock => Clock, Reset => Reset, Q => AddressOut(11));
    ff12 : CPU_JKFlipFlop PORT MAP(J => J(12), K => K(12), Clock => Clock, Reset => Reset, Q => AddressOut(12));
    ff13 : CPU_JKFlipFlop PORT MAP(J => J(13), K => K(13), Clock => Clock, Reset => Reset, Q => AddressOut(13));
    ff14 : CPU_JKFlipFlop PORT MAP(J => J(14), K => K(14), Clock => Clock, Reset => Reset, Q => AddressOut(14));
    ff15 : CPU_JKFlipFlop PORT MAP(J => J(15), K => K(15), Clock => Clock, Reset => Reset, Q => AddressOut(15));
    ff16 : CPU_JKFlipFlop PORT MAP(J => J(16), K => K(16), Clock => Clock, Reset => Reset, Q => AddressOut(16));

    Address <= AddressOut;

END Behavioral;