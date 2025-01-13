----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/26/2024 02:09:54 PM
-- Design Name: 
-- Module Name: CounterWithMax_tb - Behavioral
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

entity CounterWithMax_tb is
--  Port ( );
end CounterWithMax_tb;

architecture Behavioral of CounterWithMax_tb is
constant MAX : integer := 6;
    constant BITS : integer := 3;

    -- Signals for DUT ports
    signal clk : std_logic := '0';
    signal reset : std_logic := '0';
    signal is_max : std_logic;
    signal count : unsigned(BITS-1 downto 0);
begin
    uut: entity work.CounterWithMax
        generic map (
            MAX => MAX,
            BITS => BITS
        )
        port map (
            clk => clk,
            reset => reset,
            is_max => is_max,
            count => count
        );

    clk_process : process
    begin
        clk <= '0';
        wait for 10 ns;
        clk <= '1';
        wait for 10 ns;
    end process;

    test_process : process
    begin
        reset <= '1';
        wait for 20 ns; 
        reset <= '0';

        wait for 200 ns;

        reset <= '1';
        wait for 20 ns;
        reset <= '0';

        wait for 200 ns;

        wait;
    end process;
end Behavioral;
