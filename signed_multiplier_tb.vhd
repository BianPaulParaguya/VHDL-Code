----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/09/2024 03:10:46 PM
-- Design Name: 
-- Module Name: signed_multiplier_tb - Behavioral
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

entity signed_multiplier_tb is
--  Port ( );
end signed_multiplier_tb;

architecture Behavioral of signed_multiplier_tb is

component signed_multiplier is
        Port (
            x : in std_logic_vector(3 downto 0);
            y : in std_logic_vector(3 downto 0);
            z : out std_logic_vector(7 downto 0)
        );
        end component;

    signal x, y : std_logic_vector(3 downto 0);
    signal z : std_logic_vector(7 downto 0);
    
begin

    UUT: signed_multiplier port map (
        x => x,
        y => y,
        z => z
    );

    stim_proc: process
    begin
        x <= "0011";  -- 3 in binary
        y <= "0010";  -- 2 in binary
        wait for 10 ns;
              
        x <= "0111";  -- 7 in binary
        y <= "0101";  -- 5 in binary
        wait for 10 ns;
     
        x <= "1111";  -- 15 in binary
        y <= "1111";  -- 15 in binary
        wait for 10 ns;

        x <= "0000";  -- 0 in binary
        y <= "1010";  -- 10 in binary
        wait for 10 ns;
        
        x <= "1001";  -- -7 in binary
        y <= "0001";  -- 1 in binary
        wait for 10 ns;
        
        x <= "1100";  -- -4 in binary
        y <= "1100";  -- 1 in binary
        wait for 10 ns;
        
        x <= "1000";  -- -8 in binary
        y <= "0011";  -- 3 in binary
        wait for 10 ns;

        wait;
    end process;


end Behavioral;
