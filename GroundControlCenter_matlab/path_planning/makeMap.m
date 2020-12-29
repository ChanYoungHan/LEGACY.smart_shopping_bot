function  makeMap()

global map_node nrows ncols 
% 1 node -> 1cm^2
obstacle = false(nrows, ncols);
%% Generate some obstacle
tick = 0;
%%StartWall
%obstacle (180-tick:190+tick, 1:150+tick) = true;
%obstacle (1:80+tick, 140-tick:150+tick) = true;
%filed
obstacle (200-tick:400, 1:400) = true;
obstacle (1:200, 260-tick:400) = true;  


%%VrticalTable
%obstacle (215-tick:215+135+tick, 227-tick:227+32+tick) = true;
%CommonTable
%obstacle (83-tick:83+32+tick, 260-tick:260+90+tick) = true;
%table_À¶ÇÕ
%obstacle (40-tick:40+36+tick, 1-tick:1+36+tick) = true;
%obstacle (40-tick:40+36+tick, 37+30-tick:37+30+36+tick) = true;

%obstacle (76+30-tick:76+30+36+tick, 1-tick:1+36+tick) = true;
%obstacle (76+30-tick:76+30+36+tick, 37+30-tick:37+30+36+tick) = true;

%³ÐÀº °÷
obstacle (118:200, 36-tick:36+12) = true;  
obstacle (1:60+tick, 86-tick:200+tick) = true;
obstacle (100:100+12+tick, 100-tick:240+tick) = true;

map_node = obstacle;
