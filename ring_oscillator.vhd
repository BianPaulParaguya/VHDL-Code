----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/18/2024 09:54:28 AM
-- Design Name: 
-- Module Name: ring_oscillator - Behavioral
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

entity ring_oscillator is
generic (
        NUM_INV : integer := 6  
    );
    port (
        ena : in std_logic;  
        osc : out std_logic  
    );
end ring_oscillator;

architecture RTL of ring_oscillator is
    signal inv : std_logic_vector(NUM_INV downto 0) := (others => '0');  
begin
    inv(0) <=ena nand inv(NUM_INV) after 1 ns ;

    gen_inverters: for i in 0 to NUM_INV-1 generate
        inv(i + 1) <= not inv(i) after 1 ns ;
    end generate; 

    osc <= inv(NUM_INV);
end RTL;
