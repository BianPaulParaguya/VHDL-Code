----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/18/2024 09:57:15 AM
-- Design Name: 
-- Module Name: ring_oscillator_tb - Behavioral
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

entity ring_oscillator_tb is
--  Port ( );
end ring_oscillator_tb;

architecture Behavioral of ring_oscillator_tb is
signal ena : std_logic := '0';  -- Enable signal
    signal osc : std_logic;         -- Oscillator output

    constant NUM_INV : integer := 6;  -- Number of inverters

    -- Instantiate the ring oscillator
    component ring_oscillator
        generic (
            NUM_INV : integer := NUM_INV
        );
        port (
            ena : in std_logic;
            osc : out std_logic
        );
    end component;

begin
    -- Instantiate the ring oscillator and connect the signals
    uut: ring_oscillator
        generic map (
            NUM_INV => NUM_INV
        )
        port map (
            ena => ena,
            osc => osc
        );

    -- Test process to enable the oscillator and run the simulation
    process
    begin
        ena <= '1';

        -- Step 2: Run simulation for 10 us to observe oscillations
        wait for 10 us;

        -- Step 3: Disable oscillator to observe stop
        ena <= '0';

        -- Step 4: Run for additional 1 us to confirm behavior
        wait for 10 us;

        -- End simulation
        wait;
    end process;
end Behavioral;
