----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/24/2024 01:57:31 PM
-- Design Name: 
-- Module Name: digital_lock - Behavioral
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

entity digital_lock is
    Port ( clk : in STD_LOGIC;
           new_1 : in STD_LOGIC;
           value : in STD_LOGIC_VECTOR (3 downto 0);
           reset : in STD_LOGIC;
           open_closed : out STD_LOGIC);
end digital_lock;

architecture Behavioral of digital_lock is

    type state_type is (S0, S1, S2, S3, ERR);
    signal current_state, next_state : state_type;

    constant KEY1 : STD_LOGIC_VECTOR(3 downto 0) := "1010";
    constant KEY2 : STD_LOGIC_VECTOR(3 downto 0) := "0110";
    constant KEY3 : STD_LOGIC_VECTOR(3 downto 0) := "1100";

    signal equal : STD_LOGIC;

begin

process(current_state, value)
    begin
        case current_state is
            when S0 =>
                if value = KEY1 then
                    equal <= '1';
                else
                    equal <= '0';
                end if;
            when S1 =>
                if value = KEY2 then
                    equal <= '1';
                else
                    equal <= '0';
                end if;
            when S2 =>
                if value = KEY3 then
                    equal <= '1';
                else
                    equal <= '0';
                end if;
            when others =>
                equal <= '0';
        end case;
    end process;

process(clk, reset)
    begin
        if reset = '1' then
            current_state <= S0;
        elsif rising_edge(clk) then
            current_state <= next_state;
        end if;
    end process;

process(current_state, new_1, equal)
    begin
        case current_state is
            when S0 =>
                if new_1 = '1' and equal = '1' then
                    next_state <= S1;
                elsif new_1 = '1' then
                    next_state <= ERR;
                else
                    next_state <= S0;
                end if;

            when S1 =>
                if new_1 = '1' and equal = '1' then
                    next_state <= S2;
                elsif new_1 = '1' then
                    next_state <= ERR;
                else
                    next_state <= S1;
                end if;

            when S2 =>
                if new_1 = '1' and equal = '1' then
                    next_state <= S3;
                elsif new_1 = '1' then
                    next_state <= ERR;
                else
                    next_state <= S2;
                end if;

            when S3 =>
                if reset = '1' then
                    next_state <= S0;
                else
                    next_state <= S3;
                end if;

            when ERR =>
                if reset = '1' then
                    next_state <= S0;
                else
                    next_state <= ERR;
                end if;

            when others =>
                next_state <= S0;
        end case;
    end process;

 process(current_state)
    begin
        case current_state is
            when S3 =>
                open_closed <= '1'; 
            when others =>
                open_closed <= '0'; 
        end case;
    end process;

end Behavioral;
