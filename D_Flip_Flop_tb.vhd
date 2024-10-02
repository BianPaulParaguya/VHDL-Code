----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09/15/2024 07:39:32 PM
-- Design Name: 
-- Module Name: D_Flip_Flop_tb - Behavioral
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

entity D_Flip_Flop_tb is
--  Port ( );
end D_Flip_Flop_tb;

architecture Behavioral of D_Flip_Flop_tb is
    component D_Flip_Flop
        port (
        D: in std_logic;
        CLK: in std_logic;
        Q: out std_logic;
        Q_bar : out std_logic
        );
      end component;
      
      signal D_tb :std_logic :='0';
      signal CLK_tb: std_logic := '0';
      signal Q_tb :std_logic :='0';
      signal Q_bar_tb: std_logic := '0';

begin
    uut: D_Flip_Flop
        port map( 
            D=>D_tb,
            CLK => CLK_tb,
            Q => Q_tb,
            Q_bar=> Q_bar_tb
                );   
                
    CLK_process : process
    begin
        while true loop
            CLK_tb <= '0';
            wait for 10 ns;  
            CLK_tb <= '1';
            wait for 10 ns;
        end loop;
    end process;

    stim_proc: process
    begin
        wait for 25 ns;
        D_tb <= '1';  
        wait for 40 ns;
        D_tb <= '0'; 
        wait for 40 ns;
        D_tb <= '1';  

        wait for 100 ns;
        wait;
    end process; 


end Behavioral;
