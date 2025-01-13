----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/27/2024 05:42:09 PM
-- Design Name: 
-- Module Name: test_circuit - Behavioral
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

entity test_circuit is
  Port (in1 : in signed(7 downto 0); -- Example vector 1
        in2 : in signed(4 downto 0); -- Example vector 2
        out1 : out signed(7 downto 0);
        out2 : out signed(7 downto 0) );
end test_circuit;

architecture Behavioral of test_circuit is
procedure equalize_lengths(
        constant vec1 : in signed;
        constant vec2 : in signed;
        variable result1 : out signed;
        variable result2 : out signed
    ) is
        variable length1 : integer := vec1'length;
        variable length2 : integer := vec2'length;
    begin
        if length1 > length2 then
            result1 := vec1;
            result2 := resize(vec2, length1);
        elsif length2 > length1 then
            result1 := resize(vec1, length2);
            result2 := vec2;
        else
            result1 := vec1;
            result2 := vec2;
        end if;
    end procedure equalize_lengths;
begin
    process(in1, in2)
        variable temp_out1 : signed(out1'range);
        variable temp_out2 : signed(out2'range);
    begin
        equalize_lengths(in1, in2, temp_out1, temp_out2);

        out1 <= temp_out1;
        out2 <= temp_out2;
    end process;
end Behavioral;
