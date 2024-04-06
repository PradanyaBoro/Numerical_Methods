clear
close all

% Define the ordinary differential equation y' = f(x, y) as an anonymous function
f = @(x, y) -2 * x * y;

% Initial conditions
y(1) = 1;
x(1) = 0;
h = 0.01; % Step size
n = (1 - x(1)) / h; % Number of steps

% Main loop for the second-order explicit Runge-Kutta method
for i = 1:n
    % Calculate k1 and k2 using the Runge-Kutta method
    k1 = h * f(x(i), y(i));
    k2 = h * f(x(i), y(i) + k1);
    
    % Update x and y using the explicit Runge-Kutta method
    x(i + 1) = x(i) + h;
    y(i + 1) = y(i) + 0.5 * (k1 + k2);
end

% Print the final result
fprintf("y(%f) = %f \n", x(end), y(end))

% Plot the solution obtained from the explicit Runge-Kutta method
plot(x, y, '-ok')
hold on;

% Plot the solution obtained from ode45 for comparison
xspan = [0 1];
y0 = 1;
[x, y] = ode45(@(x, y) -2 * x * y, xspan, y0);
plot(x, y, 'r')

legend({'Explicit R-K Method (2nd order)', 'Exact Solution'})
