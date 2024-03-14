clear
close all

% Define the system of first-order ordinary differential equations
f = @(t, y, x) -x - 1;
g = @(t, y, x) y;

% Initial conditions
x(1) = 0;
y(1) = 0;
t(1) = 0;
h = 0.01; % Step size
n = 20 / h + 1; % Number of steps

% Main loop for the fourth-order Runge-Kutta method
for i = 1:(n - 1)
    % Compute intermediate values using Runge-Kutta method
    k1 = h * f(t(i), y(i), x(i));
    l1 = h * g(t(i), y(i), x(i));

    k2 = h * f(t(i) + h/2, y(i) + k1/2, x(i) + l1/2);
    l2 = h * g(t(i) + h/2, y(i) + k1/2, x(i) + l1/2);

    k3 = h * f(t(i) + h/2, y(i) + k2/2, x(i) + l2/2);
    l3 = h * g(t(i) + h/2, y(i) + k2/2, x(i) + l2/2);

    k4 = h * f(t(i) + h, y(i) + k3, x(i) + l3);
    l4 = h * g(t(i) + h, y(i) + k3, x(i) + l3);

    % Update y and x values using the fourth-order Runge-Kutta method
    y(i + 1) = y(i) + (1 / 6) * (k1 + 2 * k2 + 2 * k3 + k4);
    x(i + 1) = x(i) + (1 / 6) * (l1 + 2 * l2 + 2 * l3 + l4);

    % Update time
    t(i + 1) = t(i) + h;
end

% Print the final result
fprintf("y(%f) = %f \n x(%f) = %f", t(end), y(end), t(end), x(end));

% Plot the solutions
plot(t, x, '-ok')
hold on;
plot(t, y, '-or')
xlim([0 20]);
xlabel('t');
ylabel('Values');
tspan = [0 20];
Y0 = [0; 0];
[t, Y] = ode45(@(t, Y) [- Y(2) - 1; Y(1)], tspan, Y0);

y = Y(:, 1);
x = Y(:, 2);

plot(t, y, 'b')
hold on
plot(t, x, 'g')

legend({'x (RK4)', 'y (RK4)', 'x (ODE45)', 'y (ODE45)'});