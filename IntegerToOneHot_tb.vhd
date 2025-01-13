----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/26/2024 02:16:26 PM
-- Design Name: 
-- Module Name: IntegerToOneHot_tb - Behavioral
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

entity IntegerToOneHot_tb is
--  Port ( );
end IntegerToOneHot_tb;

architecture Behavioral of IntegerToOneHot_tb is
constant BITS : integer := 5;  
    signal int_val : integer range 0 to BITS-1 := 0;
    signal onehot : std_logic_vector(BITS-1 downto 0);
    
begin
    uut: entity work.IntegerToOneHot
        generic map (
            BITS => BITS
        )
        port map (
            int_val => int_val,
            onehot => onehot
        );

    process
    begin
        for i in 0 to BITS-1 loop
            int_val <= i;
            wait for 10 ns;  
        end loop;
        wait;
    end process;
end Behavioral;
