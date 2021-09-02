library ieee;
use ieee.std_logic_1164.all;

entity hsmc_logic is
	port 
	(
		clk		: in std_logic;
		RST	: in std_logic;
		ena	: out std_logic
	);
end entity;

architecture rtl of hsmc_logic is

signal cnt : integer;

begin
	process (clk)
	begin
		if (rising_edge(clk)) then
			if rst = '0' then
				if cnt > 1408 then
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
