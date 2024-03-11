clear   % Clears variables of workspace keeping functions and classes,
        % clear all includes function and classes too
% clc     % Clears the command window
close all   % Closes all MATLAB figure windows

% Define the function f(x, y) representing the differential equation
f = @(x, y) (x - 1) * y;

% Initial conditions
x(1) = 0;
y(1) = 1;

% Step size
h = 0.01;

% Number of iterations
n = 2 / h;

% Perform the first iteration using forward Euler method
y(2) = y(1) + h * f(x(1), y(1));
x(2) = x(1) + h;

% Perform the remaining iterations using the 3rd order Milne-Simpson method
for i = 2:n
    x(i + 1) = x(i) + h;
    y0 = y(i) + (h / 2) * (3 * f(x(i), y(i)) - f(x(i - 1), y(i - 1)));
    f_y0 = f(x(i + 1), y0);
    error = 1;
    while error > 10^(-6)
        y1 = y(i - 1) + h * ((1 / 3) * f(x(i + 1), y0) + (4 / 3) * f(x(i), y(i)) + ...
            (1 / 3) * f(x(i - 1), y(i - 1)));
        f_y1 = f(x(i + 1), y1);
        error = abs(f_y1 - f_y0);
        f_y0 = f_y1;
    end
    y(i + 1) = y1;
end

% Print the final solution
fprintf("y(%s) = %f \n", num2str(x(end), '%g'), y(end));

% Plot the results of the Milne-Simpson method
plot(x, y, '-ok')
hold on;

% Solve the same differential equation using ODE45 for comparison
xlim([0 2]);
xspan = [0 2];
y0 = 1;
[x, y] = ode45(@(x, y) (x - 1) * y, xspan, y0);

% Plot the results of ODE45
plot(x, y, 'r')

% Add legend to the plot
legend({'Milne-Simpson Method (3rd order)', 'ODE45 Solution'}, 'Location', 'north')