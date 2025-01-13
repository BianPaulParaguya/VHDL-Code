----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/24/2024 03:10:45 PM
-- Design Name: 
-- Module Name: digital_lock_tb - Behavioral
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

entity digital_lock_tb is
--  Port ( );
end digital_lock_tb;

architecture Behavioral of digital_lock_tb is

component Digital_Lock
        Port (
            clk         : in STD_LOGIC;
            new_1       : in STD_LOGIC;
            value       : in STD_LOGIC_VECTOR(3 downto 0);
            reset       : in STD_LOGIC;
            open_closed : out STD_LOGIC
        );
    end component;

    signal clk         : STD_LOGIC := '0';
    signal new_1       : STD_LOGIC := '0';
    signal value       : STD_LOGIC_VECTOR(3 downto 0) := (others => '0');
    signal reset       : STD_LOGIC := '0';
    signal open_closed : STD_LOGIC;

    constant CLOCK_PERIOD : time := 10 ns;

begin

    uut: Digital_Lock
        Port map (
            clk         => clk,
            new_1       => new_1,
            value       => value,
            reset       => reset,
            open_closed => open_closed
        );

 process
    begin
        while true loop
            clk <= '0';
            wait for CLOCK_PERIOD / 2;
            clk <= '1';
            wait for CLOCK_PERIOD / 2;
        end loop;
    end process;

 process
    begin
        reset <= '1';
        wait for CLOCK_PERIOD;
        reset <= '0';
        wait for CLOCK_PERIOD;

        value <= "1010"; 
        new_1 <= '1';
        wait for CLOCK_PERIOD;
        new_1 <= '0';
        wait for CLOCK_PERIOD;

        value <= "0110"; 
        new_1 <= '1';
        wait for CLOCK_PERIOD;
        new_1 <= '0';
        wait for CLOCK_PERIOD;

        value <= "1100"; 
        new_1 <= '1';
        wait for CLOCK_PERIOD;
        new_1 <= '0';
        wait for CLOCK_PERIOD;

        reset <= '1';
        wait for CLOCK_PERIOD;
        reset <= '0';
        wait for CLOCK_PERIOD;

        wait;
    end process;

end Behavioral;
