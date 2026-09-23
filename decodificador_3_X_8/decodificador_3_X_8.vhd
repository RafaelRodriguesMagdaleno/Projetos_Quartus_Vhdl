LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY decodificador_3_X_8 IS
	PORT(
		din: IN std_logic_vector(2 downto 0);
		dout: OUT std_logic_vector(7 downto 0)
	);
END decodificador_3_X_8;

ARCHITECTURE  arch_decodificador_3_X_8 OF decodificador_3_X_8 IS

BEGIN
		process(din)
		BEGIN
			Case din IS
				WHEN "000" => dout <= "00000001";
				WHEN "001" => dout <= "00000010";
				WHEN "010" => dout <= "00000100";
				WHEN "011" => dout <= "00001000";
				WHEN "100" => dout <= "00010000";
				WHEN "101" => dout <= "00100000";
				WHEN "110" => dout <= "01000000";
				WHEN "111" => dout <= "10000000";
				WHEN OTHERS => dout <= "00000000";
		end case;
	end process;
end arch_decodificador_3_X_8;
	