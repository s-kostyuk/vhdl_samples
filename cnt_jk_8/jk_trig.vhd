library IEEE;
use ieee.std_logic_1164.all;

entity jk_trig is
	port (
		R, S, C, J, K : in std_logic;
		Q, notQ : out std_logic
	);
end entity;

-- JK-триггер с синхронизацией по заднему фронту,
-- инверсными входами асинхронного сброса и установки
architecture jk_trig of jk_trig is
begin
	-- Процесс со списком чувствительности,
	-- в списке обычно указывают все входы схемы
	process (R, S, C, J, K) is
	-- декларативная часть процесса - объявляем переменные
	variable vQ : std_logic;

	-- Тело процесса
	begin
		if R = '0' and S = '0' then
			-- Запрещенное состояние асинхронной части
			vQ := 'X';
		elsif R = '0' then
			-- Асинхронный сброс в '0'
			vQ := '0';
		elsif S = '0' then
			-- Асинхронная установка в '1'
			vQ := '1';
		elsif falling_edge(c) then
			-- Синхронная часть
			if J = '1' and K = '1' then
				-- переключение в противоположное состояние
				vQ := not vQ;
			elsif J = '1' then
				-- установка в 1-цу
				vQ := '1';
			elsif K = '1' then
				-- сброс в ноль
				vQ := '0';
			end if;
		end if;

		-- Последние операторы параллельного назначения
		-- выставляют полученное значение на выход с задержкой
		Q <= vQ after 10 ns;
		notQ <= not vQ after 10 ns;
	end process;
end architecture;
