----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/10/2024 02:47:20 PM
-- Design Name: 
-- Module Name: sync_down_counter - Behavioral
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

entity sync_down_counter is
    Port ( clk : in STD_LOGIC;
           clear : in STD_LOGIC;
           load : in STD_LOGIC;
           enable : in STD_LOGIC;
           load_value : in STD_LOGIC_VECTOR (3 downto 0);
           Q : out STD_LOGIC_VECTOR (3 downto 0));
end sync_down_counter;

architecture Behavioral of sync_down_counter is

signal counter: STD_LOGIC_VECTOR(3 downto 0) := (others => '0');
begin
    process (clk)
    begin
        if rising_edge(clk) then
            if (clear = '1') then
                counter <= (others => '0');  
            elsif (load = '1') then
                counter <= load_value; 
            elsif (enable = '1') then
                if unsigned(counter) > 0 then
                    counter <= std_logic_vector(unsigned(counter) - 1);  
                else
                    counter <= (others => '0'); 
                end if;
            end if;
        end if;
    end process;

    Q <= counter;

end Behavioral;
