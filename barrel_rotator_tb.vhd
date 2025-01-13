----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/12/2024 02:37:03 PM
-- Design Name: 
-- Module Name: barrel_rotator_tb - Behavioral
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

entity barrel_rotator_tb is
--  Port ( );
end barrel_rotator_tb;

architecture Behavioral of barrel_rotator_tb is

component barrel_rotator
        Port ( amt : in STD_LOGIC_VECTOR(3 downto 0);
               a   : in STD_LOGIC_VECTOR(15 downto 0);
               y   : out STD_LOGIC_VECTOR(15 downto 0));
    end component;

    -- Testbench signals
    signal amt : STD_LOGIC_VECTOR(3 downto 0) := (others => '0'); 
    signal a   : STD_LOGIC_VECTOR(15 downto 0) := (others => '0'); 
    signal y   : STD_LOGIC_VECTOR(15 downto 0); 

begin

    uut: barrel_rotator
        Port map (
            amt => amt,
            a => a,
            y => y
        );

    process
    begin
        a <= "1011010101011101";
        amt <= "0000";
        wait for 10 ns;
        
        amt <= "0001";
        wait for 10 ns;

        amt <= "0010";
        wait for 10 ns;

        amt <= "0011";
        wait for 10 ns;

        amt <= "0100";
        wait for 10 ns;

        amt <= "0101";
        wait for 10 ns;

        amt <= "1000";
        wait for 10 ns;

        amt <= "0111";
        wait for 10 ns;

        amt <= "1111";
        wait for 10 ns;

        amt <= "0000";
        wait for 10 ns;

        wait;
    end process;


end Behavioral;
