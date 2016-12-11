library IEEE;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity adder is
	port(A, B: in std_logic_vector(3 downto 0);
		Cin: in std_logic;
		S: out std_logic_vector(3 downto 0);
		Cout: out std_logic);
	
end entity;

architecture adder_struct of adder is
	component full_adder is
		port(
			A, B, Cin: in std_logic;
			S, Cout: out std_logic
			);
	end component;
	
	signal C_1_2, C_2_3, C_3_4: std_logic;
	signal minus_B: std_logic_vector(3 downto 0);
	
begin 
	minus_b <= not B + 1;
	
	add1: full_adder port map(
		A => A(0), B => minus_B(0), Cin => Cin,
		S => S(0), Cout => C_1_2
		);
	
	add2: full_adder port map(
		A => A(1), B => minus_B(1), Cin => C_1_2,
		S => S(1), Cout => C_2_3
		);
	
	add3: full_adder port map(
		A => A(2), B => minus_B(2), Cin => C_2_3,
		S => S(2), Cout => C_3_4
		);
	
	add4: full_adder port map(
		A => A(3), B => minus_B(3), Cin => C_3_4,
		S => S(3), Cout => Cout
		);
	
end architecture;