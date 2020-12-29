function makeRepulsive()

global repulsive map_node
%% Compute distance transform
d = bwdist(map_node);
% Rescale and transform distances
d2 = (d/100) + 1;
%d0 = 2;
d0 = 10/8;
%potential
nu = 800/2;

repulsive = nu*((1./d2 - 1/d0).^2);
repulsive (d2 > d0) = 0;