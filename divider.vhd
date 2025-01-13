----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/18/2024 10:52:31 AM
-- Design Name: 
-- Module Name: divider - Behavioral
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

entity divider is
generic (
        WIDTH : integer := 4  
    );
    port (
        a, b : in std_logic_vector(WIDTH-1 downto 0);
        quo_uns, re_uns : out std_logic_vector(WIDTH-1 downto 0);
        quo_sig, re_sig : out std_logic_vector(WIDTH-1 downto 0)
    );
end divider;

architecture Behavioral of divider is
signal a_unsigned, b_unsigned : unsigned(WIDTH-1 downto 0);
    signal a_signed, b_signed : signed(WIDTH-1 downto 0);
    signal quo_unsigned : unsigned(WIDTH-1 downto 0);
    signal re_unsigned : unsigned(WIDTH-1 downto 0);
    signal quo_signed : signed(WIDTH-1 downto 0);
    signal re_signed : signed(WIDTH-1 downto 0);
begin
    a_unsigned <= unsigned(a);
    b_unsigned <= unsigned(b);
    a_signed <= signed(a);
    b_signed <= signed(b);

    quo_unsigned <= a_unsigned / b_unsigned;
    re_unsigned <= a_unsigned rem b_unsigned;

    quo_signed <= a_signed / b_signed;
    re_signed <= a_signed rem b_signed;

    quo_uns <= std_logic_vector(quo_unsigned);
    re_uns <= std_logic_vector(re_unsigned);
    quo_sig <= std_logic_vector(quo_signed);
    re_sig <= std_logic_vector(re_signed);
end Behavioral;
