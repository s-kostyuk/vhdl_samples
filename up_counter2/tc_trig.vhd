library IEEE;
use ieee.std_logic_1164.all;

entity tc_trig is
	port(T: in std_logic;
		C: in std_logic;
		R: in std_logic;
		Q, notQ: out std_logic);
end entity;

architecture tc_trig of tc_trig is
begin
	process(C, R) is
	variable vQ: std_logic;
	begin
		if R = '0' then
			vQ := '0';
		elsif rising_edge(C) then
			vQ := not vQ;
		end if;
		
		Q <= vQ;
		notQ <= not vQ;
	end process;
end architecture;