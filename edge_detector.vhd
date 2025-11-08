----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/02/2025 09:17:29 AM
-- Design Name: 
-- Module Name: edge_detector - Behavioral
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

entity edge_detector is
    Port ( clk : in STD_LOGIC;
           rst_n : in STD_LOGIC;
           signal_1 : in STD_LOGIC;
           rising : out STD_LOGIC;
           falling : out STD_LOGIC;
           delay : out STD_LOGIC);
end edge_detector;

architecture Behavioral of edge_detector is
signal s1, s2 : std_logic := '0';
begin
  process(clk, rst_n)
  begin
    if rst_n = '0' then
      s1 <= '0';
      s2 <= '0';
    elsif rising_edge(clk) then
      s1 <= signal_1;  
      s2 <= s1;        
    end if;
  end process;


  rising  <= s1 and (not s2);  
  falling <= (not s1) and s2;  

  delay <= s2;
end Behavioral;
