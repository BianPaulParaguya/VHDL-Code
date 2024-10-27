----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/11/2024 10:21:02 AM
-- Design Name: 
-- Module Name: four_bit_adder_subtractor - structiral
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

entity four_bit_adder_subtractor is
    Port ( A0 : in STD_LOGIC;
           A1 : in STD_LOGIC;
           A2 : in STD_LOGIC;
           A3 : in STD_LOGIC;
           B0 : in STD_LOGIC;
           B1 : in STD_LOGIC;
           B2 : in STD_LOGIC;
           B3 : in STD_LOGIC;
           K : in STD_LOGIC;
           S0 : out STD_LOGIC;
           S1 : out STD_LOGIC;
           S2 : out STD_LOGIC;
           S3 : out STD_LOGIC);
end four_bit_adder_subtractor;

architecture structiral of four_bit_adder_subtractor is
    signal xor1,xor2,xor3,xor4 : std_logic;
    signal C0,C1,C2,Cout : std_logic;
    
    component full_adder
    port (A : in std_logic;
          B : in std_logic;
          Cin : in std_logic;
          Sum : out std_logic;
          Cout : out std_logic);
     end component;

begin
    FA1: full_adder
        port map(
            A => A0,
            B => xor1,
            Cin => K,
            Sum => S0,
            Cout => C0
            );
            
    FA2: full_adder
        port map(
            A => A1,
            B => xor2,
            Cin => C0,
            Sum => S1,
            Cout => C1
            );
            
    FA3: full_adder
        port map(
            A => A2,
            B => xor3,
            Cin => C1,
            Sum => S2,
            Cout => C2
            );
        
    FA4: full_adder
        port map(
            A => A3,
            B => xor4,
            Cin => C2,
            Sum => S3,
            Cout => Cout
            );                

    xor1 <= B0 xor K;
    xor2 <= B1 xor K;
    xor3 <= B2 xor K;
    xor4 <= B3 xor K;
end structiral;
