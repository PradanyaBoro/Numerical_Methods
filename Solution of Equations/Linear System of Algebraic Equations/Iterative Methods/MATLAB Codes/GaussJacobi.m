% Define the coefficient matrix A and the constant vector B
A = [20, -1, 1; 1, 15, -1; 2, 1, -20];
B = [23.28; 29.92; -55.64];

% Initialize the solution vector x and the error
x = [0; 0; 0];
error = 1;

% Iterative loop until convergence
while error > 10^(-6)
    % Store the current solution vector for error calculation
    x_old = x;
    
    % Iterate over each row of the matrix A
    for j = 1:length(x)
        % Update the j-th component of the solution vector x using the previous iteration's values
        x(j) = (B(j) - sum(A(j,:)*x_old) + A(j,j)*x_old(j)) / A(j,j);
    end

    % Calculate the error as the absolute difference between the old and new solution vectors
    error = abs(x - x_old);
end

% Print the solution
fprintf("Solution is \n");
disp(x);
