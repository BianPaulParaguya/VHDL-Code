----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 08/21/2024 06:17:19 PM
-- Design Name: 
-- Module Name: Led_blink - Behavioral
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
use IEEE.STD_LOGIC_1164.all;

entity half_adder is
    Port ( a : in std_logic; 
           b : in std_logic; 
           s : out std_logic; 
           cout: out std_logic);
end half_adder;
    
architecture Behavioral of half_adder is

    begin
        s <= a xor b;
        cout <= a and b;
    end behavioral;
