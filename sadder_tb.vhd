----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/28/2024 02:14:30 PM
-- Design Name: 
-- Module Name: sadder_tb - Behavioral
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

entity sadder_tb is
--  Port ( );
end sadder_tb;

architecture Behavioral of sadder_tb is
    signal x, y, clk, reset, start : std_logic := '0';
    signal s : std_logic;

    constant x_pattern: std_logic_vector(15 downto 0) := "1010000011110110"; -- 0xA0F6
    constant y_pattern: std_logic_vector(15 downto 0) := "1010000000111111"; -- 0xA03F
    signal actual_sum: std_logic_vector(16 downto 0) := (others => '0');

    component sadder
        Port (
            x, y, clk, reset, start : in std_logic;
            s : out std_logic
        );
    end component;

begin
    DUT: sadder
        Port map (
            x => x,
            y => y,
            clk => clk,
            reset => reset,
            start => start,
            s => s
        );

process
    begin
        while true loop
            clk <= '1';
            wait for 5 ns; 
            clk <= '0';
            wait for 5 ns;
        end loop;
    end process;

process
    begin
        reset <= '1';
        wait for 10 ns;
        reset <= '0';

        actual_sum <= std_logic_vector(resize(unsigned(x_pattern), 17) + resize(unsigned(y_pattern), 17));

        for i in 0 to 15 loop
            x <= x_pattern(i);
            y <= y_pattern(i);
            wait until rising_edge(clk);
        end loop;
        
        wait for 160ns;
        start <= '1';
        wait for 10ns; 
        start <= '0';

        wait;
    end process;
end Behavioral;