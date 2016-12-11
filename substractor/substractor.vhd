library ieee;
use ieee.std_logic_1164.all;

entity substractor is
	port(
		X, Y: in std_logic_vector(3 downto 0);
		Bin: in std_logic;
		D: out std_logic_vector(3 downto 0); 
		Bout: out std_logic
		);
end entity;	

architecture substractor of substractor is
	component full_sub is
		port(
			X, Y: in std_logic;
			Bin: in std_logic;
			Bout: out std_logic;
			D: out std_logic
			);
	end component;
	signal B_1_2, B_2_3, B_3_4: std_logic;
begin
	SUB1: full_sub port map(X => X(3), Y => Y(3), Bin => Bin,   D => D(3), Bout => B_1_2);
	SUB2: full_sub port map(X => X(2), Y => Y(2), Bin => B_1_2, D => D(2), Bout => B_2_3);
	SUB3: full_sub port map(X => X(1), Y => Y(1), Bin => B_2_3, D => D(1), Bout => B_3_4);
	SUB4: full_sub port map(X => X(0), Y => Y(0), Bin => B_3_4, D => D(0), Bout => Bout );
end architecture;
