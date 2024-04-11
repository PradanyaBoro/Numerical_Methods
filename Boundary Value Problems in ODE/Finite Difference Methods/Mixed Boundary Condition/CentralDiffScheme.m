clear
close all

a = 0; % Start of the interval
b = 1; % End of the interval
prime_y_a = 1; % Boundary condition is given as y0 + y0' = 1
y_b = 1; % Second boundary condition
h = 0.01; % Step size
n = (b - a) / h + 1; % Number of grid points

x = linspace(a, b, n); % Discretized grid

% Initialize coefficient matrix A and right-hand side vector B
A = zeros(n - 1, n - 1);
B = zeros(n - 1, 1);

% Populate coefficient matrix A and right-hand side vector B
for i = 1:(n - 1)
    for j = 1:(n - 1)
        if i == 1
            A(i, 1) = (2 * h * (- 1) + 2 + (h ^ 2) * x(1));
            A(i, 2) = (-1) - (1 + (h / 2) * 0);
        else
            if i == j
                A(i, j) =  (2 + (h ^ 2) * x(i));
            elseif j == i + 1
                A(i, j) = - 1;
            elseif j == i - 1
                A(i, j) = - 1;
            end
        end   
    end

    % Define right-hand side vector B
    if i == 1
        B(i, 1) = - (h ^ 2) + 2 * h * prime_y_a * (-1);
    elseif i == (n - 1)
        B(i, 1) = - (h ^ 2) + y_b;
    else
        B(i, 1) = - (h ^ 2);
    end
end

% Solve the linear system of equations
y_sol = A\B;

% Concatenate the solution with the boundary value at b
y = [y_sol.', y_b]; % .' operator is used to get the transpose

% Plot the solution
plot(x, y, '--b');
xlabel('x-axis');
ylabel('y-axis');
title('Second Order Central Finite Difference Scheme');
