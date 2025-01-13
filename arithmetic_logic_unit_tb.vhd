----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01/13/2025 02:28:16 PM
-- Design Name: 
-- Module Name: arithmetic_logic_unit_tb - Behavioral
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

entity arithmetic_logic_unit_tb is
--  Port ( );
end arithmetic_logic_unit_tb;

architecture Behavioral of arithmetic_logic_unit_tb is
component arithmetic_logic_unit
    Port (
      A       : in  std_logic_vector(7 downto 0);
      B       : in  std_logic_vector(7 downto 0);
      opcode  : in  std_logic_vector(2 downto 0);
      result  : out std_logic_vector(7 downto 0)
    );
  end component;

  signal A       : std_logic_vector(7 downto 0) := (others => '0');
  signal B       : std_logic_vector(7 downto 0) := (others => '0');
  signal opcode  : std_logic_vector(2 downto 0) := "000";
  signal result  : std_logic_vector(7 downto 0);

begin
  uut: arithmetic_logic_unit
    port map (
      A => A,
      B => B,
      opcode => opcode,
      result => result
    );

  process
  begin
    A <= "00001111";
    opcode <= "000";
    wait for 10 ns;

    A <= "00001111";
    B <= "11110000";
    opcode <= "001";
    wait for 10 ns;

    A <= "11001100";
    B <= "10101010";
    opcode <= "010";
    wait for 10 ns;

    A <= "11111111";
    B <= "00001111";
    opcode <= "011";
    wait for 10 ns;

    A <= "00000011"; 
    B <= "00000010";  
    opcode <= "100";
    wait for 10 ns;

    A <= "00001010"; 
    B <= "00000101";  
    opcode <= "101";
    wait for 10 ns;

    A <= "00001000";  
    B <= "00000011";  
    opcode <= "110";
    wait for 10 ns;

    opcode <= "111";
    wait for 10 ns;

    wait;
  end process;
end Behavioral;
