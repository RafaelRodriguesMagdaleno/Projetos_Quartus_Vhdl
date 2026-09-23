LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY somador_4_bits IS
port (
		a, b : in std_logic_vector(3 downto 0);
		cin : in std_logic;
		s : out std_logic_vector(3 downto 0);
		overflow : out std_logic
);
END somador_4_bits;

ARCHITECTURE somador_4_bits_arch OF somador_4_bits IS
component somador_1_bit IS
	PORT(
		cin,a,b : IN STD_LOGIC;
		s, cout : OUT STD_LOGIC
);
END component;

signal t : std_logic_vector(4 downto 0);
BEGIN
	t(0) <= cin;
	overflow <= t(4);

	somadores : for i in 0 to 3 generate
begin

somador: somador_1_bit

	port map (t(i), a(i), b(i), s(i), t(i+1));
end generate;
END somador_4_bits_arch;