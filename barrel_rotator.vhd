----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/12/2024 02:33:44 PM
-- Design Name: 
-- Module Name: barrel_rotator - Behavioral
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

entity barrel_rotator is
  Port ( amt : in STD_LOGIC_VECTOR(3 downto 0); 
           a   : in STD_LOGIC_VECTOR(15 downto 0); 
           y   : out STD_LOGIC_VECTOR(15 downto 0) 
         );
end barrel_rotator;

architecture Behavioral of barrel_rotator is
    signal stage1_out : STD_LOGIC_VECTOR(15 downto 0);
    signal stage2_out : STD_LOGIC_VECTOR(15 downto 0);
    signal stage3_out : STD_LOGIC_VECTOR(15 downto 0);
    signal stage4_out : STD_LOGIC_VECTOR(15 downto 0);
    
    component two_by_one_mux
        Port ( a : in STD_LOGIC;
               b : in STD_LOGIC;
               s : in STD_LOGIC;
               y : out STD_LOGIC);
    end component;
begin
    gen_stage1: for i in 0 to 15 generate
        mux1: two_by_one_mux
            Port map (
                a => a((i + 1) mod 16),
                b => a(i),
                s => amt(0),
                y => stage1_out(i)
            );
    end generate;
    
    gen_stage2: for i in 0 to 15 generate
        mux2: two_by_one_mux
            Port map (
                a => stage1_out((i + 2) mod 16),
                b => stage1_out(i),
                s => amt(1),
                y => stage2_out(i)
            );
    end generate;
    
    gen_stage3: for i in 0 to 15 generate
        mux3: two_by_one_mux
            Port map (
                a => stage2_out((i + 4) mod 16),
                b => stage2_out(i),
                s => amt(2),
                y => stage3_out(i)
            );
    end generate;
    
    gen_stage4: for i in 0 to 15 generate
        mux4: two_by_one_mux
            Port map (
                a => stage3_out((i + 8) mod 16),
                b => stage3_out(i),
                s => amt(3),
                y => stage4_out(i)
            );
    end generate;
    
    y <= stage4_out;

end Behavioral;
