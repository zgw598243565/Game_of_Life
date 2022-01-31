----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2020/06/13 13:36:06
-- Design Name: 
-- Module Name: Number_of_One_Module - Behavioral
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
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.numeric_std.ALL;

entity Number_of_One_Module is
Port (NW,N,NE,E,SE,S,SW,W:in std_logic;
        number_alive_cell:out std_logic_vector(3 downto 0) );
end Number_of_One_Module;

architecture Behavioral of Number_of_One_Module is
signal NW_exp:std_logic_vector(3 downto 0):="0000";
signal N_exp:std_logic_vector(3  downto 0):="0000";
signal NE_exp:std_logic_vector(3 downto 0):="0000";
signal E_exp:std_logic_vector(3 downto 0):="0000";
signal SE_exp:std_logic_vector(3 downto 0):="0000";
signal S_exp:std_logic_vector(3 downto 0):="0000";
signal SW_exp:std_logic_vector(3 downto 0):="0000";
signal W_exp:std_logic_vector(3 downto 0):="0000";
begin
  NW_exp<="000"&NW;
  N_exp<="000"&N;
  NE_exp<="000"&NE;
  E_exp<="000"&E;
  SE_exp<="000"&SE;
  S_exp<="000"&S;
  SW_exp<="000"&SW;
  W_exp<="000"&W;
  number_alive_cell<=((NW_exp+N_exp)+(NE_exp+E_exp))+((SE_exp+S_exp)+(SW_exp+W_exp));

end Behavioral;
