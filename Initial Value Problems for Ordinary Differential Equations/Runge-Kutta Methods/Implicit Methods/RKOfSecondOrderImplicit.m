clear
close all

syms z k

% Define the differential equation y' = f(x, y) as an anonymous function
f = @(x, y) y^2 - x;

% Initial conditions
y(1) = 1;
x(1) = 0;
h = 0.02; % Step size
n = (1 - x(1)) / h; % Number of steps

% Initialize k for the Runge-Kutta method
k = h * f(x(1) + h / 2, y(1) + k / 2);

% Main loop for the implicit second-order Runge-Kutta method
for i = 1:n
    % Define the implicit equation for z using the Runge-Kutta method
    F = z - 0.02 * ((y(i) + z / 2)^2 - (x(i) + 0.02 / 2));
    
    % Initial guess for z using the current k value
    z0 = h * f(x(i), y(i));
    
    % Evaluate F(z) and its derivative with respect to z
    F_val = subs(F, z, z0);
    diff_F = subs(diff(F, z), z, z0);
    
    % Apply Newton's method to solve for the next k value (z)
    z1 = z0 - (F_val / diff_F);
    while abs(z1 - z0) > (10^(-6))
        z0 = z1;
        F_val = subs(F, z, z0);
        diff_F = subs(diff(F, z), z, z0);
        z1 = z0 - (F_val / diff_F);
    end
    K1 = z1;

    % Update y using the implicit Runge-Kutta method
    y(i + 1) = y(i) + K1;
    x(i + 1) = x(i) + h;
end

% Print the final result
fprintf("y(%f) = %f \n", x(end), y(end))

% Plot the solution obtained from the implicit Runge-Kutta method
plot(x, y, '-ok')
hold on;

% Plot the solution obtained from ode45 for comparison
xspan = [0 1];
y0 = 1;
[x, y] = ode45(@(x, y) y^2 - x, xspan, y0);
plot(x, y, 'r')

% Add legend
legend({'Second Order Implicit Runge-Kutta Method', 'ODE45'}, 'location', 'northwest')