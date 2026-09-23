LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY inversor_vector_for IS
	PORT(
		entrada : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		saida : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
	);
END inversor_vector_for;

ARCHITECTURE arch_inversor_vector_for OF inversor_vector_for IS

BEGIN
	process(entrada)
	variable temp: STD_LOGIC_VECTOR(7 DOWNTO 0);
	BEGIN
		--Loop que pula o vetor
		for i in 0 to 7 loop
			temp(i):= not entrada(i);
		end loop;
		saida <= temp;
	end process;
end arch_inversor_vector_for;