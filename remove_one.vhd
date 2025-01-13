----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12/05/2024 10:33:09 AM
-- Design Name: 
-- Module Name: remove_one - Behavioral
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

entity remove_one is
    Port ( clk : in STD_LOGIC;
           reset : in STD_LOGIC;
           data_in : in STD_LOGIC;
           data_out : out STD_LOGIC);
end remove_one;

architecture Behavioral of remove_one is
type state_type is (S0, S1, S2);
    signal current_state, next_state : state_type;
begin
    process(reset, clk)
    begin
        if reset = '1' then
            current_state <= S0;
        elsif rising_edge(clk) then
            current_state <= next_state;
        end if;
    end process;

    process(current_state, data_in)
    begin
        case current_state is
            when S0 =>
                data_out <= data_in;
                if data_in = '1' then
                    next_state <= S1;
                else
                    next_state <= S0;
                end if;
            when S1 =>
                data_out <= '0';
                if data_in = '1' then
                    next_state <= S2;
                else
                    next_state <= S0;
                end if;
            when S2 =>
                data_out <= data_in;
                if data_in = '0' then
                    next_state <= S0;
                else
                    next_state <= S2;
                end if;
        end case;
    end process;
end Behavioral;
