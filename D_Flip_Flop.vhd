----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09/14/2024 08:44:32 PM
-- Design Name: 
-- Module Name: D_Flip_Flop - Behavioral
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

entity D_Flip_Flop is
  Port (D: in std_logic;
        CLK: in std_logic;
        Q: out std_logic;
        Q_bar :out std_logic 
         );
end D_Flip_Flop;

architecture Behavioral of D_Flip_Flop is

begin
    process(CLK)
        begin
        if rising_edge(CLK) then
           Q <= D;
           Q_bar <= not D;
         end if;
     end process;
    

end Behavioral;
