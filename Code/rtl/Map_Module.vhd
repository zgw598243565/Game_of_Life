----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2020/06/13 14:12:48
-- Design Name: 
-- Module Name: Map_Module - Behavioral
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

--Map_Module functions
--clk:global clk
--strstn:synchronous active low reset
--ce:clock enable
--shift_enable:shift enable signal active high

entity Map_Module is
generic(R:integer:=5;C:integer:=5);
Port (clk,strstn,ce,load_initial:in std_logic;
       state_out:out std_logic_vector(R-1 downto 0);
       initial_in:in std_logic_vector(R-1 downto 0)
         );
end Map_Module;

architecture Behavioral of Map_Module is
component Cell_Module
Port (clk,strstn,ce,load,NW,N,NE,E,SE,S,SW,W,load_initial,initial:in std_logic;
        state:out std_logic );
end component;
signal NW,N,NE,E,SE,S,SW,W,state:std_logic_vector(R*C-1 downto 0);
signal load:std_logic;
begin
   
     lab1:for i in 0 to R-1 generate
     begin
         lab2:for ii in 0 to C-1 generate
         lab3:if(ii=0) generate          
                 MAP_U:Cell_Module port map(clk=>clk,strstn=>strstn,ce=>ce,load=>load,NW=>NW(i*C+ii),N=>N(i*C+ii),NE=>NE(i*C+ii),E=>E(i*C+ii),SE=>SE(i*C+ii),S=>S(i*C+ii),SW=>SW(i*C+ii),W=>W(i*C+ii),load_initial=>load_initial,initial=>initial_in(i),state=>state(i*C+ii));
             end generate;
         lab4:if(ii=C-1) generate
                 MAP_U:Cell_Module port map(clk=>clk,strstn=>strstn,ce=>ce,load=>load,NW=>NW(i*C+ii),N=>N(i*C+ii),NE=>NE(i*C+ii),E=>E(i*C+ii),SE=>SE(i*C+ii),S=>S(i*C+ii),SW=>SW(i*C+ii),W=>W(i*C+ii),load_initial=>'0',initial=>'0',state=>state(i*C+ii));
             end generate;          
         lab5:if((ii/=0) and (ii/=C-1)) generate
                 MAP_U:Cell_Module port map(clk=>clk,strstn=>strstn,ce=>ce,load=>load,NW=>NW(i*C+ii),N=>N(i*C+ii),NE=>NE(i*C+ii),E=>E(i*C+ii),SE=>SE(i*C+ii),S=>S(i*C+ii),SW=>SW(i*C+ii),W=>W(i*C+ii),load_initial=>'0',initial=>'0',state=>state(i*C+ii));
              end generate;
         end generate;
     end generate;
     
    --W->E
    WE1:for i in 0 to R-1 generate
    begin
        WE2:for j in 0 to C-1 generate
            WE3:if(j=0)generate
                    W(i*C+j)<=state(i*C+C-1);
                    E(i*C+C-1)<=state(i*C+j);
                end generate;
            WE4:if(j/=0)generate
                    W(i*C+j)<=state(i*C+j-1);
                    E(i*C+j-1)<=state(i*C+j);
                end generate;
        end generate;
    end generate;
    
    --N->S
    NS1:for i in 0 to R-1 generate
    begin
        NS2:for j in 0 to C-1 generate
            NS3:if(i=0)generate
                    N(i*C+j)<=state((R-1)*C+j);
                    S((R-1)*C+j)<=state(i*C+j);
                end generate;
            NS4:if(i/=0)generate
                    N(i*C+j)<=state((i-1)*C+j);
                    S((i-1)*C+j)<=state(i*C+j);
                end generate;
        end generate;
    end generate;
    
    --NW->SE
    NW_SE1:for i in 0 to R-1 generate
    begin
        NW_SE2:for j in 0 to C-1 generate
            NW_SE3:if(i=0) generate
                NW_SE4:if(j=0) generate
                            NW(i*C+j)<=state((R-1)*C+C-1);
                            SE((R-1)*C+C-1)<=state(i*C+j);                   
                       end generate;
                NW_SE5:if(j/=0) generate
                            NW(i*C+j)<=state((R-1)*C+j-1);
                            SE((R-1)*C+j-1)<=state(i*C+j);
                       end generate;
                   end generate;
           NW_SE6:if(i/=0) generate
                NW_SE7:if(j=0) generate
                            NW(i*C+j)<=state((i-1)*C+C-1);
                            SE((i-1)*C+C-1)<=state(i*C+j);
                        end generate;
                NW_SE8:if(j/=0) generate
                            NW(i*C+j)<=state((i-1)*C+j-1);
                            SE((i-1)*C+j-1)<=state(i*C+j);
                        end generate;    
                  end generate;
               end generate;
    end generate;
--SW->NE
 SW_NE1:for i in 0 to R-1 generate
   begin
       SW_NE2:for j in 0 to C-1 generate
           SW_NE3:if(i/=R-1) generate
               SW_NE4:if(j=0) generate
                           SW(i*C+j)<=state((i+1)*C+C-1);
                           NE((i+1)*C+C-1)<=state(i*C+j);                   
                      end generate;
               SW_NE5:if(j/=0) generate
                           SW(i*C+j)<=state((i+1)*C+j-1);
                           NE((i+1)*C+j-1)<=state(i*C+j);
                      end generate;
                  end generate;
          SW_NE6:if(i=R-1) generate
               SW_NE7:if(j=0) generate
                           SW(i*C+j)<=state(C-1);
                           NE(C-1)<=state(i*C+j);
                       end generate;
               SW_NE8:if(j/=0) generate
                           SW(i*C+j)<=state(j-1);
                           NE(j-1)<=state(i*C+j);
                       end generate;    
                 end generate;
              end generate;
   end generate;
  --W->stateout
  W_OUT1:for i in 0 to R-1 generate
    begin
        W_OUT2:for j in 0 to C-1 generate
            W_OUT3:if(j=C-1) generate
                     state_out(i)<=state(i*C+j);  
                    end generate;
        end generate;
  end generate;  
end Behavioral;
