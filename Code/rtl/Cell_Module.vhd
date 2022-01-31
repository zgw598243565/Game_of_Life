----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2020/06/13 09:32:20
-- Design Name: 
-- Module Name: Cell_Module - Behavioral
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
--Cell_Module functions;
--input:
--clk;global clk
--strstn:synchronous active low reset
--ce:clock enable
--load:take W as next state
--NW:north-west
--N:north
--NE:north-east
--E:east
--SE:south-east
--S:south
--SW:south-west
--W:west
--shift_enable:shift enable signal active high
--load_initial:take initial as next state
--initial:initial state
--output:
--state:current state of cell
--state_shift:state of W cell

entity Cell_Module is
Port (clk,strstn,ce,load,NW,N,NE,E,SE,S,SW,W,load_initial,initial:in std_logic;
        state:out std_logic );
end Cell_Module;

architecture Behavioral of Cell_Module is
component Number_of_One_Module
Port (NW,N,NE,E,SE,S,SW,W:in std_logic;
        number_alive_cell:out std_logic_vector(3 downto 0) );
end component;
signal state_reg:std_logic;
signal state_next:std_logic:='0';
signal number_alive_cell:std_logic_vector(3 downto 0):="0000";


begin
Number:Number_of_One_Module port map(NW=>NW,N=>N,NE=>NE,E=>E,SE=>SE,S=>S,SW=>SW,W=>W,number_alive_cell=>number_alive_cell);

state_process:process(clk,strstn)
begin
if ce='1' then
    if clk'event and clk='1' then
        if strstn='0' then
            state_reg<='0';
        elsif load='1' then
            state_reg<=W;
        elsif load_initial='1' then
            state_reg<=initial;
        else
            state_reg<=state_next;
        end if;
    end if;
end if;
end process;

state_change_process:process(load,number_alive_cell)
begin
  
    if state_reg='0' then
        if number_alive_cell=X"3" then
            state_next<='1';
        else
            state_next<='0';
        end if;
    elsif state_reg='1' then
        if number_alive_cell<=X"1" then
            state_next<='0';
        elsif number_alive_cell<=X"3" then
            state_next<='1';
        else
            state_next<='0';
        end if;
    else
        state_next<=state_reg;
    end if;
end process;
state<=state_reg;
end Behavioral;
