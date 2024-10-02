----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09/27/2024 09:54:34 PM
-- Design Name: 
-- Module Name: muxA - Behavioral
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity muxA is
    generic (N : integer := 4); 
    port (
            a0, a1, a2, a3, a4, a5, a6, a7 : in  std_logic_vector((2*N)-1 downto 0);
            sel : in  std_logic_vector(2 downto 0);
            b   : out std_logic_vector((2*N)-1 downto 0)
   );
end muxA;

architecture Behavioral of muxA is

begin
       with sel select
        b <= a0 when "000",
             a1 when "001",
             a2 when "010",
             a3 when "011",
             a4 when "100",
             a5 when "101",
             a6 when "110",
             a7 when "111",
             (others => '0') when others;  
end Behavioral;
