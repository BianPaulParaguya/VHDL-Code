----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/17/2024 12:21:20 PM
-- Design Name: 
-- Module Name: eight_bit_barrel_shifter_tb - Behavioral
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity eight_bit_barrel_shifter_tb is
--  Port ( );
end eight_bit_barrel_shifter_tb;

architecture Behavioral of eight_bit_barrel_shifter_tb is

component eight_bit_barrel_shifter
        Port (
            a : in STD_LOGIC_VECTOR (7 downto 0);
            amt : in STD_LOGIC_VECTOR (2 downto 0);
            y : out STD_LOGIC_VECTOR (7 downto 0)
        );
    end component;

    signal a : STD_LOGIC_VECTOR (7 downto 0) := (others => '0');
    signal amt : STD_LOGIC_VECTOR (2 downto 0) := (others => '0');
    signal y : STD_LOGIC_VECTOR (7 downto 0);

begin
    uut: eight_bit_barrel_shifter
        Port map (
            a => a,
            amt => amt,
            y => y
        );

process
    begin
        a <= "11010010";

        amt <= "000"; wait for 10 ns; 
        amt <= "001"; wait for 10 ns; 
        amt <= "010"; wait for 10 ns; 
        amt <= "011"; wait for 10 ns; 
        amt <= "100"; wait for 10 ns; 
        amt <= "101"; wait for 10 ns; 
        amt <= "110"; wait for 10 ns; 
        amt <= "111"; wait for 10 ns; 
        
        wait;
    end process;
end Behavioral;
