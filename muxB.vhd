----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09/27/2024 10:10:47 PM
-- Design Name: 
-- Module Name: muxB - Behavioral
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

entity muxB is
    generic (N : integer := 4);  -- Generic bus width, default value of 4
    port (
         a0, a1, a2, a3, a4, a5, a6, a7 : in std_logic_vector(2*N-1 downto 0);  
        sel : in  std_logic_vector(2 downto 0);  
        b   : out std_logic_vector(2*N-1 downto 0)
    );
end muxB;

architecture Behavioral of muxB is
begin
    process(a0, a1, a2, a3, a4, a5, a6, a7, sel)
    begin
        
        if sel = "000" then
            b <= a0;
        elsif sel = "001" then
            b <= a1;
        elsif sel = "010" then
            b <= a2;
        elsif sel = "011" then
            b <= a3;
        elsif sel = "100" then
            b <= a4;
        elsif sel = "101" then
            b <= a5;
        elsif sel = "110" then
            b <= a6;
        elsif sel = "111" then
            b <= a7;
        else
            b <= (others => '0');  
        end if;
    end process;

end Behavioral;
