%function module
clf; close all;

global nrows ncols waypoints mode routelist

%% Making Map

nrows = 400; ncols = 400;
makeMap();
makeRepulsive();

%% set waypoints
waypoints = [10, 10;
            350, 350];       
makeRoute();

% ['2D Configuration', 'repulsive', 'attractive', 'combined',  'ball down Animation', 'quiver plot']
mode = [0 0 0 0 0 1];
display_f();

