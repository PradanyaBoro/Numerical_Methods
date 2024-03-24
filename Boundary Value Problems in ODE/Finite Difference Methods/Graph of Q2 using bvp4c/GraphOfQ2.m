% Number of points for discretization
N = 1000; % Increase for higher accuracy

% Define the boundary conditions
bc_left = [1; 1];
bc_right = [0; 0];

% Solve the boundary value problem using bvp4c
solinit = bvpinit(linspace(0, 1, N), @guess);
sol = bvp4c(@bvpfcn, @bvp_bc, solinit);

% Plot the solution
x = linspace(0, 1, N);
y = deval(sol, x);
plot(x, y(1,:), '--b');
xlabel('x');
ylabel('y');
title('Numerical Solution of y'''' = xy + 1');