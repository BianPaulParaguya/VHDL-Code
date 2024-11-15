----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/10/2024 02:47:37 PM
-- Design Name: 
-- Module Name: sync_down_counter_tb - Behavioral
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

entity sync_down_counter_tb is
--  Port ( );
end sync_down_counter_tb;

architecture Behavioral of sync_down_counter_tb is

COMPONENT sync_down_counter
    PORT(
         clk : IN  std_logic;
         clear : IN  std_logic;
         enable : IN  std_logic;
         load : IN  std_logic;
         load_value : IN  std_logic_vector(3 downto 0);
         Q : OUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
    
    signal clk : std_logic := '0';
    signal clear : std_logic := '0';
    signal enable : std_logic := '0';
    signal load : std_logic := '0';
    signal load_value : std_logic_vector(3 downto 0) := "1010"; 
    signal Q : std_logic_vector(3 downto 0);

    constant clk_period : time := 10 ns;

BEGIN

    uut: sync_down_counter PORT MAP (
          clk => clk,
          clear => clear,
          enable => enable,
          load => load,
          load_value => load_value,
          Q => Q
        );

    clk_process :process
    begin
        clk <= '0';
        wait for clk_period/2;
        clk <= '1';
        wait for clk_period/2;
    end process;

    stim_proc: process
    begin	
        clear <= '1';
        wait for clk_period;
        clear <= '0';
        
        load <= '1';
        load_value <= "1010"; 
        wait for clk_period;
        load <= '0';
        
        enable <= '1';
        wait for 5 * clk_period; 
        
        clear <= '1';
        wait for clk_period;
        clear <= '0';
        
        load <= '1';
        load_value <= "0110"; 
        wait for clk_period;
        load <= '0';
        
        enable <= '1';
        wait for 5 * clk_period;
        
        wait;
    end process;

end Behavioral;
