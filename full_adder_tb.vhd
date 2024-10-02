----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09/20/2024 10:13:35 PM
-- Design Name: 
-- Module Name: full_adder_tb - RTL
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

entity full_adder_tb is
--  Port ( );
end full_adder_tb;

architecture RTL of full_adder_tb is
    component full_adder is
     port(A: in std_logic;
        B: in std_logic;
        Cin: in std_logic;
        sum: out std_logic;
        Cout: out std_logic
        );
    end component;
         
    signal A, B, Cin : std_logic;
    signal Sum, Cout : std_logic; 

               
begin
 uut : full_adder 
        port map(A => A,
                 B => B,
                 Cin => Cin,   
                 sum => Sum,
                 Cout => Cout
                 );
     process
        begin
            A <='0'; B <='0'; Cin<='0'; wait for 10ns;
            A <='0'; B <='0'; Cin<='1'; wait for 10ns;
            A <='0'; B <='1'; Cin<='0'; wait for 10ns;
            A <='0'; B <='1'; Cin<='1'; wait for 10ns;
            A <='1'; B <='0'; Cin<='0'; wait for 10ns;
            A <='1'; B <='0'; Cin<='1'; wait for 10ns;
            A <='1'; B <='1'; Cin<='0'; wait for 10ns;
            A <='1'; B <='1'; Cin<='1'; wait for 10ns;
            wait;
      end process;
end RTL;
