----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12/02/2024 03:05:26 PM
-- Design Name: 
-- Module Name: odd_even_fsm_tb - Behavioral
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

entity odd_even_fsm_tb is
--  Port ( );
end odd_even_fsm_tb;

architecture Behavioral of odd_even_fsm_tb is
component odd_even_fsm is
        Port (
            x : in STD_LOGIC;          
            reset : in STD_LOGIC;     
            y : out STD_LOGIC          
        );
    end component;

    signal x : STD_LOGIC := '0';      
    signal reset : STD_LOGIC := '0';  
    signal y : STD_LOGIC;             
begin
    uut: odd_even_fsm
        Port map (
            x => x,
            reset => reset,
            y => y
        );

process
    begin
        reset <= '1';  
        wait for 10 ns;
        reset <= '0';  
        wait for 20 ns;
        
        x <= '0';  
        wait for 10 ns;
        x <= '1';  
        wait for 10 ns;
        x <= '1';  
        wait for 10 ns;
        x <= '0';  
        wait for 10 ns;
        x <= '1';  
        wait for 10 ns;
        x <= '0';  
        wait for 10 ns;
        wait;
    end process;
end Behavioral;
