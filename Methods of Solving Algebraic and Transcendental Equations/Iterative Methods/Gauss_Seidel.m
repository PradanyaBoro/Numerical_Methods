A = [4 -2 1; 3 9 -2; 4 2 13];
B = [-8; 11; 24];

x = [0; 0; 0];
error = 1;

while error > 10^(-5)
    x_old = x;
    for j = 1:length(x)
        x(j) = (B(j) - sum(A(j,:)*x) + A(j,j)*x(j)) / A(j,j);
    end

    error = abs(x - x_old);
end

fprintf("Solution is (%f,%f,%f)", x(1), x(2), x(3));