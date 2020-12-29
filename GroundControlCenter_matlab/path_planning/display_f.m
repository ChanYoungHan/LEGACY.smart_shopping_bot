function display_f()
global repulsive map_node nrows ncols attractive routelist x y waypoints f1 mode

    %% Display 2D configuration space
if mode(1) == 1
    figure;
    imshow(~map_node);

    hold on;
    %plot (goal(1), goal(2), 'r.', 'MarkerSize', 25);
    hold off;

    axis ([0 ncols 0 nrows]);
    axis xy;
    axis on;

    xlabel ('x');
    ylabel ('y');

    title ('Configuration Space');
end

%% Display repulsive potential
if mode(2) == 1
    figure;
    m = mesh (repulsive);
    m.FaceLighting = 'phong';
    axis equal;

    title ('Repulsive Potential');
end

%% Display Attractive
if mode(3) == 1
    figure;
    m = mesh (attractive);
    m.FaceLighting = 'phong';
    axis equal;

    title ('Attractive Potential');
end
    
    %% Plot the energy surface

log_nan_routelist = isnan(routelist);
ind_nan_routelist = find(log_nan_routelist(:,1));
ind_nan_routelist = [0; ind_nan_routelist];
        
for eachroute = 1: (length(waypoints)-1)
    k = [ind_nan_routelist(eachroute), ind_nan_routelist(eachroute+1)]; 
    route = routelist(k(1)+1:k(2)-1,:);
    f = f1(:,:,eachroute);
        %% combine
    if mode(4) == 1    
        figure;
        m = mesh (f);
        m.FaceLighting = 'phong';
        axis equal;

        title ('Total Potential');
    end
    
    if mode(5) == 1
        figure;
        m = mesh (f);
        
        axis equal;
        %% Plot ball sliding down hill

        [sx, sy, sz] = sphere(20);

        scale = 20;
        sx = scale*sx;
        sy = scale*sy;
        sz = scale*(sz+1);

        hold on;
        p = mesh(sx, sy, sz);
        p.FaceColor = 'red';
        p.EdgeColor = 'none';
        p.FaceLighting = 'phong';
        hold off;
        
        for i = 1:size(route,1)
            P = round(route(i,:));
            z = f(P(2), P(1));

            p.XData = sx + P(1);
            p.YData = sy + P(2);
            p.ZData = sz + f(P(2), P(1));

            drawnow;

            drawnow;
        end
    end
    %% quiver plot
    if mode(6) == 1
        [gx, gy] = gradient (-f);
        skip = 20;

        figure;

        xidx = 1:skip:ncols;
        yidx = 1:skip:nrows;

        quiver (x(yidx,xidx), y(yidx,xidx), gx(yidx,xidx), gy(yidx,xidx), 0.4);

        axis ([1 ncols 1 nrows]);

        hold on;

        ps = plot(waypoints(eachroute, 1), waypoints(eachroute, 2), 'r.', 'MarkerSize', 30);
        pg = plot(waypoints(eachroute+1, 1),waypoints(eachroute+1, 2), 'g.', 'MarkerSize', 30);
        p3 = plot (route(:,1), route(:,2), 'r', 'LineWidth', 2);
    end
end