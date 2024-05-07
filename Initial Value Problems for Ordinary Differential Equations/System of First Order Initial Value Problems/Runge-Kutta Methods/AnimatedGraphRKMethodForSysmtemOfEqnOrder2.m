clear
close all

% Define the system of differential equations
f = @(t, x, y, z) 10*(y - x);
g = @(t, x, y, z) x*(28 - z) - y;
p = @(t, x, y, z) x*y - (8 / 3)*z;

% Initial conditions
x(1) = 10;
y(1) = 10;
z(1) = 10;
t(1) = 0;
h = 0.02; % Step size
n = 50/h + 1;

% Perform second-order Runge-Kutta method
for i = 1:(n - 1)
    % Calculate k1 values
    k1_f = h*f(t(i), x(i), y(i), z(i));
    k1_g = h*g(t(i), x(i), y(i), z(i));
    k1_p = h*p(t(i), x(i), y(i), z(i));

    % Calculate k2 values
    k2_f = h*f(t(i) + h, x(i) + k1_f, y(i) + k1_g, z(i) + k1_p);
    k2_g = h*g(t(i) + h, x(i) + k1_f, y(i) + k1_g, z(i) + k1_p);
    k2_p = h*p(t(i) + h, x(i) + k1_f, y(i) + k1_g, z(i) + k1_p);

    % Update state variables using RK2 formula
    x(i + 1) = x(i) + 0.5 * (k1_f + k2_f);
    y(i + 1) = y(i) + 0.5 * (k1_g + k2_g);
    z(i + 1) = z(i) + 0.5 * (k1_p + k2_p);

    % Update time
    t(i + 1) = t(i) + h;

    % Plot animated trajectory
    plot3(x, y, z, '-r');
    pause(.02);
    
    % Labels and title
    xlabel('x-axis');
    ylabel('y-axis');
    zlabel('z-axis');
    title('Lorenz system using R-K Method')
    
    % Adjust view
    view(21, 12);
    
    % Grid and box
    box on;
    grid on;
    
    % Update plot
    drawnow
    
    % Hold the plot
    hold on;
end

% Display the final state
fprintf("x(%f) = %f \n y(%f) = %f \n z(%f) = %f \n", t(end), x(end), t(end), y(end), t(end), z(end));
