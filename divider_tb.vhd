----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/18/2024 11:05:26 AM
-- Design Name: 
-- Module Name: divider_tb - Behavioral
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

entity divider_tb is
--  Port ( );
end divider_tb;

architecture Behavioral of divider_tb is

constant WIDTH : integer := 4;

    -- Signals for inputs and outputs
    signal a, b : std_logic_vector(WIDTH-1 downto 0);
    signal quo_uns, re_uns : std_logic_vector(WIDTH-1 downto 0);
    signal quo_sig, re_sig : std_logic_vector(WIDTH-1 downto 0);

    -- Instantiate the Unit Under Test (UUT)
    component divider
        generic (
            WIDTH : integer
        );
        port (
            a, b : in std_logic_vector(WIDTH-1 downto 0);
            quo_uns, re_uns : out std_logic_vector(WIDTH-1 downto 0);
            quo_sig, re_sig : out std_logic_vector(WIDTH-1 downto 0)
        );
    end component;

begin
    -- Connect UUT
    UUT: divider
        generic map (WIDTH => WIDTH)
        port map (
            a => a,
            b => b,
            quo_uns => quo_uns,
            re_uns => re_uns,
            quo_sig => quo_sig,
            re_sig => re_sig
        );

    process
    begin
        a <= "0111";  
        b <= "0100";  
        wait for 80 ns;
        
        a <= "0111";  
        b <= "1100";  
        wait for 80 ns;

        a <= "1111";  
        b <= "0001";  
        wait for 80 ns;

        a <= "1111";  
        b <= "1111";  
        wait for 80 ns;

        a <= "1000";  
        b <= "0100";  
        wait for 80 ns;
        
        a <= "1000";  
        b <= "1101";  
        wait for 80 ns;

        wait;
    end process;


end Behavioral;
