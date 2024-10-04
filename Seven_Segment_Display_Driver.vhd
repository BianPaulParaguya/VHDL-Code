----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/03/2024 06:16:04 PM
-- Design Name: 
-- Module Name: Seven_Segment_Display_Driver - behavioral
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

entity Seven_Segment_Display_Driver is
  Port ( ABCD : in std_logic_vector(3 downto 0);
		 a : out std_logic;
		 b : out std_logic;
		 c : out std_logic;
		 d : out std_logic;
		 e : out std_logic;
		 f : out std_logic;
		 g : out std_logic);
end Seven_Segment_Display_Driver;

architecture behavioral of Seven_Segment_Display_Driver is
        
begin
    process(ABCD)
		begin
			case ABCD is 
			when "0000" =>
				a <= '1';
				b <= '1';
				c <= '1';
				d <= '1';
				e <= '1';
				f <= '1';
				g <= '0';
				
			when "0001" =>
				a <= '0';
				b <= '1';
				c <= '1';
				d <= '0';
				e <= '0';
				f <= '0';
				g <= '0';
				
			when "0010" => 
				a <= '1';
				b <= '1';
				c <= '0';
				d <= '1';
				e <= '1';
				f <= '0';
				g <= '1';
				
			when "0011" => 
				a <= '1';
				b <= '1';
				c <= '1';
				d <= '1';
				e <= '0';
				f <= '0';
				g <= '1';
				
			when "0100" => 
				a <= '0';
				b <= '1';
				c <= '1';
				d <= '0';
				e <= '0';
				f <= '1';
				g <= '1';
				
			when "0101" => 
				a <= '1';
				b <= '0';
				c <= '1';
				d <= '1';
				e <= '0';
				f <= '1';
				g <= '1';
				
			when "0110" =>
				a <= '1';
				b <= '0';
				c <= '1';
				d <= '1';
				e <= '1';
				f <= '1';
				g <= '1';
				
			when "0111" => 
				a <= '1';
				b <= '1';
				c <= '1';
				d <= '0';
				e <= '0';
				f <= '0';
				g <= '0';
				
			when "1000" => 
				a <= '1';
				b <= '1';
				c <= '1';
				d <= '1';
				e <= '1';
				f <= '1';
				g <= '1';
				
			when "1001" => 
				a <= '1';
				b <= '1';
				c <= '1';
				d <= '1';
				e <= '0';
				f <= '1';
				g <= '1';
				
			when others => 
				a <= '0';
				b <= '0';
				c <= '0';
				d <= '0';
				e <= '0';
				f <= '0';
				g <= '0';
				
		  end case;
		 end process;
               
end behavioral;
