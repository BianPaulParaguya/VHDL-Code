----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/02/2024 03:00:28 PM
-- Design Name: 
-- Module Name: Register_with_sync_reset_set_load - Behavioral
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

entity Register_with_sync_reset_set_load is
    Port ( clk : in STD_LOGIC;
           reset : in STD_LOGIC;
           set : in STD_LOGIC;
           load : in STD_LOGIC;
           D : in STD_LOGIC_VECTOR (3 downto 0);
           Q : out STD_LOGIC_VECTOR (3 downto 0));
end Register_with_sync_reset_set_load;

architecture Behavioral of Register_with_sync_reset_set_load is

signal Q_internal : std_logic_vector(3 downto 0);

begin
    process (clk)
    begin
        if rising_edge(clk) then
            if reset = '1' then
                Q_internal <= (others => '0'); 
            elsif set = '1' then
                Q_internal <= (others => '1');  
            elsif load = '1' then
                Q_internal <= D;  
            end if;
        end if;
    end process;

    Q <= Q_internal;  

end Behavioral;
