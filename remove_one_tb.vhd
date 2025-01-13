----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12/05/2024 10:34:19 AM
-- Design Name: 
-- Module Name: remove_one_tb - Behavioral
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

entity remove_one_tb is
--  Port ( );
end remove_one_tb;

architecture Behavioral of remove_one_tb is
component remove_one
        port (
            clk : in std_logic;
            reset : in std_logic;
            data_in : in std_logic;
            data_out : out std_logic
        );
    end component;

    signal clk : std_logic := '0';
    signal reset : std_logic := '0';
    signal data_in : std_logic := '0';
    signal data_out : std_logic;

    constant clk_period : time := 10 ns;

begin
    uut: remove_one
        port map (
            clk => clk,
            reset => reset,
            data_in => data_in,
            data_out => data_out
        );

process
    begin
        while true loop
            clk <= '0';
            wait for clk_period / 2;
            clk <= '1';
            wait for clk_period / 2;
        end loop;
    end process;

 process
    begin
        reset <= '1';
        wait for clk_period * 2;
        reset <= '0';

        data_in <= '0'; wait for clk_period;
        data_in <= '0'; wait for clk_period;
        data_in <= '0'; wait for clk_period;
        data_in <= '1'; wait for clk_period;
        data_in <= '1'; wait for clk_period;
        data_in <= '1'; wait for clk_period;
        data_in <= '1'; wait for clk_period;
        data_in <= '1'; wait for clk_period;
        data_in <= '0'; wait for clk_period;
        data_in <= '0'; wait for clk_period;
        data_in <= '0'; wait for clk_period;
        data_in <= '1'; wait for clk_period;
        data_in <= '1'; wait for clk_period;
        data_in <= '1'; wait for clk_period;
        data_in <= '0'; wait for clk_period;
        data_in <= '0'; wait for clk_period;
        data_in <= '0'; wait for clk_period;

        wait;
    end process;
end Behavioral;
