% Clear workspace and close all figures
clear
close all

% Define the system of first-order ordinary differential equations
f = @(t, y, x) -x - 1 - 0.2 * y;
g = @(t, y, x) y;

% Define the derivatives of the system of equations
df = @(t, y, x) (-0.2) * (-x - 1 - 0.2 * y) - y;
dg = @(t, y, x) -x - 1 - 0.2 * y;

% Initial conditions and parameters
x(1) = 0;
y(1) = 0;
t(1) = 0;
h = 0.01; % Step size
T = 20; % Total time
n = T / h + 1; % Number of steps

% Main loop for the second-order Taylor series method
for i = 1:(n - 1)
    % Compute next values using the second-order Taylor series method
    y(i + 1) = y(i) + h * f(t(i), y(i), x(i)) + (h^2 / 2) * df(t(i), y(i), x(i));
    x(i + 1) = x(i) + h * g(t(i), y(i), x(i)) + (h^2 / 2) * dg(t(i), y(i), x(i));

    % Update time
    t(i + 1) = t(i) + h;
end

% Print the final result
fprintf("x(%f) = %f \n y(%f) = %f \n", t(end), x(end), t(end), y(end));

% Plot the solutions
plot(t, x,'-ok', 'LineWidth', 2)
hold on;
plot(t, y, '-or', 'LineWidth', 2)
xlabel('t')
title('Second Order Taylor Series Method');
tspan = [0 T];
Y0 = [0; 0];
[t, Y] = ode45(@(t, Y) [-Y(2) - 1 - 0.2 * Y(1); Y(1)], tspan, Y0);

y = Y(:, 1);
x = Y(:, 2);

plot(t, y, 'b', 'LineWidth', 2)
hold on
plot(t, x, 'g', 'LineWidth', 2)

legend({'x (Taylor)', 'y (Taylor)', 'x (ODE45)', 'y (ODE45)'}, 'Location', 'southeast');
