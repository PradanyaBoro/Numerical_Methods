clear
close all

a = 0;
b = 1;
prime_y_a = 1;
y_b = 1;
h = 0.01;
n = (b - a) / h + 1;

x = linspace(a, b, n);

A = zeros(n - 1, n - 1);
B = zeros(n - 1, 1);
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

    if i == 1
        B(i, 1) = - (h ^ 2) + 2 * h * prime_y_a * (-1);
    elseif i == (n - 1)
        B(i, 1) = - (h ^ 2) + y_b;
    else
        B(i, 1) = - (h ^ 2);
    end
end

y_sol = A\B;
y = [y_sol.', y_b];

plot(x, y, '--b');
xlabel('x-axis');
ylabel('y-axis');
title('Second Order Central Finite Difference Scheme');
