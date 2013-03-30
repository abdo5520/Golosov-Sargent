% Specify the function as a MATLAB anonymous function - this facilitates
% changing the function for other examples.
myfun = @(x)25*x*x - 10*x + 1;

% Specify the initial estimate of the zero, and the value of the function
% there (the latter is only needed for plotting).
xstart = 1.0;
fstart = myfun(xstart);
xx = xstart;
fx = fstart;

% Specify other parameters for the NAG routine.  tol is the tolerance,
% used by the routine to control the accuracy of the solution.
tol = 0.00001;
ir = int64(0);
c = zeros(26, 1);
ind = int64(1);

% Iterate until the solution is reached.
while (ind ~= int32(0))

% Call the NAG routine to get an improved estimate of the zero,
% then plot it.
  [xx, c, ind, ifail] = c05ax(xx, fx, tol, ir, c, ind);
  fx = myfun(xx);

  plot(axes, xx, fx, 'or', 'MarkerFaceColor', [1,0,0], 'MarkerSize', 8);

end

% Plot initial estimate, and final solution.
plot(axes, xstart, fstart, 'og', 'MarkerFaceColor', [0,1,0], 'MarkerSize', 8);
plot(axes, xx, fx, 'oy', 'MarkerFaceColor', [1,1,0], 'MarkerSize', 8);

