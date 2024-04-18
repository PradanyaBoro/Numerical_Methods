% Number of points for discretization
N = 1000; % Increase for higher accuracy

% Solve the boundary value problem using bvp4c
solinit = bvpinit(linspace(0, 1, N), @guess);
sol = bvp4c(@bvpfcn, @bvpbc, solinit);

% Plot the solution
plot(sol.x, sol.y(1,:), '--b');
xlabel('x-axis');
ylabel('y-axis');
title('Numerical Solution of y'''' = xy + 1');
