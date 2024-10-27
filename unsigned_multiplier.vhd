----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/17/2024 10:51:21 AM
-- Design Name: 
-- Module Name: unsigned_multiplier - Behavioral
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

entity unsigned_multiplier is
    Port ( x : in STD_LOGIC_VECTOR (3 downto 0);
           y : in STD_LOGIC_VECTOR (3 downto 0);
           z : out STD_LOGIC_VECTOR (7 downto 0));
end unsigned_multiplier;

architecture Behavioral of unsigned_multiplier is
    
    signal and_out : std_logic_vector(14 downto 0);
    signal cout: std_logic_vector(10 downto 0);
    signal sumout: std_logic_vector(5 downto 0);
    
   component half_adder is 
    port ( x : in std_logic; 
           y : in std_logic; 
           sum : out std_logic; 
           carry_out: out std_logic);
    end component;
    
   component full_adder is
     port (x : in std_logic;
           y : in std_logic;
           carry_in : in std_logic;
           sum : out std_logic;
           carry_out : out std_logic);
    end component;

begin

    -- First Row of And Gates
    z(0) <= x(0) and y(0); 
    and_out(0) <= x(1) and y(0);
    and_out(1) <= x(2) and y(0);
    and_out(2) <= x(3) and y(0);

    -- Second row of And gates
    and_out(3) <= x(0) and y(1);
    and_out(4) <= x(1) and y(1);
    and_out(5) <= x(2) and y(1);
    and_out(6) <= x(3) and y(1);

    -- Third row of And gates 
    and_out(7) <= x(0) and y(2);
    and_out(8) <= x(1) and y(2);
    and_out(9) <= x(2) and y(2);
    and_out(10) <= x(3) and y(2);

    -- Fourth row of And gates 
    and_out(11) <= x(0) and y(3);
    and_out(12) <= x(1) and y(3);
    and_out(13) <= x(2) and y(3);
    and_out(14) <= x(3) and y(3);

    -- Half Adders
    HA1: half_adder port map(
        x => and_out(0), 
        y => and_out(3), 
        sum => z(1), 
        carry_out => cout(0)
    );

    HA2: half_adder port map(
        x => and_out(6), 
        y => cout(2), 
        sum => sumout(2), 
        carry_out => cout(3)
    );

    HA3: half_adder port map(
        x => and_out(7), 
        y => sumout(0), 
        sum => z(2), 
        carry_out => cout(4)
    );

    HA4: half_adder port map(
        x => and_out(11), 
        y => sumout(3), 
        sum => z(3), 
        carry_out => cout(8)
    );

    -- Full Adders
    FA1: full_adder port map(
        x => and_out(1), 
        y => and_out(4), 
        carry_in => cout(0), 
        sum => sumout(0), 
        carry_out => cout(1)
    );

    FA2: full_adder port map(
        x => and_out(2), 
        y => and_out(5), 
        carry_in => cout(1), 
        sum => sumout(1), 
        carry_out => cout(2)
    );

    FA3: full_adder port map(
        x => sumout(1), 
        y => and_out(8), 
        carry_in => cout(4), 
        sum => sumout(3), 
        carry_out => cout(5)
    );

    FA4: full_adder port map(
        x => and_out(9), 
        y => sumout(2),
        carry_in => cout(5), 
        sum => sumout(4), 
        carry_out => cout(6)
    );

    FA5: full_adder port map(
        x => cout(3), 
        y => and_out(10), 
        carry_in => cout(6), 
        sum => sumout(5), 
        carry_out => cout(7)
    );

    FA6: full_adder port map(
        x => sumout(4), 
        y => and_out(12), 
        carry_in => cout(8), 
        sum => z(4), 
        carry_out => cout(9)
    );
 
    FA7: full_adder port map(
        x => and_out(13), 
        y => sumout(5), 
        carry_in => cout(9), 
        sum => z(5), 
        carry_out => cout(10)
    );
    
    FA8: full_adder port map(
        x => cout(7), 
        y => and_out(14), 
        carry_in => cout(10), 
        sum => z(6), 
        carry_out => z(7)
    );
     
end Behavioral;
