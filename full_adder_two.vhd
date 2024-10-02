----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09/20/2024 10:34:35 PM
-- Design Name: 
-- Module Name: full_adder_two - structural
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

-- Declare the full adder entity
entity full_adder is
    Port ( A    : in  std_logic;
           B    : in  std_logic;
           Cin  : in  std_logic;
           Sum  : out std_logic;
           Cout : out std_logic);
end full_adder;

architecture structural of full_adder is

    -- Signals to connect the half adders
    signal sum1, carry1, carry2: std_logic;

    -- Declare the half_adder component
    component half_adder
        Port ( a    : in  std_logic;
               b    : in  std_logic;
               s    : out std_logic;
               cout : out std_logic);
    end component;

begin

    -- First half adder: Adds A and B
    HA1: half_adder
        port map(
            a => A,
            b => B,
            s => sum1,         -- Intermediate sum
            cout => carry1     -- Intermediate carry
        );
 
    -- Second half adder: Adds intermediate sum (sum1) and Cin
    HA2: half_adder
        port map(
            a => sum1,         -- Intermediate sum from HA1
            b => Cin,          -- Carry-in
            s => Sum,          -- Final sum
            cout => carry2     -- Carry from sum1 and Cin
        );

    -- Final carry-out is the OR of both carry outputs
    Cout <= carry1 or carry2;

end structural;

