----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/26/2024 01:25:53 PM
-- Design Name: 
-- Module Name: ChainMaxDetector - Behavioral
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

entity ChainMaxDetector is
  generic (
        SIZE : positive := 6;  -- Number of inputs
        BITS : positive := 5   -- Number of bits per input
    );
    port (
        clk    : in  std_logic;                        -- Clock signal
        rst    : in  std_logic;                        -- Reset signal
        inputs : in  unsigned(SIZE*BITS-1 downto 0);   -- Flattened array for inputs
        output : out unsigned(BITS-1 downto 0)         -- Maximum value output
    );
end entity ChainMaxDetector;

architecture Behavioral of ChainMaxDetector is
    type unsigned_array is array (0 to SIZE-1) of unsigned(BITS-1 downto 0);
    signal input_array : unsigned_array;   -- Array for splitting inputs
    signal max_value   : unsigned(BITS-1 downto 0);   -- Signal for max value
begin
    -- Split the flattened inputs into an array
    process(inputs)
    begin
        for i in 0 to SIZE-1 loop
            input_array(i) <= inputs((i+1)*BITS-1 downto i*BITS);
        end loop;
    end process;

    -- Sequential process for finding maximum
    process(clk, rst)
        variable temp_max : unsigned(BITS-1 downto 0);
    begin
        if rst = '1' then
            max_value <= (others => '0');  -- Reset max value
        elsif rising_edge(clk) then
            temp_max := (others => '0');  -- Initialize temp_max
            for i in 0 to SIZE-1 loop
                if input_array(i) > temp_max then
                    temp_max := input_array(i);
                end if;
            end loop;
            max_value <= temp_max;  -- Update max value
        end if;
    end process;

    output <= max_value;
end Behavioral;