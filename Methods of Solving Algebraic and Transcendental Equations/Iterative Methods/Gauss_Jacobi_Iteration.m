A = [20 -1 1; 1 15 -1; 2 1 -20];
B = [23.28; 29.92; -55.64];

x = [0; 0; 0];
error = 1;

while error > 10^(-6)
    x_old = x;
    for j = 1:length(x)
        x(j) = (B(j) - sum(A(j,:)*x_old) + A(j,j)*x_old(j)) / A(j,j);
    end

    error = abs(x - x_old);
end

fprintf("Solution is \n");
disp(x);