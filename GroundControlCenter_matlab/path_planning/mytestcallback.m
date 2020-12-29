function mytestcallback(~,~)
global ble;
button = 0;
[x,y,button] = ginput(1);
if button~=0
    tgt = [x, y];
    strb = sprintf('t%0.3f %0.3f',x, y);
    fprintf(ble, strb);
    disp(strb);
end
end