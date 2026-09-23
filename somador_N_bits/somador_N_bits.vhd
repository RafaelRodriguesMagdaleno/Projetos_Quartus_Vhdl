LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY somador_N_bits IS
generic ( N : integer := 16 );
port (
	a, b : in std_logic_vector(N-1 downto 0);
	cin : in std_logic;
	s : out std_logic_vector(N-1 downto 0);
	overflow : out std_logic
);
END somador_N_bits;

ARCHITECTURE somador_N_bits_arch OF somador_N_bits IS
component somador_1_bit IS
PORT(
	cin, a, b : IN STD_LOGIC;
	s, cout : OUT STD_LOGIC
);
END component;

signal t : std_logic_vector(N downto 0);
BEGIN
	t(0) <= cin;
gen_adders : for i in 0 to N-1 generate

begin
somador : somador_1_bit
	port map (t(i), a(i), b(i), s(i), t(i+1));
end generate;
overflow <= t(N);
END somador_N_bits_arch;