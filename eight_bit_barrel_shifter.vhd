----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/17/2024 12:13:15 PM
-- Design Name: 
-- Module Name: eight_bit_barrel_shifter - Behavioral
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

entity eight_bit_barrel_shifter is
    Port ( a : in STD_LOGIC_VECTOR (7 downto 0);
           amt : in STD_LOGIC_VECTOR (2 downto 0);
           y : out STD_LOGIC_VECTOR (7 downto 0));
end eight_bit_barrel_shifter;

architecture Behavioral of eight_bit_barrel_shifter is

    begin
        with amt select
               y <= a(0) & a(7 downto 1) when "001", 
                   a(1 downto 0) & a(7 downto 2) when "010", 
                   a(2 downto 0) & a(7 downto 3) when "011", 
                   a(3 downto 0) & a(7 downto 4) when "100", 
                   a(4 downto 0) & a(7 downto 5) when "101", 
                   a(5 downto 0) & a(7 downto 6) when "110", 
                   a(6 downto 0) & a(7) when "111", 
                   a when others; 

end Behavioral;
