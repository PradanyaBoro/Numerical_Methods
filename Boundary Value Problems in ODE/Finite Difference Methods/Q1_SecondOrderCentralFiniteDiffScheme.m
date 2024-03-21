clear
close all

a = 0;
b = 1;
y_a = 0;
y_b = 1;
h = 0.01;
n = (b - a) / h + 1;

%y = sym('y', [1, n - 1]);
% eqns = [-(2 - h ^ 2) * y(1) + (1 + (h / 2) * 2) * y(2) == (h ^ 2) * x(1), 
%     (1 - (h / 2) * 2) * y(1:end - 2) - (2 - h ^ 2) * y(2:end - 1) + (1 + (h / 2) * 2) * y(3:end) == ];
% 
% [A, B] = equationsToMatrix(eqns);
% y_sol = linsolve([A, B]);
% 
% y = [y_a, y_sol.', y_b];

x = linspace(a, b, n);

A = zeros(n - 2, n - 2);
B = zeros(n - 2, 1);
for i = 1:(n - 2)
    for j = 1:(n - 2)
        if i == j
            A(i, j) = - (2 - (h ^ 2));
        elseif j == i + 1
            A(i, j) = 1 + h;
        elseif j == i - 1
            A(i, j) = 1 - h;
        end
    end

    if i == 1
        B(i, 1) = (h ^ 2) * x(i + 1) - (1 - (h / 2) * 2) * y_a;
    elseif i == (n - 2)
        B(i, 1) = (h ^ 2) * x(i + 1) - (1 + (h / 2) * 2) * y_b;
    else
        B(i, 1) = (h ^ 2) * x(i + 1);
    end
end

y_sol = A\B;
y = [y_a, y_sol.', y_b];

plot(x, y, '--b');
xlabel('x-axis');
ylabel('y-axis');
title('Second Order Central Finite Difference Scheme');
