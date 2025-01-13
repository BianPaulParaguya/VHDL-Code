----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/26/2024 02:06:25 PM
-- Design Name: 
-- Module Name: TreeMaxDetector - Behavioral
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

entity TreeMaxDetector is
    generic (
        SIZE : natural := 6;  -- Number of inputs
        BITS : natural := 5   -- Bits per input
    );
    port (
        inputs : in unsigned_vector(0 to SIZE-1)(BITS-1 downto 0); -- Array of inputs
        max_val : out unsigned(BITS-1 downto 0) -- Output maximum value
    );
end TreeMaxDetector;

architecture behavioral of TreeMaxDetector is
    -- Constants for tree structure
    constant LAYERS : natural := integer(ceil(log2(real(SIZE))));
    constant PWR_OF_TWO : natural := 2**LAYERS;

    -- Internal signal for holding the maximum values at each level
    signal stage : unsigned_vector(0 to PWR_OF_TWO-1)(BITS-1 downto 0);
begin

    process (inputs)
    begin
        -- Initialization: Copy inputs into the first stage
        for i in 0 to SIZE-1 loop
            stage(i) <= inputs(i);
        end loop;

        -- Fill unused slots with zeros if SIZE is not a power of two
        for i in SIZE to PWR_OF_TWO-1 loop
            stage(i) <= (others => '0');
        end loop;

        -- Tree-based reduction to find the maximum
        for j in 1 to LAYERS loop
            for i in 0 to PWR_OF_TWO/(2**j)-1 loop
                if stage(2*i) > stage(2*i+1) then
                    stage(i) <= stage(2*i);
                else
                    stage(i) <= stage(2*i+1);
                end if;
            end loop;
        end loop;

        -- Final maximum value
        max_val <= stage(0);
    end process;
end Behavioral;

