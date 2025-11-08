----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/02/2025 09:18:32 AM
-- Design Name: 
-- Module Name: edge_detector_tb - Behavioral
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

entity edge_detector_tb is
--  Port ( );
end edge_detector_tb;

architecture Behavioral of edge_detector_tb is

constant TCLK : time := 10 ns;

  signal clk      : std_logic := '0';
  signal rst_n    : std_logic := '0';
  signal signal_1 : std_logic := '0';
  signal rising   : std_logic;
  signal falling  : std_logic;
  signal delay    : std_logic;
begin
  uut: entity work.edge_detector
    port map (
      clk      => clk,
      rst_n    => rst_n,
      signal_1 => signal_1,
      rising   => rising,
      falling  => falling,
      delay    => delay
    );

  clk <= not clk after TCLK/2;

  stim : process
  begin
    rst_n <= '0';
    wait for 30;
    rst_n <= '1';

    wait until rising_edge(clk);
    wait for 5;

    signal_1 <= '1';  wait for 30;

    signal_1 <= '0';  wait for 30;

    signal_1 <= '1';  wait for 20;
    signal_1 <= '0';  wait for 20;
    signal_1 <= '1';  wait for 20;

    wait;
  end process;

  monitor : process(clk)
  begin
    if rising_edge(clk) then
      report "t=" & integer'image(integer(now / 1 ns)) & " ns"
        & " | signal_1=" & std_logic'image(signal_1)
        & " | rising="   & std_logic'image(rising)
        & " | falling="  & std_logic'image(falling)
        & " | delay="    & std_logic'image(delay)
        severity note;
    end if;
  end process;
end Behavioral;
