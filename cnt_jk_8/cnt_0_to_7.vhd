library IEEE;
use ieee.std_logic_1164.all;

entity cnt_0_to_7 is
	port (
		R, C: in std_logic;
		Q: out std_logic_vector(3 downto 0)
		);
end entity;

-- Суммирующий синхронный счетчик на JK-триггерах
-- с коэффициентом пересчета 8.
-- Модель со смесью стилей: структурного и потока данных
architecture cnt_0_to_7 of cnt_0_to_7 is
	-- декларативная часть архитектуры - 
	-- объявление сигналов и компонентов
	
	-- Внутренние линии, которые соединяют триггера	
	-- и комбинационные схемы
	
	-- выходы триггеров
	signal s_Q: std_logic_vector(3 downto 0);
	signal s_notQ: std_logic_vector(3 downto 0);
	-- входы триггеров, сигнал переключения (переноса)
	signal s_t: std_logic_vector(3 downto 0);
	-- Внутренний сигнал сброса
	signal s_reset: std_logic;
	
	-- Объявление компонента - JK-триггера
	-- (копия entity JK-триггера)
	component jk_trig is
		port(R, S, C, J, K: in std_logic;
			Q, notQ: out std_logic);
	end component;
	
begin
	-- тело архитектуры
	
	-- Формируем сигналы переноса 
	
	-- нулевой триггер переключается с каждым импульсом
	s_t(0) <= '1';
	
	-- Перенос формируем тогда, когда на предудущем разряде была 1-ца
	-- и был перенос из предыдущего разряда
	s_t(1) <= s_q(0) and s_t(0);
	s_t(2) <= s_q(1) and s_t(1);
	s_t(3) <= s_q(2) and s_t(2);
	
	-- Сброс происходит тогда, когда на выходе триггеров получаем Q >= 8
	-- (Q больше либо равно 8-ми, 1000)
	-- ЛИБО когда пришел сброс на вход
	-- reset = not( s_q(3) or not R) = not s_q(3) and R
	s_reset <= s_notQ(3) and R;
	
	-- подключение триггеров
	-- метка: название_компонента port map(внутр_порт => внешн_порт) generic map(переменная => переменная);
	TR1: jk_trig port map(R => s_reset, S => '1', C => C, J => s_t(0), K => s_t(0), Q => s_q(0), notQ => s_notQ(0));
	TR2: jk_trig port map(R => s_reset, S => '1', C => C, J => s_t(1), K => s_t(1), Q => s_q(1), notQ => s_notQ(1)); 
	TR3: jk_trig port map(R => s_reset, S => '1', C => C, J => s_t(2), K => s_t(2), Q => s_q(2), notQ => s_notQ(2)); 
	TR4: jk_trig port map(R => s_reset, S => '1', C => C, J => s_t(3), K => s_t(3), Q => s_q(3), notQ => s_notQ(3)); 
	
	-- Последний оператор: устанавливаем значения на выходе
	Q <= s_q;
end architecture;