library IEEE;
use IEEE.Std_Logic_1164.all;

entity HEX61 is
    port(
        SETUP: in std_logic_vector(3 downto 0);
        E5: in std_logic;
        E6: in std_logic;
        end_round_aux: in std_logic;
        s: out std_logic_vector(6 downto 0)
    );
end HEX61;

architecture teste of HEX61 is
    signal S1,S2,V1,V2,V3,V4: std_logic_vector(6 downto 0);

    component multiplexador2x1 is
        port (a: in std_logic_vector (6 downto 0);
              b: in std_logic_vector (6 downto 0);
              c: in std_logic;
              d: out std_logic_vector(6 downto 0));
    end component;

    component disp7seg is
        port (a: in std_logic_vector(3 downto 0);
              b: out std_logic_vector(6 downto 0)
              );
    end component;

begin

    V2 <= "0100011";
    V3 <= "0001100";
    V4 <= "0010010";

    D7S1: disp7seg port map(a => setup,
                            b => V1);

    MUX1: multiplexador2x1 port map(a => V1,
                                    b => V2,
                                    c => E5,
                                    d => S1);
    MUX2: multiplexador2x1 port map(a => V3,
                                    b => V4,
                                    c => end_round_aux,
                                    d => S2);
    MUX3: multiplexador2x1 port map(a => S1,
                                    b => S2,
                                    c => E6,
                                    d => s);
end teste;