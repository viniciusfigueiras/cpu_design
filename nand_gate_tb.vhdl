library ieee;
use ieee.std_logic_1164.all;

--  A testbench has no ports.
entity nand_gate_tb is
end nand_gate_tb;

architecture behav of nand_gate_tb is
  --  Declaration of the component that will be instantiated.
  component nand_gate
    port (i0, i1 : in std_logic; o : out std_logic);
  end component;

  --  Specifies which entity is bound with the component.
  for nand_gate_0: nand_gate use entity work.nand_gate;
  signal i0, i1, o : std_logic;
begin
  --  Component instantiation.
  nand_gate_0: nand_gate port map (i0 => i0, i1 => i1, o => o);

  --  This process does the real job.
  process
    type pattern_type is record
      --  The inputs of the nand_gate.
      i0, i1: std_logic;
      --  The expected outputs of the nand_gate.
      o : std_logic;
    end record;
    --  The patterns to apply.
    type pattern_array is array (natural range <>) of pattern_type;
    constant patterns : pattern_array :=
      (('0', '0', '1'),
       ('0', '1', '1'),
       ('1', '0', '1'),
       ('1', '1', '0'));
  begin
    --  Check each pattern.
    for i in patterns'range loop
      --  Set the inputs.
      i0 <= patterns(i).i0;
      i1 <= patterns(i).i1;
      --  Wait for the results.
      wait for 1 ns;
      --  Check the outputs.
      assert o = patterns(i).o
        report "bad sum value" severity error;
    end loop;
    assert false report "end of test" severity note;
    --  Wait forever; this will finish the simulation.
    wait;
  end process;

end behav;
