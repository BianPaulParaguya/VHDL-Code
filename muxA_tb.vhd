----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09/27/2024 10:03:15 PM
-- Design Name: 
-- Module Name: muxA_tb - testbench
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

entity muxA_tb is
--  Port ( );
end muxA_tb;

architecture testbench of muxA_tb is
    
    component muxA is
        generic (N : integer := 4);
        port (
            a0, a1, a2, a3, a4, a5, a6, a7 : in std_logic_vector((2*N)-1 downto 0);
            sel : in std_logic_vector(2 downto 0);
            b   : out std_logic_vector((2*N)-1 downto 0)
        );
        end component;
    
    signal a0, a1, a2, a3, a4, a5, a6, a7 : std_logic_vector((2*4)-1 downto 0); 
    signal sel : std_logic_vector(2 downto 0);  
    signal b   : std_logic_vector((2*4)-1 downto 0); 


begin
    uut: muxA
        generic map (
            N => 4
        )
        port map (
            a0 => a0,
            a1 => a1,
            a2 => a2,
            a3 => a3,
            a4 => a4,
            a5 => a5,
            a6 => a6,
            a7 => a7,
            sel => sel,
            b   => b
        );
     
    

    stimulus: process
    begin
        a0 <= "00000001";
        a1 <= "00000010";
        a2 <= "00000011";
        a3 <= "00000100";
        a4 <= "00000101";
        a5 <= "00000110";
        a6 <= "00000111";
        a7 <= "00001000";

        sel <= "000";  
        wait for 10 ns;
        sel <= "001";  
        wait for 10 ns;
        sel <= "010";  
        wait for 10 ns;
        sel <= "011";  
        wait for 10 ns;
        sel <= "100";  
        wait for 10 ns;
        sel <= "101"; 
        wait for 10 ns;
        sel <= "110";  
        wait for 10 ns;
        sel <= "111";  
        wait for 10 ns;

        wait;
    end process stimulus;

end testbench;
