function route = GradientBasedPlanner (f, start_coords, end_coords, max_its)
% GradientBasedPlanner : This function plans a path through a 2D
% environment from a start to a destination based on the gradient of the
% function f which is passed in as a 2D array. The two arguments
% start_coords and end_coords denote the coordinates of the start and end
% positions respectively in the array while max_its indicates an upper
% bound on the number of iterations that the system can use before giving
% up.
% The output, route, is an array with 2 columns and n rows where the rows
% correspond to the coordinates of the robot as it moves along the route.
% The first column corresponds to the x coordinate and the second to the y coordinate

[gx, gy] = gradient (-f);

%%% All of your code should be between the two lines of stars.
% *******************************************************************
route = 0;

% 시작점부터 max_its 까지 진행
% 현위치와 도착점의 차이가 2.0 이하일 경우 스탑
% 현위치를 이전위치와 f에 대해 계산

%#### Normalize
% range_gx = max(gx(:)) - min(gx(:));
% gx01 = (gx - min(gx(:))) / range_gx;
% gxout = 2*gx01 - 1;
% range_gy = max(gy(:)) - min(gy(:));
% gy01 = (gy - min(gy(:))) / range_gy;
% gyout = 2*gy01 - 1;

pos_cur_x = start_coords(1);
pos_cur_y = start_coords(2);
route = [pos_cur_x pos_cur_y];
alpha = 1; dt = 1;
for i = 1:(max_its - 1)
    x_g = round(pos_cur_y); y_g = round(pos_cur_x);
    %x_g = pos_cur_y; y_g = pos_cur_x;
    gxout = gx(x_g,y_g)/sqrt(gx(x_g,y_g)^2 + gy(x_g,y_g)^2); 
    gyout = gy(x_g,y_g)/sqrt(gx(x_g,y_g)^2 + gy(x_g,y_g)^2);    
    
    pos_fut_x = alpha*dt*gxout + pos_cur_x;
    pos_fut_y = alpha*dt*gyout + pos_cur_y;                
    
    route = [route; pos_fut_x pos_fut_y];

    if(norm([(end_coords(1) - pos_fut_x) (end_coords(2) - pos_fut_y)]) < 2)
        break;
    end
    
    pos_cur_x = pos_fut_x; pos_cur_y = pos_fut_y;
    
    
%     if(i == 3)
%         keyboard;
%     elseif(i == 100)
%         keyboard;
%     elseif(i == 300)
%         keyboard;
%     elseif(i == 500)
%         keyboard;
%     end
    
end

route = double(route)
% *******************************************************************
end
