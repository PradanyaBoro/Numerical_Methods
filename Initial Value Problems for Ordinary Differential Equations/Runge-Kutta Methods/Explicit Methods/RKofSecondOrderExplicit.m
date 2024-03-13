f = @(x, y) -2*x*y;

x0 = 0;
y0 = 1;
h = 0.01;
n = (1 -x0)/h;
y(1) = y0;
x(1) = x0;

for i = 1:n
    k1 = h*f(x(i), y(i));
    k2 = h*f(x(i), y(i) + k1);
    x(i + 1) = x0 + i*h;
    y(i + 1) = y(i) + 0.5*(k1 + k2);
end

fprintf("y(%f) = %f \n", x(i + 1), y(i + 1))

plot(x, y, '-ok')
hold on;
hold on;
xspan = [0 1];
y0 = 1;
[x,y] = ode45(@(x, y) -2*x*y, xspan, y0);
plot(x, y, 'r')

%{
x = linspace(0, 1, n + 1);
y = exp(-x.^2);
plot(x, y, 'r');
%}

legend({'Numerical Solution using 2nd order explicit R-K method', 'Analytical exact solution'})