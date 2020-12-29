function my_callback(obj, event)
global ble x y
strb = sprintf('t%0.3f %0.3f',x, y);
fprintf(ble, strb);
%disp('callback activated');