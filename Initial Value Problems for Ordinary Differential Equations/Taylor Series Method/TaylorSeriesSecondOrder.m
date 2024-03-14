clear
close all

f = @(x, y) cos(y) - 1;
d_f = @(x, y) -sin(y)*(cos(y) - 1);

x(1) = 0;
y(1) = 1;
h = 0.01;
n = 10/h + 1;

for i = 1:n
    x(i + 1) = x(i) + h;
    y(i + 1) = y(i) + h*f(x(i), y(i)) + (h^2 / 2)*d_f(x(i), y(i));
end

fprintf("y(%f) = %f \n", x(n), y(n));

plot(x, y, '-oy', 'LineWidth', 2);
hold on;
xspan = [0 10];
y0 = 1;
[x, y] = ode45(@(x, y) cos(y) - 1, xspan, y0);
plot(x, y, 'r', 'LineWidth', 2);
xlim([0 10])
xlabel('x-axis');
ylabel('y-axis');

legend({'Taylor series', 'ODE45'})