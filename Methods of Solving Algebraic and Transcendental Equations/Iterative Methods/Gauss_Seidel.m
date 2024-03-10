% Define the coefficient matrix A and the constant vector B
A = [4, -2, 1; 3, 9, -2; 4, 2, 13];
B = [-8; 11; 24];

x = [0; 0; 0];    % Initial guess for the solution vector
error = 1;        % Initialize error to ensure entry into the while loop

% Iterative loop until convergence (error falls below a certain threshold)
while error > 10^(-6)
    % Store the current solution vector for error calculation
    x_old = x;
    
    % Iterate over each row of the matrix A
    for j = 1:length(x)
        % Update the j-th component of the solution vector x using the most recently updated values
        x(j) = (B(j) - sum(A(j,:)*x) + A(j,j)*x(j)) / A(j,j);
    end

    % Calculate the error as the absolute difference between the old and new solution vectors
    error = norm(x - x_old);
end

% Print the solution
fprintf("Solution is (%f, %f, %f)\n", x(1), x(2), x(3));