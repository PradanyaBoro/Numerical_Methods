% Define the system of equations as anonymous functions
f1 = @(x, y) x.^2 + x.*y - 10;
f2 = @(x, y) y + 3.*x.*y.^2 - 57;

% Define the Jacobian matrix as an anonymous function
J = @(x, y) [2*x + y, x; 3*y.^2, 1 + 6*x*y];

% Initial guess
xy = [1; 1];
error = 1;

% Newton-Raphson iteration
while error > (10^(-6))
    % Compute the updated solution using the Jacobian matrix and system of equations
    new_xy = xy - J(xy(1), xy(2)) \ [f1(xy(1), xy(2)); f2(xy(1), xy(2))];
    
    % Calculate the error as the Euclidean norm of the difference between new_xy and xy
    error = norm(new_xy - xy);
    
    % Update xy with the new solution
    xy = new_xy;
end

fprintf("Required solution for initial guess (1,1) is (%f,%f) \n", xy(1), xy(2))

% Change the initial guess
xy = [1; 0];
error = 1;

% Newton-Raphson iteration
while error > (10^(-6))
    % Compute the updated solution using the Jacobian matrix and system of equations
    new_xy = xy - J(xy(1), xy(2)) \ [f1(xy(1), xy(2)); f2(xy(1), xy(2))];
    
    % Calculate the error as the Euclidean norm of the difference between new_xy and xy
    error = norm(new_xy - xy);
    
    % Update xy with the new solution
    xy = new_xy;
end

fprintf("Required solution for initial guess (1,0) is (%f,%f) \n", xy(1), xy(2))
