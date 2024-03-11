clear
close all

f = @(x, y) (x-1)*y;

x(1) = 0;
y(1) = 1;
h = 0.01;
n = 2/h;

y(2) = y(1) + h*f(x(1), y(1));
x(2) = x(1) + h;

for i = 2:n
    x(i+1) = x(i) + h;
    y0 = y(i) + (h/2)*(3*f(x(i), y(i)) - f(x(i-1), y(i-1)));
    f_y0 = f(x(i+1), y0);
    error = 1;
    while error > 10^(-6)
        y1 = y(i-1) + h*((1/3)*f(x(i+1), y0) + (4/3)*f(x(i), y(i)) + ...
            (1/3)*f(x(i-1), y(i-1)));
        f_y1 = f(x(i+1), y1);
        error = abs(f_y1 - f_y0);
        f_y0 = f_y1;
    end
    y(i+1) = y1;
end

fprintf("y(%s) = %f \n", num2str(x(end), '%g'), y(end));
% Formats x(end) as a string using the most compact representation, 
% removing trailing zeros if present, and allowing for exponential 
% notation if necessary

plot(x, y,'-ok')
hold on;
xlim([0 2]);
xspan = [0 2];
y0 = 1;
[x,y] = ode45(@(x, y) (x-1)*y, xspan, y0);
plot(x, y, 'r')
legend({'3rd order Milne-Simpson', ...
    'ODE45'},'Location','north')