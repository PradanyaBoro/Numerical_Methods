% Define the coefficient matrix A and the constant vector B
A = [2 -3 4; 1 1 4; 3 4 -1];
B = [8; 15; 8];

% Initializing U and L matrices
for i = 1:length(B)
    U(1, i) = A(1, i);  % Setting the first row of U matrix equal to the first row of A matrix
    L(i, i) = 1;        % Setting the diagonal elements of L matrix to 1
end

% Computing the first column of L matrix
for j = 2:length(B)
    L(j, 1) = A(j, 1) / U(1, 1);  % Computing the first column of L matrix using the formula
end

% LU decomposition
for i = 2:length(B)
    for j = 2:i
        % Computing elements of U matrix using the formula
        U(j, i) = A(j, i) - L(j, 1:j - 1) * U(1:j - 1, i);
    end

    for j = i + 1:length(B)
        % Computing elements of L matrix using the formula
        L(j, i) = (A(j, i) - L(j, 1:i - 1) * U(1:i - 1, i)) / U(i, i);
    end
end

% Solving the system of equations
sol = U\(L\B);

fprintf('Required solution is (%f,%f,%f) \n', sol)
