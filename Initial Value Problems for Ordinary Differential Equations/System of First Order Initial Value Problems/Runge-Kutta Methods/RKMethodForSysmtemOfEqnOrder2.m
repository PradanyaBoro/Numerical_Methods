% Clear workspace and close all figures
clear
close all

% Define the Lorenz system of first-order ordinary differential equations
f = @(t, x, y, z) 10 * (y - x);
g = @(t, x, y, z) x * (28 - z) - y;
p = @(t, x, y, z) x * y - (8 / 3) * z;

% Initial conditions and parameters
x(1) = 10;
y(1) = 10;
z(1) = 10;
t(1) = 0;
h = 0.02; % Step size
n = 50 / h + 1; % Number of steps

% Main loop for the second-order Runge-Kutta method
for i = 1:(n - 1)
    % Compute k1 values
    k1_f = h * f(t(i), x(i), y(i), z(i));
    k1_g = h * g(t(i), x(i), y(i), z(i));
    k1_p = h * p(t(i), x(i), y(i), z(i));

    % Compute k2 values
    k2_f = h * f(t(i) + h, x(i) + k1_f, y(i) + k1_g, z(i) + k1_p);
    k2_g = h * g(t(i) + h, x(i) + k1_f, y(i) + k1_g, z(i) + k1_p);
    k2_p = h * p(t(i) + h, x(i) + k1_f, y(i) + k1_g, z(i) + k1_p);

    % Update x, y, and z values
    x(i + 1) = x(i) + 0.5 * (k1_f + k2_f);
    y(i + 1) = y(i) + 0.5 * (k1_g + k2_g);
    z(i + 1) = z(i) + 0.5 * (k1_p + k2_p);

    % Update time
    t(i + 1) = t(i) + h;
end

% Print the final result
fprintf("x(%f) = %f \n y(%f) = %f \n z(%f) = %f \n", t(end), x(end), t(end), y(end), t(end), z(end));

% Plot the solution trajectory in 3D
plot3(x, y, z);
xlabel('x-axis');
ylabel('y-axis');
zlabel('z-axis');
title('Lorenz system using Second Order Runge-Kutta Method');
view(21, 12);    % Fix view of the 3d plot
box on;
grid on;
