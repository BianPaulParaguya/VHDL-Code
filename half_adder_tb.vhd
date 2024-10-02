----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09/02/2024 05:06:51 PM
-- Design Name: 
-- Module Name: half_adder_tb - Behavioral
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



entity half_adder_tb is
    -- note no ports for a testbench
end half_adder_tb;

architecture Behavioral of half_adder_tb is
    component half_adder is
     Port ( a : in std_logic; 
           b : in std_logic; 
           s : out std_logic; 
           cout: out std_logic);
    end component; 
    
    signal a,b : std_logic;
    signal s,cout: std_logic;
    
begin
    uut: half_adder
        port map (
            a => a,
            b => b,
            s => s,
            cout => cout
        );

    
    process
    begin
      
        a <= '0'; b <= '0'; wait for 10 ns;
        a <= '0'; b <= '1'; wait for 10 ns;
        a <= '1'; b <= '0'; wait for 10 ns;
        a <= '1'; b <= '1'; wait for 10 ns;

        wait;
    end process;

end Behavioral;

