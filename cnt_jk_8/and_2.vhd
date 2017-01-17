library ieee;
use ieee.std_logic_1164.all;

entity and_2 is
	port(x1, x2: in std_logic;
	y: out std_logic);
end entity;

architecture and_2 of and_2 is
begin
	y <= x1 and x2;
end architecture;