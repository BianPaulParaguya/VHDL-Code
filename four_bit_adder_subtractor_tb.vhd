----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/11/2024 07:00:02 PM
-- Design Name: 
-- Module Name: four_bit_adder_subtractor_tb - Behavioral
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

entity four_bit_adder_subtractor_tb is
--  Port ( );
end four_bit_adder_subtractor_tb;

architecture Behavioral of four_bit_adder_subtractor_tb is

 COMPONENT four_bit_adder_subtractor
    PORT(
         A0 : IN  std_logic;
         A1 : IN  std_logic;
         A2 : IN  std_logic;
         A3 : IN  std_logic;
         B0 : IN  std_logic;
         B1 : IN  std_logic;
         B2 : IN  std_logic;
         B3 : IN  std_logic;
         K  : IN  std_logic;
         S0 : OUT std_logic;
         S1 : OUT std_logic;
         S2 : OUT std_logic;
         S3 : OUT std_logic
        );
    END COMPONENT;
    
    signal A0, A1, A2, A3 : std_logic := '0';
    signal B0, B1, B2, B3 : std_logic := '0';
    signal K              : std_logic := '0';
    signal S0, S1, S2, S3 : std_logic;

BEGIN

    uut: four_bit_adder_subtractor PORT MAP (
          A0 => A0,
          A1 => A1,
          A2 => A2,
          A3 => A3,
          B0 => B0,
          B1 => B1,
          B2 => B2,
          B3 => B3,
          K => K,
          S0 => S0,
          S1 => S1,
          S2 => S2,
          S3 => S3
        );

    stim_proc: PROCESS
    BEGIN
        A3 <= '0'; A2 <= '0'; A1 <= '0'; A0 <= '0'; --  Decimal 0
        B3 <= '0'; B2 <= '0'; B1 <= '0'; B0 <= '1'; --  Decimal 1
        K <= '0'; -- addition
        WAIT FOR 10 ns;

        A3 <= '1'; A2 <= '0'; A1 <= '0'; A0 <= '1'; --  Decimal 9
        B3 <= '0'; B2 <= '1'; B1 <= '0'; B0 <= '1'; --  Decimal 5
        K <= '0'; -- addition
        WAIT FOR 10 ns;

        A3 <= '1'; A2 <= '0'; A1 <= '1'; A0 <= '1'; --  Decimal 11
        B3 <= '0'; B2 <= '1'; B1 <= '0'; B0 <= '0'; --  Decimal 4
        K <= '0'; -- addition
        WAIT FOR 10 ns;

        A3 <= '1'; A2 <= '0'; A1 <= '1'; A0 <= '0'; --  Decimal 10
        B3 <= '1'; B2 <= '1'; B1 <= '0'; B0 <= '0'; --  Decimal 12
        K <= '1'; -- subtraction
        WAIT FOR 10 ns;

        A3 <= '1'; A2 <= '1'; A1 <= '1'; A0 <= '1'; --  Decimal 15
        B3 <= '1'; B2 <= '1'; B1 <= '1'; B0 <= '1'; --  Decimal 15
        K <= '1'; -- subtraction
        WAIT FOR 10 ns;

        A3 <= '1'; A2 <= '1'; A1 <= '0'; A0 <= '1'; --  Decimal 13
        B3 <= '0'; B2 <= '1'; B1 <= '1'; B0 <= '0'; --  Decimal 6
        K <= '1'; -- subtraction
        WAIT FOR 10 ns;
     
        WAIT;
    END PROCESS;
end Behavioral;
