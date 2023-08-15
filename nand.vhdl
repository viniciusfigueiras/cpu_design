library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity nand_gate is
  -- `i0`, `i1` are inputs of the nand_gate.
  -- `o` is the output of the nand_gate.
  port (i0, i1 : in std_logic; o : out std_logic);
end nand_gate;

architecture rtl of nand_gate is
begin
  o <= i0 nand i1;
end rtl;                
