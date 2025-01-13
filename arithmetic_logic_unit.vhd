----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/14/2024 06:33:06 PM
-- Design Name: 
-- Module Name: arithmetic_logic_unit - Behavioral
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity arithmetic_logic_unit is
  Port (A : in std_logic_vector(7 downto 0);
        B : in std_logic_vector(7 downto 0);
        opcode : in std_logic_vector(2 downto 0);
        result : out std_logic_vector(7 downto 0)
        );
end arithmetic_logic_unit;

architecture Behavioral of arithmetic_logic_unit is

begin
    with opcode select
        result <= not A when "000", 
                  A or B when "001",
                  A xor B when "010",
                  A and B when "011", 
                  std_logic_vector(unsigned(A) * unsigned(B)) when "100",
                  std_logic_vector(unsigned(A) + unsigned(B)) when "101",
                  std_logic_vector(unsigned(A) - unsigned(B)) when "110",
                  (others=>'0') when others;
end Behavioral;
