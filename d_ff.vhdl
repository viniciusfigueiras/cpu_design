library ieee;
use ieee.std_logic_1164.all;

entity dff_set_reset is
    port(
        D,enable,reset,clk: in std_logic;
        Q: out std_logic
    );
end dff_set_reset;

architecture arch of dff_set_reset is
begin
    process(clk)
    begin
        if rising_edge(clk) then
            if enable='1' then 
                if reset='1' then
                    Q <= '0';
                else
                    Q <= D;
              end if;
            end if;
        end if;
    end process;
end arch;
