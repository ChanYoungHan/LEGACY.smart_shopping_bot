function varargout = route_PotentialField(varargin)
% ROUTE_POTENTIALFIELD MATLAB code for route_PotentialField.fig
%      ROUTE_POTENTIALFIELD, by itself, creates a new ROUTE_POTENTIALFIELD or raises the existing
%      singleton*.
%
%      H = ROUTE_POTENTIALFIELD returns the handle to a new ROUTE_POTENTIALFIELD or the handle to
%      the existing singleton*.
%
%      ROUTE_POTENTIALFIELD('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in ROUTE_POTENTIALFIELD.M with the given input arguments.
%
%      ROUTE_POTENTIALFIELD('Property','Value',...) creates a new ROUTE_POTENTIALFIELD or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before route_PotentialField_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to route_PotentialField_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help route_PotentialField

% Last Modified by GUIDE v2.5 22-Nov-2020 01:21:50

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @route_PotentialField_OpeningFcn, ...
                   'gui_OutputFcn',  @route_PotentialField_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before route_PotentialField is made visible.
function route_PotentialField_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to route_PotentialField (see VARARGIN)
global n_w
n_w = 2;

% Choose default command line output for route_PotentialField
handles.output = hObject;
set( handles.text_bluth_state, 'String', '..');
set( handles.text_bluth_state2, 'String', 'Disonnected');
% Update handles structure
guidata(hObject, handles);

% UIWAIT makes route_PotentialField wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = route_PotentialField_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in update.
function update_Callback(hObject, eventdata, handles)
% hObject    handle to update (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
makeMap();


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in display.
function display_Callback(hObject, eventdata, handles)
% hObject    handle to display (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
display_f();

% --- Executes on button press in execution.
function execution_Callback(hObject, eventdata, handles)
% hObject    handle to execution (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
makeMap();
makeRepulsive();
makeRoute();


% --- Executes on button press in update.
function makeRepulsive_Callback(hObject, eventdata, handles)
% hObject    handle to update (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
makeRepulsive();


% --- Executes on button press in update.
function makeRoute_Callback(hObject, eventdata, handles)
% hObject    handle to update (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
makeRoute();



function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double


% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit2_Callback(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit2 as text
%        str2double(get(hObject,'String')) returns contents of edit2 as a double


% --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit3_Callback(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit3 as text
%        str2double(get(hObject,'String')) returns contents of edit3 as a double


% --- Executes during object creation, after setting all properties.
function edit3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit4_Callback(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit4 as text
%        str2double(get(hObject,'String')) returns contents of edit4 as a double


% --- Executes during object creation, after setting all properties.
function edit4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit5_Callback(hObject, eventdata, handles)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit5 as text
%        str2double(get(hObject,'String')) returns contents of edit5 as a double


% --- Executes during object creation, after setting all properties.
function edit5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit6_Callback(hObject, eventdata, handles)
% hObject    handle to edit6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit6 as text
%        str2double(get(hObject,'String')) returns contents of edit6 as a double


% --- Executes during object creation, after setting all properties.
function edit6_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in config2D.
function config2D_Callback(hObject, eventdata, handles)
% hObject    handle to config2D (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global mode
if get(hObject, 'Value') == 1
    mode(1) = 1;
else
    mode(1) = 0;
end

% Hint: get(hObject,'Value') returns toggle state of config2D


% --- Executes on button press in Att3.
function Att3_Callback(hObject, eventdata, handles)
% hObject    handle to Att3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global mode
if get(hObject, 'Value') == 1
    mode(3) = 1;
else
    mode(3) = 0;
end
% Hint: get(hObject,'Value') returns toggle state of Att3


% --- Executes on button press in Anima5.
function Anima5_Callback(hObject, eventdata, handles)
% hObject    handle to Anima5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global mode
if get(hObject, 'Value') == 1
    mode(5) = 1;
else
    mode(5) = 0;
end
% Hint: get(hObject,'Value') returns toggle state of Anima5


% --- Executes on button press in repulsive.
function repulsive_Callback(hObject, eventdata, handles)
% hObject    handle to repulsive (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global mode
if get(hObject, 'Value') == 1
    mode(2) = 1;
else
    mode(2) = 0;
end
% Hint: get(hObject,'Value') returns toggle state of repulsive


% --- Executes on button press in Comb4.
function Comb4_Callback(hObject, eventdata, handles)
% hObject    handle to Comb4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global mode
if get(hObject, 'Value') == 1
    mode(4) = 1;
else
    mode(4) = 0;
end
% Hint: get(hObject,'Value') returns toggle state of Comb4


% --- Executes on button press in quiver6.
function quiver6_Callback(hObject, eventdata, handles)
% hObject    handle to quiver6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global mode
if get(hObject, 'Value') == 1
    mode(6) = 1;
else
    mode(6) = 0;
end
% Hint: get(hObject,'Value') returns toggle state of quiver6



function posRecent_x_Callback(hObject, eventdata, handles)
% hObject    handle to posRecent_x (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% Hints: get(hObject,'String') returns contents of posRecent_x as text
%        str2double(get(hObject,'String')) returns contents of posRecent_x as a double


% --- Executes during object creation, after setting all properties.
function posRecent_x_CreateFcn(hObject, eventdata, handles)
% hObject    handle to posRecent_x (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function posTarget_x_Callback(hObject, eventdata, handles)
% hObject    handle to posTarget_x (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of posTarget_x as text
%        str2double(get(hObject,'String')) returns contents of posTarget_x as a double


% --- Executes during object creation, after setting all properties.
function posTarget_x_CreateFcn(hObject, eventdata, handles)
% hObject    handle to posTarget_x (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in posMidAvail.
function posMidAvail_Callback(hObject, eventdata, handles)
% hObject    handle to posMidAvail (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global n_w
if get(hObject, 'Value') == 1
    n_w = 3;
else
    n_w = 2;
end
% Hint: get(hObject,'Value') returns toggle state of posMidAvail



function PosMid_x_Callback(hObject, eventdata, handles)
% hObject    handle to PosMid_x (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of PosMid_x as text
%        str2double(get(hObject,'String')) returns contents of PosMid_x as a double


% --- Executes during object creation, after setting all properties.
function PosMid_x_CreateFcn(hObject, eventdata, handles)
% hObject    handle to PosMid_x (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in setPos.
function setPos_Callback(hObject, eventdata, handles)
global waypoints n_w
waypoints = nan(n_w,2);
% hObject    handle to setPos (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%start
%ss = get( handles.text_pos_x, 'String' );
ss = get( handles.posXtext, 'String' );
waypoints(1,1) = str2double(ss);
%ss = get( handles.text_pos_y, 'String' );
ss = get( handles.posYtext, 'String' );
waypoints(1,2) = str2double(ss);

% target
ss = get( handles.posTarget_x, 'String' );
waypoints(end,1) = str2double(ss);
ss = get( handles.posTarget_y, 'String' );
waypoints(end,2) = str2double(ss);

% MidWaypoints
if n_w == 3
    ss = get( handles.PosMid_x, 'String' );
    waypoints(2,1) = str2double(ss);
    ss = get( handles.PosMid_y, 'String' );
    waypoints(2,2) = str2double(ss);
end







function posRecent_y_Callback(hObject, eventdata, handles)
% hObject    handle to posRecent_y (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of posRecent_y as text
%        str2double(get(hObject,'String')) returns contents of posRecent_y as a double


% --- Executes during object creation, after setting all properties.
function posRecent_y_CreateFcn(hObject, eventdata, handles)
% hObject    handle to posRecent_y (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function posTarget_y_Callback(hObject, eventdata, handles)
% hObject    handle to posTarget_y (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of posTarget_y as text
%        str2double(get(hObject,'String')) returns contents of posTarget_y as a double


% --- Executes during object creation, after setting all properties.
function posTarget_y_CreateFcn(hObject, eventdata, handles)
% hObject    handle to posTarget_y (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function PosMid_y_Callback(hObject, eventdata, handles)
% hObject    handle to PosMid_y (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of PosMid_y as text
%        str2double(get(hObject,'String')) returns contents of PosMid_y as a double


% --- Executes during object creation, after setting all properties.
function PosMid_y_CreateFcn(hObject, eventdata, handles)
% hObject    handle to PosMid_y (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton9.
function pushbutton9_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in updatePostion.
function updatePostion_Callback(hObject, eventdata, handles)
global routelist
% hObject    handle to updatePostion (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
updatePostion(routelist, handles);

% --- Executes on button press in blueth_connect.
function blueth_connect_Callback(hObject, eventdata, handles)
global ins BLE_NAME
% hObject    handle to blueth_connect (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
BLE_NAME = 'SEP3TEAM';
ins = instrhwinfo('Bluetooth', BLE_NAME);
set( handles.text_bluth_state, 'String', 'OK');


% --- Executes on button press in bleConnet2.
function bleConnet2_Callback(hObject, eventdata, handles)
global ins BLE_NAME ble
% hObject    handle to bleConnet2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure withF handles and user data (see GUIDATA)
bleCh = str2double(ins.Channels{1});
ble = Bluetooth(BLE_NAME, bleCh);
set( handles.text_bluth_state2, 'String', 'Connected');


% ble 통신확인되면 가능하게끔 시도해보자
try
    fopen(ble);
catch 
    warning('Connection Failed');
    return
end
disp('Connected to Robot!');



function updatePostion(routelist, handles)
global t ble x y dis

t = timer('StartDelay', 1, 'Period', 0.5, 'TasksToExecute', 500, 'ExecutionMode', 'fixedRate');
t.StartFcn = @(x,y)disp('Timer Start!');
t.StopFcn = @(x,y)disp('Timer End!');
t.TimerFcn = @my_callback_fcn;
start(t)

%##### route 줄이기
%length(routelist)

scale = 20;
routelist = routelist/scale;
while sqrt((routelist(4,2) - routelist(3,2))^2 + (routelist(4,1) - routelist(3,1))^2) < 0.3
    routelist(1:2:(length(routelist)-2),:) = [];
    disp([length(routelist), sqrt((routelist(4,2) - routelist(3,2))^2 + (routelist(4,1) - routelist(3,1))^2)]);
end



bot = struct('R',0,'X',0,'Y',0,'tR',0,'tX',0,'tY',0);
h = animatedline(0,0,'Color','r','LineWidth',3,'ButtonDownFcn', 'disp(''hi'')');

threshold = 0.3;
index_route = 1;    
flag_send_command = 1;
flag_endpoint = 1;
prev_dis = 0;
axis([-1.2 1.2 -1.2 1.2]);

while flag_endpoint
    % Serial 바이트가 있으면 str에 읽기
    % Rot Xpos Ypos 
    while ble.BytesAvailable>0
        str = fscanf(ble);
        str = strsplit(str);
        %disp(str);
        bot.R = str2double(str(1));
        bot.X = str2double(str(2));
        bot.Y = str2double(str(3));
        set( handles.text_pos_x, 'String', round(bot.X*scale));
        set( handles.text_pos_y, 'String', round(bot.Y*scale));
        addpoints(h, bot.X, bot.Y);
        axis([-10 10 -10 10]);
        grid on;
    end
    
    figHandles = findobj('Type', 'figure');
    set(figHandles, 'WindowButtonDownFcn', @mytestcallback);    
    drawnow;
    
    % checkPostion
    x = routelist(index_route,1); y = routelist(index_route,2);
    dis = sqrt( (x - bot.X)^2 + (y - bot.Y)^2);
    %disp(dis);
    disp([index_route, x, y, bot.X, bot.Y dis])

    % send Command
    if flag_send_command
       strb = sprintf('t%0.3f %0.3f',x, y);
       fprintf(ble, strb);
       %print(x,y);
       flag_send_command = 0;
    end
    
    if (dis < threshold )
       %disp(bot);
       print('next target');
       index_route = index_route + 1;
       flag_send_command = 1;
    end
    
    if (dis > threshold*3 && (prev_dis - dis) < 0)
        flag_send_command = 1;
    end
    prev_dis = dis;
    if (index_route == length(routelist) && dis < threshold)
        flag_endpoint = 0;
        stop(t);
        delete(t);
    end
end
print('update fun. end');


function my_callback_fcn(obj, event)
global ble x y
strb = sprintf('t%0.3f %0.3f',x, y);
fprintf(ble, strb);
%disp('callback activated');




function updatePostion_p(routelist, handles)
global ble 
%##### route 줄이기
%length(routelist)

while length(routelist) > 40
    routelist(1:2:(length(routelist)-2),:) = [];
end

routelist = routelist/10;

bot = struct('R',0,'X',0,'Y',0,'tR',0,'tX',0,'tY',0);
h = animatedline(0,0,'Color','r','LineWidth',3,'ButtonDownFcn', 'disp(''hi'')');

threshold = 1;
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
        %disp(str);
        bot.R = str2double(str(1));
        bot.X = str2double(str(2));
        bot.Y = str2double(str(3));
        set( handles.text_pos_x, 'String', round(bot.X*10));
        set( handles.text_pos_y, 'String', round(bot.Y*10));
        addpoints(h, bot.X, bot.Y);
        axis([0 40 0 40]);
        grid on;
    end
    
    figHandles = findobj('Type', 'figure');
    set(figHandles, 'WindowButtonDownFcn', @mytestcallback);    
    drawnow;
    
    % checkPostion
    x = routelist(index_route,1); y = routelist(index_route,2);
    dis = sqrt( (x - bot.X)^2 + (y - bot.Y)^2);
    %disp(dis);
    disp([index_route, x, y, bot.X, bot.Y dis])

    % send Command

    if (dis < threshold )
       %disp(bot);
       print('next target');
       index_route = index_route + 1;
       flag_send_command = 1;
    end

    if flag_send_command
       strb = sprintf('t%0.3f %0.3f',x, y);
       fprintf(ble, strb);
       %print(x,y);
       flag_send_command = 0;
    end
    
    if (index_route == length(routelist) && dis < threshold)
        flag_endpoint = 0;
    end
end
print('update fun. end');



% --- Executes on button press in grip_close.
function grip_close_Callback(hObject, eventdata, handles)
% hObject    handle to grip_close (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global ble
angle = 130;
disp('grip');
grip = sprintf('g%0.3f',angle);
fprintf(ble, grip);



% --- Executes on button press in gripOpen.
function gripOpen_Callback(hObject, eventdata, handles)
% hObject    handle to gripOpen (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global ble
angle = 50;
grip = sprintf('g%0.3f',angle);
fprintf(ble, grip);
       




function gripPower_Callback(hObject, eventdata, handles)
% hObject    handle to gripPower (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of gripPower as text
%        str2double(get(hObject,'String')) returns contents of gripPower as a double


% --- Executes during object creation, after setting all properties.
function gripPower_CreateFcn(hObject, eventdata, handles)
% hObject    handle to gripPower (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in link2Initial.
function link2Initial_Callback(hObject, eventdata, handles)
% hObject    handle to link2Initial (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global ble
angle = 180;
link1 = sprintf('l%0.3f',angle);
fprintf(ble, link1);
%disp('test');


% --- Executes on button press in link2Full.
function link2Full_Callback(hObject, eventdata, handles)
% hObject    handle to link2Full (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



% --- Executes on button press in link2Initial.
function link1Initial_Callback(hObject, eventdata, handles)
% hObject    handle to link2Initial (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in link2Move.
function link2Move_Callback(hObject, eventdata, handles)
% hObject    handle to link2Move (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global ble
ss = get( handles.link2Angle, 'String' );
link2angle = str2double(ss);
link1 = sprintf('l%0.3f',link2angle);
fprintf(ble, link1);
%disp('test');



function link2Angle_Callback(hObject, eventdata, handles)
% hObject    handle to link2Angle (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of link2Angle as text
%        str2double(get(hObject,'String')) returns contents of link2Angle as a double


% --- Executes during object creation, after setting all properties.
function link2Angle_CreateFcn(hObject, eventdata, handles)
% hObject    handle to link2Angle (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function link1Angle_Callback(hObject, eventdata, handles)
% hObject    handle to link1Angle (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of link1Angle as text
%        str2double(get(hObject,'String')) returns contents of link1Angle as a double


% --- Executes during object creation, after setting all properties.
function link1Angle_CreateFcn(hObject, eventdata, handles)
% hObject    handle to link1Angle (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in link1Move.
function link1Move_Callback(hObject, eventdata, handles)
% hObject    handle to link1Move (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global ble
link1angle = str2double(get( handles.link1Angle, 'String' ));
link1 = sprintf('h%0.3f',link1angle);
fprintf(ble, link1);


% --- Executes on button press in link1Intial.
function link1Intial_Callback(hObject, eventdata, handles)
% hObject    handle to link1Intial (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global ble
%ss = get( handles.link1Angle, 'String' );
link1angle = 0;
link1 = sprintf('h%0.3f',link1angle);
fprintf(ble, link1);


% --- Executes on button press in elevatorInitial.
function elevatorInitial_Callback(hObject, eventdata, handles)
% hObject    handle to elevatorInitial (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global ble
elevatorstep = 0;
elevator_hight = sprintf('d%0.3f',elevatorstep);
fprintf(ble, elevator_hight);


% --- Executes on button press in elevatorMove.
function elevatorMove_Callback(hObject, eventdata, handles)
% hObject    handle to elevatorMove (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global ble
elevatorstep = str2double(get( handles.elevatorStep, 'String'));
elevator_hight = sprintf('d%0.3f',elevatorstep);
fprintf(ble, elevator_hight);


function elevatorStep_Callback(hObject, eventdata, handles)
% hObject    handle to elevatorStep (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of elevatorStep as text
%        str2double(get(hObject,'String')) returns contents of elevatorStep as a double


% --- Executes during object creation, after setting all properties.
function elevatorStep_CreateFcn(hObject, eventdata, handles)
% hObject    handle to elevatorStep (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function posXtext_Callback(hObject, eventdata, handles)
% hObject    handle to posXtext (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of posXtext as text
%        str2double(get(hObject,'String')) returns contents of posXtext as a double


% --- Executes during object creation, after setting all properties.
function posXtext_CreateFcn(hObject, eventdata, handles)
% hObject    handle to posXtext (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function posYtext_Callback(hObject, eventdata, handles)
% hObject    handle to posYtext (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of posYtext as text
%        str2double(get(hObject,'String')) returns contents of posYtext as a double


% --- Executes during object creation, after setting all properties.
function posYtext_CreateFcn(hObject, eventdata, handles)
% hObject    handle to posYtext (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
