----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/02/2024 03:03:15 PM
-- Design Name: 
-- Module Name: Register_with_sync_reset_set_load_tb - Behavioral
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

entity Register_with_sync_reset_set_load_tb is
--  Port ( );
end Register_with_sync_reset_set_load_tb;

architecture Behavioral of Register_with_sync_reset_set_load_tb is

signal clk : std_logic := '0';
    signal reset : std_logic := '0';
    signal set : std_logic := '0';
    signal load : std_logic := '0';
    signal D : std_logic_vector(3 downto 0) := "0000";
    signal Q : std_logic_vector(3 downto 0);

    constant clk_period : time := 10 ns;
begin
    uut: entity work.Register_with_sync_reset_set_load
        port map (
            clk => clk,
            reset => reset,
            set => set,
            load => load,
            D => D,
            Q => Q
        );

    clk_process: process
    begin
        clk <= '0';
        wait for clk_period/2;
        clk <= '1';
        wait for clk_period/2;
    end process;

    stimulus_process: process
    begin
        reset <= '1';
        wait for clk_period;
        reset <= '0';

        set <= '1';
        wait for clk_period;
        set <= '0';

        load <= '1';
        D <= "1010";
        wait for clk_period;
        load <= '0';

        reset <= '1';
        set <= '1';
        load <= '1';
        D <= "1100";
        wait for clk_period;
        
        reset <= '0';
        wait for clk_period;

        set <= '0';
        load <= '1';
        D <= "1111";
        wait for clk_period;

        wait;
    end process;

end Behavioral;
