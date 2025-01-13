----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/27/2024 01:13:44 PM
-- Design Name: 
-- Module Name: TreeMaxDetector_tb - Behavioral
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
use work.user_defined_type_pkg.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity TreeMaxDetector_tb is
--  Port ( );
end TreeMaxDetector_tb;

architecture Behavioral of TreeMaxDetector_tb is
constant SIZE : natural := 6;
    constant BITS : natural := 5;

    -- Signals for inputs and output
    signal inputs : unsigned_vector(0 to SIZE-1)(BITS-1 downto 0);
    signal max_val : unsigned(BITS-1 downto 0);

begin

    -- Instantiate the Unit Under Test (UUT)
    uut: entity work.TreeMaxDetector
        generic map (
            SIZE => SIZE,
            BITS => BITS
        )
        port map (
            inputs => inputs,
            max_val => max_val
        );

    -- Test process
    process
    begin
        -- Test inputs: {3, 9, 5, 28, 18, 12}
        inputs(0) <= to_unsigned(3, BITS);
        inputs(1) <= to_unsigned(9, BITS);
        inputs(2) <= to_unsigned(5, BITS);
        inputs(3) <= to_unsigned(28, BITS);
        inputs(4) <= to_unsigned(18, BITS);
        inputs(5) <= to_unsigned(12, BITS);
        wait for 10 ns;

        -- Verify the output
        assert max_val = to_unsigned(28, BITS) report "Test failed: Expected max_val = 28" severity error;

        wait; -- End simulation
    end process;

end Behavioral;
