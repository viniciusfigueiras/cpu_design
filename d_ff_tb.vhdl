library ieee;
use ieee.std_logic_1164.all;

--  A testbench has no ports.
entity d_ff_tb is
end d_ff_tb;

architecture arch of d_ff_tb is
  --  Declaration of the component that will be instantiated.
  component dff_set_reset
    port (D, enable, reset, clk : in std_logic; Q : out std_logic);
  end component;

  --  Specifies which entity is bound with the component.
  for dff_set_reset_0: dff_set_reset use entity work.dff_set_reset;
  signal D, enable, reset, clk, Q : std_logic;
  constant clk_period : time := 10 ns;
  signal end_sim : std_logic;
begin
  --  Component instantiation.
  dff_set_reset_0: dff_set_reset port map (D => D, enable => enable, reset => reset, clk => clk, Q => Q);
    
  process
    begin
      loop
        clk <= '0';
        wait for clk_period;
        clk <= '1';
        wait for clk_period;
        exit when end_sim = '1';
      end loop;
  assert false report "end of test" severity note;
  wait;
  end process;

  process
    begin
      reset <= '0';
      D <= '0';
      enable <= '1';
      wait for 5*clk_period;
      D <= '1';
      wait for 5*clk_period;
      reset <= '1';
      wait for 5*clk_period;
      enable <= '0';    
    assert false report "end of test" severity note;
    end_sim <= '1';
    wait;    
    --  Wait forever; this will finish the simulation.
  end process;

end arch;
