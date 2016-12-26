library IEEE;
use ieee.std_logic_1164.all;

entity cnt is
	port(
		rst: in std_logic;
		T: in std_logic;
		Q: out std_logic_vector(3 downto 0)
		);
end entity;

architecture cnt of cnt is
	component tc_trig is
		port(T: in std_logic;
			C: in std_logic;
			R: in std_logic;
			Q, notQ: out std_logic);
	end component;
	
	signal sQ: std_logic_vector(3 downto 0);
	signal not_sQ: std_logic_vector(3 downto 0);
begin
	tr0: tc_trig port map(C => T,         T => '1', Q => sQ(0), notQ => not_sQ(0), R => rst);
	tr1: tc_trig port map(C => not_sQ(0), T => '1', Q => sQ(1), notQ => not_sQ(1), R => rst);
	tr2: tc_trig port map(C => not_sQ(1), T => '1', Q => sQ(2), notQ => not_sQ(2), R => rst);
	tr3: tc_trig port map(C => not_sQ(2), T => '1', Q => sQ(3), notQ => not_sQ(3), R => rst);
	
	Q <= sQ;
end architecture;