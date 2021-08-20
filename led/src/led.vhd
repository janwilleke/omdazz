----------------------------------------------------------------------------------
-- Company:
-- Engineer:
--
-- Create Date:    20:41:09 02/28/2011
-- Design Name:
-- Module Name:    ledflash - Behavioral
-- Project Name:
-- Target Devices:
-- Tool versions:
-- Description:
--
-- Dependencies:
--
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
----------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;

entity led is
  port (sys_clk   : in  std_logic;
        sys_rst_n  : in  std_logic;
        led_1         : out std_logic;
        led_2         : out std_logic
        );
end led;

architecture Behavioral of led is
  signal led_count      : std_logic_vector(28 downto 0) := (others => '0');

begin

  process (sys_clk, sys_rst_n)
  begin
    if sys_rst_n = '0' then
      led_count <= (others => '0');
    elsif sys_clk = '1' and sys_clk'event then
      led_count <= led_count + 1;
    end if;
  end process;

-------------------------------------------------------------------------------
  led_1          <= led_count(24);
  led_2          <= led_count(28);

end Behavioral;
