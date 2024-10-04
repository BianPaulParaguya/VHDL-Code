----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/03/2024 08:19:41 PM
-- Design Name: 
-- Module Name: seven_segment_display_driver_tb - Behavioral
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

entity seven_segment_display_driver_tb is
--  Port ( );
end seven_segment_display_driver_tb;

architecture Behavioral of seven_segment_display_driver_tb is
    component Seven_segment_display_driver is
        Port ( ABCD : in std_logic_vector(3 downto 0);
             a : out std_logic;
             b : out std_logic;
             c : out std_logic;
             d : out std_logic;
             e : out std_logic;
             f : out std_logic;
             g : out std_logic);
    end component;
    
    signal ABCD : std_logic_vector(3 downto 0);
    signal a, b, c, d, e, f, g : std_logic;
    
begin
    
    uut: Seven_Segment_Display_Driver port map(
             ABCD => ABCD,
             a => a,
             b => b,
             c => c,
             d => d,
             e => e,
             f => f,
             g => g );
             
    process
        begin 
        
        ABCD <= "0000";
        wait for 10 ns;
        
        ABCD <= "0001";
        wait for 10 ns;
        
        ABCD <= "0010";
        wait for 10 ns;
        
        ABCD <= "0011";
        wait for 10 ns;
        
        ABCD <= "0100";
        wait for 10 ns;
        
        ABCD <= "0101";
        wait for 10 ns;
        
        ABCD <= "0110";
        wait for 10 ns;
        
        ABCD <= "0111";
        wait for 10 ns;
        
        ABCD <= "1000";
        wait for 10 ns;
        
        ABCD <= "1001";
        wait for 10 ns;
        
        wait; 
        end process;
end Behavioral;
