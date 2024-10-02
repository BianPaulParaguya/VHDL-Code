----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09/20/2024 10:40:54 PM
-- Design Name: 
-- Module Name: full_adder_two_testbench - behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity full_adder_tb is
end full_adder_tb;

architecture behavioral of full_adder_tb is

    -- Signals to connect to the full adder
    signal A, B, Cin : std_logic;
    signal Sum, Cout : std_logic;

    -- Instantiate the full adder
    component full_adder
        Port ( A    : in  std_logic;
               B    : in  std_logic;
               Cin  : in  std_logic;
               Sum  : out std_logic;
               Cout : out std_logic);
    end component;

begin

    -- Instantiate the full adder
    uut: full_adder
        port map (
            A => A,
            B => B,
            Cin => Cin,
            Sum => Sum,
            Cout => Cout
        );

    -- Stimulus process to test the full adder
    process
    begin
        -- Test all possible combinations of A, B, and Cin
        A <= '0'; B <= '0'; Cin <= '0'; wait for 10 ns;
        A <= '0'; B <= '0'; Cin <= '1'; wait for 10 ns;
        A <= '0'; B <= '1'; Cin <= '0'; wait for 10 ns;
        A <= '0'; B <= '1'; Cin <= '1'; wait for 10 ns;
        A <= '1'; B <= '0'; Cin <= '0'; wait for 10 ns;
        A <= '1'; B <= '0'; Cin <= '1'; wait for 10 ns;
        A <= '1'; B <= '1'; Cin <= '0'; wait for 10 ns;
        A <= '1'; B <= '1'; Cin <= '1'; wait for 10 ns;

        -- End simulation
        wait;
    end process;

end behavioral;

