% Define the coefficient matrix A and the constant vector B
A = [2, -3, 4; 1, 1, 4; 3, 4, -1];
B = [8; 15; 8];

% Initialize matrices U and L for the LU decomposition
U = zeros(size(A));
L = zeros(size(A));

% Perform the LU decomposition using the Doolittle method
for i = 1:length(B)
    % Assign the first row of A to the first row of U
    U(1, i) = A(1, i);
    % Set the diagonal elements of L to 1
    L(i, i) = 1;
end

% Compute the first column of L
for j = 2:length(B)
    % Compute the first column of L using the Doolittle method
    L(j, 1) = A(j, 1) / U(1, 1);
end

% Compute the rest of the matrices U and L
for i = 2:length(B)
    for j = 2:i
        % Compute the elements of U using the Doolittle method
        U(j, i) = A(j, i) - L(j, 1:j - 1) * U(1:j - 1, i);
    end

    for j = i + 1:length(B)
        % Compute the elements of L using the Doolittle method
        L(j, i) = (A(j, i) - L(j, 1:i - 1) * U(1:i - 1, i)) / U(i, i);
    end
end

% Solve the system of equations using LU decomposition
sol = inv(U) * inv(L) * B;

% Print the solution
fprintf('Required solution is (%f, %f, %f) \n', sol);