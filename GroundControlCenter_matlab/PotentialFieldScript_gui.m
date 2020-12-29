%function module
clf; close all;

global nrows ncols mode routelist ins t ble
    
%% Making Map
nrows = 400; ncols = 400;
%% set waypoints
    
% ['2D Configuration', 'repulsive', 'attractive', 'combined',  'ball down Animation', 'quiver plot']
%display_f();
mode = [0 0 0 0 0 0];
route_PotentialField;


