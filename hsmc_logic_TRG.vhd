library ieee;
use ieee.std_logic_1164.all;

entity hsmc_logic_trg is
	port 
	(
		TRG		: in std_logic;
		RST	: in std_logic;
		ena	: out std_logic
	);
end entity;

architecture rtl of hsmc_logic_trg is

signal cnt : integer;

begin
	process (TRG)
	begin
		if (rising_edge(TRG)) then
			if rst = '0' then
				if cnt > 88 then
					ena <= '1';
				else
					ena <= '0';
					cnt <= cnt + 1;
				end if;
			else
				cnt <= 0;
				ena <= '0';
			end if;
		end if;
	end process;
end rtl;
