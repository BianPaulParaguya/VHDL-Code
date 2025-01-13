----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/26/2024 02:15:43 PM
-- Design Name: 
-- Module Name: IntegerToOneHot - Behavioral
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

entity IntegerToOneHot is
    generic (
        BITS : integer := 5 
    );
    port (
        int_val : in integer range 0 to BITS-1; 
        onehot : out std_logic_vector(BITS-1 downto 0) 
    );
end IntegerToOneHot;

architecture Behavioral of IntegerToOneHot is
    function integer_to_onehot(val : integer; size : integer) return std_logic_vector is
        variable onehot_code : std_logic_vector(size-1 downto 0) := (others => '0');
    begin
        if val >= 0 and val < size then
            onehot_code(val) := '1';
        end if;
        return onehot_code;
    end function;
begin
    process(int_val)
    begin
        onehot <= integer_to_onehot(int_val, BITS);
    end process;
end Behavioral;
