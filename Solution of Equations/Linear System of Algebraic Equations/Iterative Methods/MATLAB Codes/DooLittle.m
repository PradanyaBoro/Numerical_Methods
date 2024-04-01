% Define the coefficient matrix A and the constant vector B
A = [2 -3 4; 1 1 4; 3 4 -1];
B = [8; 15; 8];

% Initializing U and L matrices
for i = 1:length(B)
    U(1, i) = A(1, i);  % First row of U matrix equals first row of A matrix
    L(i, i) = 1;        % Diagonal elements of L matrix are set to 1
end

% Computing first column of L matrix
for j = 2:length(B)
    L(j, 1) = A(j, 1) / U(1, 1);  % Formula for computing first column of L matrix
end

% LU decomposition
for i = 2:length(B)
    for j = 2:i
        % Adjusted formula for U(j, i) based on iteration indices
        if i == 2 && j == 2
            U(j, i) = A(j, i) - L(j, 1) * U(1, i);
        elseif i == 3 && j == 2
            U(j, i) = A(j, i) - L(j, 1) * U(1, i) - L(j, 2) * U(2, i);
        else
            U(j, i) = A(j, i) - L(j, 1:j - 1) * U(1:j - 1, i); 
        end
    end

    for j = i + 1:length(B)
        % Adjusted formula for L(j, i) based on iteration indices
        if i == 2
            L(j, i) = (A(j, i) - L(j, 1) * U(1, i)) / U(i, i);
        else
            L(j, i) = (A(j, i) - L(j, 1:i - 1) * U(1:i - 1, i)) / U(i, i);
        end
    end
end

% Solving the system of equations
sol = U^(-1)*L^(-1)*B;

fprintf('Required solution is (%f,%f,%f) \n', sol)