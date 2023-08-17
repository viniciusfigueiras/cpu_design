library ieee;

use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity single_port_ram is
    generic(
        addr_w : constant := 8; --256 bytes
        data_w : constant := 8;
    );
    port(
      ram_addr: in (addr_w - 1 downto 0);
      data_in: in (data_w - 1 downto 0);
      w_enable: in std_logic;
      r_enable: in std_logic;
      clk: in std_logic;
      data_out: out std_logic_vector (data_w - 1 downto 0);
    );
end single_port_ram;

architecture arch of ram is
    type mem_array is array (0 to integer((2 ** addr_w) - 1)) of std_logic_vector (data_w - 1 downto 0);
    signal ram : mem_array:=(others=>(others=>'0'));
begin
process(clk)
    begin
      if(rising_edge(clk) then
        if(w_enable = '1') then
          ram_mem(to_integer(unsigned(ram_addr))) <= data_in;
        end if;
        if(r_enable = '1') then
            data_out <= ram_mem(to_integer(unsigned(ram_addr))) 
      end if;
end process;
end arch;
