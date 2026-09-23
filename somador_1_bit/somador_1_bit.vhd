LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

ENTITY somador_1_bit IS
	PORT(
		cin,a,b: IN STD_LOGIC;
		s,cout : OUT STD_LOGIC
	);
END somador_1_bit;

ARCHITECTURE somador_1_bit_arch OF somador_1_bit IS

BEGIN
		s <= a xor b xor cin;
		cout <= (a and b) or (cin and a) or (cin and b);
END somador_1_bit_arch;