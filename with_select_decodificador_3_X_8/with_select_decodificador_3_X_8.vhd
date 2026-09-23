LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY with_select_decodificador_3_X_8 IS
	PORT(
		din: IN STD_LOGIC_VECTOR(2 DOWNTO 0);
		dout: OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
	);
END with_select_decodificador_3_X_8;

ARCHITECTURE arch_with_select_decodificador_3_X_8 OF with_select_decodificador_3_X_8 IS

BEGIN

WITH din SELECT

dout <= "00000001" WHEN "000",
		  "00000010" WHEN "001",
		  "00000100" WHEN "010",
		  "00001000" WHEN "011",
		  "00010000" WHEN "100",
		  "00100000" WHEN "101",
		  "01000000" WHEN "110",
		  "10000000" WHEN "111",
		  "00000000" WHEN OTHERS;
END arch_with_select_decodificador_3_X_8;