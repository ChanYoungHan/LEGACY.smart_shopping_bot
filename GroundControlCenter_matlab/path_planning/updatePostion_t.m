function updatePostion_t(routelist)
global ble 
%length(routelist)
for i = 1:fix((length(routelist)-1)/2)
    routelist(2,:) = [];
end
%length(routelist)

bot = struct('R',0,'X',0,'Y',0,'tR',0,'tX',0,'tY',0);
h = animatedline(0,0,'Color','r','LineWidth',3,'ButtonDownFcn', 'disp(''hi'')');
threshold = 0.5;
index_route = 1;
flag_send_command = 1;
flag_endpoint = 1;
axis([-1.2 1.2 -1.2 1.2]);

while flag_endpoint
    % Serial 바이트가 있으면 str에 읽기
    % Rot Xpos Ypos
    
    while ble.BytesAvailable>0
        str = fscanf(ble);
        str = strsplit(str);
        disp(str);
        bot.R = str2double(str(1));
        bot.X = str2double(str(2));
        bot.Y = str2double(str(3));
        addpoints(h, bot.X, bot.Y);
        axis([-5 5 -5 5]);
        grid on;
    end
    
    figHandles = findobj('Type', 'figure');
    set(figHandles, 'WindowButtonDownFcn', @mytestcallback);    
    drawnow;
    
    % checkPostion
    x = routelist(index_route,1); y = routelist(index_route,2);
    dis = sqrt( (x - bot.X)^2 + (y - bot.Y)^2);
    disp(dis);
    if (dis < threshold )
       print('next target');
       index_route = index_route + 1;
       %flag_waypoint = 0;
       
    end
    % send Command
    if flag_send_command
       strb = sprintf('t%0.3f %0.3f',x, y);
       fprintf(ble, strb);
       flag_send_command = 0
    end
    
    
    if index_route == length(routelist)
        flag_endpoint = 0;
    end
end







