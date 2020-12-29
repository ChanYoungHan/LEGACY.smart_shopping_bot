clc;
%clear all;
global ble;
global tgt;

%% 무한루프 진입
bot = struct('R',0,'X',0,'Y',0,'tR',0,'tX',0,'tY',0);

h = animatedline(0,0,'Color','r','LineWidth',3,'ButtonDownFcn', 'disp(''hi'')');
axis([-1.2 1.2 -1.2 1.2]);

while true
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
        axis([-1.2 1.2 -1.2 1.2]);
        grid on;
    end
    
    figHandles = findobj('Type', 'figure');
    set(figHandles, 'WindowButtonDownFcn', @mytestcallback);
    
    drawnow;
end