clear   % Clears variables of workspace keeping functions and classes,
        % clear all includes function and classes too
% clc     % Clears the command window
close all   % Closes all MATLAB figure windows

% Define the function f(x, y) representing the differential equation
f = @(x, y) 1/exp(x) - y;

% Initial conditions
x(1) = 0;
y(1) = 0;

% Step size
h = 0.01;

% Number of iterations
n = 8 / h;

% Perform the first iteration using forward Euler method
y(2) = y(1) + h * f(x(1), y(1));
x(2) = x(1) + h;

% Perform the remaining iterations using the 3rd order Adams-Moulton method
for i = 2:n
    x(i + 1) = x(i) + h;
    y0 = y(i) + 0.5 * h * (f(x(i), y(i)) + f(x(i) + h, y(i) + h * f(x(i), y(i))));
    f_y0 = f(x(i + 1), y0);
    error = 1;
    while error > 10^(-4)
        y1 = y(i) + (h / 12) * (5 * f(x(i + 1), y0) + 8 * f(x(i), y(i)) - f(x(i - 1), ...
            y(i - 1)));
        f_y1 = f(x(i + 1), y1);
        error = abs(f_y1 - f_y0);
        f_y0 = f_y1;
    end
    y(i + 1) = y1;
end

% Print the final solution
fprintf("y(%f) = %f \n", x(end), y(end))

% Plot the results of the Adams-Moulton method
plot(x, y, '-ok')
hold on;

% Solve the same differential equation using ODE45 for comparison
xspan = [0 8];
y0 = 0;
[x, y] = ode45(@(x, y) 1/exp(x) - y, xspan, y0);

% Plot the results of ODE45
plot(x, y, 'r')

% Add legend to the plot
legend({'Adams-Moulton Method (3rd order)', 'ODE45 Solution'})