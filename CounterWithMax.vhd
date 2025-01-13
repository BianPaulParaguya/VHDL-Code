----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/26/2024 02:07:54 PM
-- Design Name: 
-- Module Name: CounterWithMax - Behavioral
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

entity CounterWithMax is
    generic (
        MAX : integer := 6;  
        BITS : integer := 3  
    );
    port (
        clk : in std_logic;         
        reset : in std_logic;       
        is_max : out std_logic;    
        count : out unsigned(BITS-1 downto 0) 
    );
end CounterWithMax;

architecture Behavioral of CounterWithMax is
    signal counter : unsigned(BITS-1 downto 0) := (others => '0'); 
begin
    process(clk, reset)
    begin
        if reset = '1' then
            counter <= (others => '0'); 
        elsif rising_edge(clk) then
            if counter = to_unsigned(MAX, BITS) then
                counter <= (others => '0'); 
            else
                counter <= counter + 1; 
            end if;
        end if;
    end process;

    count <= counter; 
    is_max <= '1' when counter = to_unsigned(MAX, BITS) else '0'; 
end Behavioral;
