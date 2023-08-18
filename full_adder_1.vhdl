
library ieee;
use ieee.std_logic_1164.all;

entity full_adder_1 is

    port (
    a, b,carry_in : in std_logic;
    sum, carry_out : out std_logic
    );
end full_adder_1;

architecture arch of full_adder_1 is
begin
    sum <= (a xor b) xor carry_in;
    carry_out <= (carry_in and (a xor b)) or (a and b);
end arch;
