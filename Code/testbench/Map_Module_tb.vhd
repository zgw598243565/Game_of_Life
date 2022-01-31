----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2020/06/19 18:55:56
-- Design Name: 
-- Module Name: Map_Module_tb - Behavioral
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

entity Map_Module_tb is
end Map_Module_tb;

architecture Behavioral of Map_Module_tb is
component Map_Module
generic(R:integer:=5;C:integer:=5);
Port (clk,strstn,ce,load_initial:in std_logic;
       state_out:out std_logic_vector(R-1 downto 0);
       initial_in:in std_logic_vector(R-1 downto 0)
         );
end component;
signal clk:std_logic:='0';
signal strstn:std_logic:='1';
signal ce:std_logic:='1';

signal load_initial:std_logic:='0';
signal initial_in:std_logic_vector(4 downto 0):="11111";
signal state_out:std_logic_vector(4 downto 0);
constant CLK_period:TIME:=20ns;
begin
process
begin
    --同步复位初始化
    wait for 40ns;
    strstn<='1';
    wait for 40ns;
    strstn<='0'; 
    wait for 40ns;
    strstn<='1';
   
   --最右侧加载
   load_initial<='1';
   wait for 40ns;
   load_initial<='0';
   
    wait for 4000ns;
end process;

clk_process:process
begin
    clk<='0';
    wait for CLK_period/2;
    clk<='1';
    wait for CLK_period/2;
end process;

DUT:Map_Module port map(clk=>clk,strstn=>strstn,ce=>ce,load_initial=>load_initial,
       state_out=>state_out,initial_in=>initial_in);

end Behavioral;











