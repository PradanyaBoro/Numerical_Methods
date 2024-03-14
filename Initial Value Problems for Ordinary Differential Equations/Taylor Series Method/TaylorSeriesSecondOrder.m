clear
close all

% Define the ordinary differential equation y' = f(x, y) and its derivative with respect to y
f = @(x, y) cos(y) - 1;
d_f = @(x, y) -sin(y) * (cos(y) - 1);

% Initial conditions
x(1) = 0;
y(1) = 1;
h = 0.01; % Step size
n = 10 / h + 1; % Number of steps

% Main loop for the second-order Taylor series method
for i = 1:(n - 1)
    % Calculate x and y using the second-order Taylor series method
    x(i + 1) = x(i) + h;
    y(i + 1) = y(i) + h * f(x(i), y(i)) + (h^2 / 2) * d_f(x(i), y(i));
end

% Print the final result
fprintf("y(%f) = %f \n", x(end), y(end));

% Plot the solution obtained from the second-order Taylor series method
plot(x, y, '-oy', 'LineWidth', 2);
hold on;

% Plot the solution obtained from ode45 for comparison
xspan = [0 10];
y0 = 1;
[x, y] = ode45(@(x, y) cos(y) - 1, xspan, y0);
plot(x, y, 'r', 'LineWidth', 2);
xlim([0 10])
xlabel('x-axis');
ylabel('y-axis');

% Change legend
legend({'Second-order Taylor series', 'ODE45'})