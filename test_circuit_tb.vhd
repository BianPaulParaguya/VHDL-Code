----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/27/2024 05:43:34 PM
-- Design Name: 
-- Module Name: test_circuit_tb - Behavioral
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

entity test_circuit_tb is
--  Port ( );
end test_circuit_tb;

architecture Behavioral of test_circuit_tb is
    signal in1 : signed(7 downto 0);
    signal in2 : signed(4 downto 0);
    signal out1 : signed(7 downto 0);
    signal out2 : signed(7 downto 0);
begin
    uut: entity work.test_circuit
        port map (
            in1 => in1,
            in2 => in2,
            out1 => out1,
            out2 => out2
        );

    process
    begin
        in1 <= to_signed(50, 8); 
        in2 <= to_signed(5, 5); 
        wait for 10 ns;

        in1 <= to_signed(-25, 8); 
        in2 <= to_signed(12, 5); 
        wait for 10 ns;

        in1 <= to_signed(15, 8); 
        in2 <= to_signed(-7, 5); 
        wait for 10 ns;

        in1 <= to_signed(-50, 8);
        in2 <= to_signed(-3, 5); 
        wait for 10 ns;

        in1 <= to_signed(1, 8);
        in2 <= to_signed(1, 5);
        wait for 10 ns;

        wait;
    end process;
end Behavioral;
