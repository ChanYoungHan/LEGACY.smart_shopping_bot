t = timer('StartDelay', 4, 'Period', 1, 'TasksToExecute', 40, ...
          'ExecutionMode', 'fixedRate');
t.StartFcn = {@my_callback_fcn, 'My start message'};  
t.StopFcn = { @my_callback_fcn, 'My stop message'};
t.TimerFcn = @(x,y)disp('Hello World!');
start(t)

%stop(t)