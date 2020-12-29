%function routelist = makeRoute(waypoint, nrows, ncols, map_node, repulsive)
function  makeRoute()

global repulsive nrows ncols attractive f1 routelist x y waypoints 

%% WayPoint Gen & make Route
[x, y] = meshgrid (1:ncols, 1:nrows);
routelist = [];
f1 = [];
for eachWaypoint = 1:(length(waypoints) - 1)
    % Compute attractive force
    goal = waypoints(eachWaypoint+1, :);
    attractive = makeAttractive(goal, x, y);
    % Combine terms
    f = attractive + repulsive;
    f1 = cat(3, f1, f);
    %% Plan route
    start = waypoints(eachWaypoint, :);
    eachRoute = GradientBasedPlanner (f, start, goal, 1000);
    %각 route 사이에 nan을 추가하여 구분토록 함.
    %추가고려 : route를 포함하는 행렬을 여러개 만들어 부를 수 있을까
    routelist = [routelist; eachRoute; nan,nan];
end