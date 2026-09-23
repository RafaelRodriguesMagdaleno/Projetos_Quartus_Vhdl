LIBRARY ieee;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY inversor_ordem_while IS

	port(
		entrada: IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		saida : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
	);
END inversor_ordem_while;

ARCHITECTURE arch_inversor_ordem_while OF inversor_ordem_while IS

BEGIN
	process(entrada)
		variable temp : STD_LOGIC_VECTOR(7 DOWNTO 0);
		variable i: INTEGER;
	BEGIN
		i := 7;
		
		WHILE i >= 0 loop
			temp (7-i) := entrada(i);
			i:= i-1;
		end loop;
		saida <= temp;
	end process;
end arch_inversor_ordem_while;