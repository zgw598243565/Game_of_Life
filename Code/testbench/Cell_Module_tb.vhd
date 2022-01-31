----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2020/06/13 10:25:30
-- Design Name: 
-- Module Name: Cell_Module_tb - Behavioral
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


entity Cell_Module_tb is
end Cell_Module_tb;

architecture Behavioral of Cell_Module_tb is
component Cell_Module
Port (clk,strstn,ce,load,NW,N,NE,E,SE,S,SW,W,load_initial,initial:in std_logic;
        state:out std_logic );
end component;

signal clk:std_logic:='0';
signal strstn:std_logic:='1';
signal ce:std_logic:='1';
signal load:std_logic:='0';
signal NW,N,NE,E,SE,S,SW,W:std_logic:='1';

signal load_initial:std_logic:='0';
signal initial:std_logic:='1';
signal state:std_logic;

constant CLK_period:TIME:=10ns;
begin
tb_process:process
begin
    --同步复位
    ce<='1';
    strstn<='1';
    wait for 40ns;
    strstn<='0';
    wait for 40ns;
    strstn<='1';
    
    --加载W状态进入Cell
    wait for 40ns;
    load<='1';
    wait for 20ns;
    load<='0';
    
    --周围有4个活细胞
    --wait for 20ns;
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
     N<='0';
     NE<='0';
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
    wait for 200ns;
    --周围有1个活细胞
  --  wait for 20ns;
 --   NW<='1';
  --  N<='0';
 --   NE<='0';
 --   E<='0';
 --   SE<='0';
 --  S<='0';
 --   SW<='0';
 --   W<='0';
      
      --周围有3个活细胞
  --   wait for 20ns;
  --    NW<='1';
  --    N<='1';
  --    NE<='1';
  --    E<='0';
  --    SE<='0';
 --     S<='0';
 --     SW<='0';
  --    W<='0';
   
end process;



clk_process:process
begin
    clk<='0';
    wait for CLK_period/2;
    clk<='1';
    wait for CLK_period/2;
end process;

DUT:Cell_Module port map(clk=>clk,strstn=>strstn,ce=>ce,load=>load,NW=>NW,N=>N,NE=>NE,E=>E,SE=>SE,S=>S,SW=>SW,W=>W,
                            load_initial=>load_initial,initial=>initial,state=>state);
end Behavioral;
