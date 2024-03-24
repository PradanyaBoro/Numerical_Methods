clear
close all

% Define the boundary conditions and interval
a = 0;
b = 1;
y_a = 0;
y_b = 1;

% Step size and number of intervals
h = 0.01;
n = (b - a) / h + 1;

% Generate x values
x = linspace(a, b, n);

% Initialize coefficient matrix A and solution vector B
A = zeros(n - 2, n - 2);
B = zeros(n - 2, 1);

% Construct coefficient matrix A and solution vector B
for i = 1:(n - 2)
    for j = 1:(n - 2)
        % Diagonal elements
        if i == j
            A(i, j) = - (2 - (h ^ 2));
        % Off-diagonal elements
        elseif j == i + 1
            A(i, j) = 1 + h;
        elseif j == i - 1
            A(i, j) = 1 - h;
        end
    end

    % Boundary conditions for vector B
    if i == 1
        B(i, 1) = (h ^ 2) * x(i + 1) - (1 - (h / 2) * 2) * y_a;
    elseif i == (n - 2)
        B(i, 1) = (h ^ 2) * x(i + 1) - (1 + (h / 2) * 2) * y_b;
    else
        B(i, 1) = (h ^ 2) * x(i + 1);
    end
end

% Solve for y using linear system of equations
y_sol = A\B;

% Concatenate boundary values with solution
y = [y_a, y_sol.', y_b];

% Plot the solution
plot(x, y, '--b');
xlabel('x-axis');
ylabel('y-axis');
title('Second Order Central Finite Difference Scheme');