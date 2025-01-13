----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12/02/2024 03:02:12 PM
-- Design Name: 
-- Module Name: odd_even_fsm - Behavioral
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

entity odd_even_fsm is
    Port ( x : in STD_LOGIC;
           reset : in STD_LOGIC;
           y : out STD_LOGIC);
end odd_even_fsm;

architecture Behavioral of odd_even_fsm is
type state_type is (S0, S1);
    signal current_state : state_type := S0;  
begin
    process(x, reset)
    begin
        if reset = '1' then
            current_state <= S0;  
            y <= '1';
        else
            case current_state is
                when S0 =>
                    y <= '1'; 
                    if x = '1' then
                        current_state <= S1; 
                    end if;
                when S1 =>
                    y <= '0'; 
                    if x = '1' then
                        current_state <= S0; 
                    end if;
            end case;
        end if;
    end process;
end Behavioral;
