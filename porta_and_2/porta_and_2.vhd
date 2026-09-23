LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY porta_and_2 IS
	PORT( 
		E1,E2: IN STD_LOGIC;
		S: OUT sTD_LOGIC
	);
END porta_and_2;

ARCHITECTURE arch_porta_and_2 OF porta_and_2 IS

BEGIN
	S <= E1 and E2;
END arch_porta_and_2;
	