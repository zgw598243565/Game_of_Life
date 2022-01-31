----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2020/06/13 13:39:58
-- Design Name: 
-- Module Name: Number_tb - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity Number_tb is
end Number_tb;

architecture Behavioral of Number_tb is
component Number_of_One_Module
Port (NW,N,NE,E,SE,S,SW,W:in std_logic;
        number_alive_cell:out std_logic_vector(3 downto 0) );
end component;
signal NW,N,NE,E,SE,S,SW,W:std_logic:='1';
signal number_alive_cell:std_logic_vector(3 downto 0);
begin
DUT:Number_of_One_Module port map(NW=>NW,N=>N,NE=>NE,E=>E,SE=>SE,S=>S,SW=>SW,W=>W,number_alive_cell=>number_alive_cell);
process
begin
    wait for 20ns;
   NW<='1';
   N<='1';
   NE<='1';
   E<='1';
   SE<='0';
   S<='0';
   SW<='0';
   W<='0';
    wait for 20ns;
   --周围有3个活细胞
    
     NW<='1';
     N<='1';
     NE<='1';
     E<='0';
     SE<='0';
     S<='0';
     SW<='0';
     W<='0';
      wait for 20ns;
       --周围有1个活细胞
   
    NW<='1';
    N<='1';
    NE<='1';
    E<='0';
    SE<='0';
    S<='0';
    SW<='0';
    W<='0';
  wait for 20ns;
  --周围有3个活细胞
   
   NW<='1';
   N<='1';
   NE<='1';
   E<='0';
   SE<='0';
   S<='0';
   SW<='0';
   W<='0';
   wait for 200ns;end process;

end Behavioral;
