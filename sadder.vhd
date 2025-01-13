----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/28/2024 02:12:36 PM
-- Design Name: 
-- Module Name: sadder - Behavioral
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

entity sadder is
    port (
        x, y, clk, reset, start: in std_logic; 
        s: out std_logic
    );
end sadder;

architecture Behavioral of sadder is
    signal xi, yi, si, carry, carry_next : std_logic;  
    
    component shift_register_new is
        Port (
            clk, reset : in std_logic;
            serial_in : in std_logic;
            serial_out : out std_logic
        );
    end component;

    component full_adder is
        Port (
            a, b, cin : in std_logic;
            sum, cout : out std_logic
        );
    end component;

    component d_flip_flop is
        Port (
            d, clk, reset : in std_logic;
            q : out std_logic
        );
    end component;

begin

    x_reg: shift_register_new
        Port map (
            clk => clk, 
            reset => reset, 
            serial_in => x, 
            serial_out => xi
        );

    y_reg: shift_register_new
        Port map (
            clk => clk, 
            reset => reset, 
            serial_in => y, 
            serial_out => yi
        );

    s_reg: shift_register_new
        Port map (
            clk => clk, 
            reset => reset, 
            serial_in => si, 
            serial_out => s
        );

    full_adder_inst: full_adder
        Port map (
            a => xi, 
            b => yi, 
            cin => carry,
            sum => si,
            cout => carry_next
        );

    carry_ff: d_flip_flop
        Port map (
            d => carry_next, 
            clk => clk, 
            reset => reset, 
            q => carry
        );
end Behavioral;