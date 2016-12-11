library IEEE;
use ieee.std_logic_1164.all;

entity full_sub is
	port(
		X, Y: in std_logic;
		Bin: in std_logic;
		Bout: out std_logic;
		D: out std_logic
		);
end entity;

architecture full_sub of full_sub is
begin
	D <= X xor Y xor Bin;
	Bout <= (Y and Bin)	or (not X and Bin) or (not X and Y);
end architecture;