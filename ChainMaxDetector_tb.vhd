----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/27/2024 10:52:45 AM
-- Design Name: 
-- Module Name: ChainMaxDetector_tb - Behavioral
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
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ChainMaxDetector_tb is
--  Port ( );
end ChainMaxDetector_tb;

architecture Behavioral of ChainMaxDetector_tb is
    constant SIZE : positive := 6;
    constant BITS : positive := 5;

    signal clk    : std_logic := '0';
    signal rst    : std_logic := '1';
    signal inputs : unsigned(SIZE*BITS-1 downto 0);
    signal output : unsigned(BITS-1 downto 0);

    -- Clock generation
    constant CLK_PERIOD : time := 10 ns;
begin
    clk <= not clk after CLK_PERIOD / 2;

    -- Instantiate the Unit Under Test (UUT)
    UUT: entity work.ChainMaxDetector
        generic map (
            SIZE => SIZE,
            BITS => BITS
        )
        port map (
            clk => clk,
            rst => rst,
            inputs => inputs,
            output => output
        );

    -- Test process
    process
        variable temp_inputs : unsigned(SIZE*BITS-1 downto 0);
    begin
        -- Initialize reset
        rst <= '1';
        wait for 20 ns;
        rst <= '0';

        -- Apply test inputs
        for i in 0 to SIZE-1 loop
            temp_inputs((i+1)*BITS-1 downto i*BITS) := to_unsigned(SIZE - i, BITS);
        end loop;
        inputs <= temp_inputs;

        wait for 50 ns;

        -- Display results
        report "Inputs: " & to_hstring(inputs);
        report "Output: " & to_hstring(output);

        wait;
    end process;
end Behavioral;
