f = @(x, y) 1 + (x-y)^2;

x(1) = 2;
y(1) = 1;
h = 0.01;
n = 1/h;

for i = 1:2
    y(i+1) = y(i) + h*f(x(i), y(i));
    x(i+1) = x(i) + h;
end

for i = 3:n
    y(i+1) = y(i) + (h/12)*(23*f(x(i), y(i)) - 16*f(x(i-1), y(i-1)) + 5* ...
        f(x(i-2), y(i-2)));
    x(i+1) = x(i) + h;
end

fprintf("y(%f) = %f \n", x(end), y(end))

plot(x, y, '-ok')
hold on;
xspan = [2 3];
y0 = 1;
[x,y] = ode45(@(x, y) 1 + (x-y)^2, xspan, y0);
plot(x, y, 'r')

legend({'3rd order Adams-Bashforth Method', ...
    'ODE45 for comparison'})