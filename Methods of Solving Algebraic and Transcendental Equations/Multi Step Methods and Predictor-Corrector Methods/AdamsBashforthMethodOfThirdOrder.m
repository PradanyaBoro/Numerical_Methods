clear   % Clears variables of workspace keeping functions and classes,
        % clear all includes function and classes too
% clc     % Clears the command window
close all   % Closes all MATLAB figure windows

% Define the function f(x, y) representing the differential equation
f = @(x, y) 1 + (x - y)^2;

% Initial conditions
x(1) = 2;
y(1) = 1;

% Step size
h = 0.01;

% Number of iterations
n = 1 / h;

% Perform the first two iterations using forward Euler method
for i = 1:2
    y(i + 1) = y(i) + h * f(x(i), y(i)); % Forward Euler method
    x(i + 1) = x(i) + h;
end

% Perform the remaining iterations using the 3rd order Adams-Bashforth method
for i = 3:n
    % 3rd order Adams-Bashforth formula
    y(i + 1) = y(i) + (h / 12) * (23 * f(x(i), y(i)) - 16 * f(x(i - 1), y(i - 1)) + 5 * f(x(i - 2), y(i - 2)));
    x(i + 1) = x(i) + h;
end

% Print the final solution
fprintf("y(%f) = %f \n", x(end), y(end))

% Plot the results of the Adams-Bashforth method
plot(x, y, '-ok')
hold on;

% Solve the same differential equation using ODE45 for comparison
xspan = [2 3];
y0 = 1;
[x, y] = ode45(@(x, y) 1 + (x - y)^2, xspan, y0);

% Plot the results of ODE45
plot(x, y, 'r')

% Add legend to the plot
legend({'Adams-Bashforth Method (3rd order)', 'ODE45 Solution'})