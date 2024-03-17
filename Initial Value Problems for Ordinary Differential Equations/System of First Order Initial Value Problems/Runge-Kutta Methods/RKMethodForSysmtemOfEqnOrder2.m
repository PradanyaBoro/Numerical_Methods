clear
close all

f = @(t, x, y, z) 10*(y - x);
g = @(t, x, y, z) x*(28 - z) - y;
p = @(t, x, y, z) x*y - (8 / 3)*z;

x(1) = 10;
y(1) = 10;
z(1) = 10;
t(1) = 0;
h = 0.02;
n = 50/h + 1;

for i = 1:(n - 1)
    k1_f = h*f(t(i), x(i), y(i), z(i));
    k1_g = h*g(t(i), x(i), y(i), z(i));
    k1_p = h*p(t(i), x(i), y(i), z(i));

    k2_f = h*f(t(i) + h, x(i) + k1_f, y(i) + k1_g, z(i) + k1_p);
    k2_g = h*g(t(i) + h, x(i) + k1_f, y(i) + k1_g, z(i) + k1_p);
    k2_p = h*p(t(i) + h, x(i) + k1_f, y(i) + k1_g, z(i) + k1_p);

    x(i + 1) = x(i) + 0.5 * (k1_f + k2_f);
    y(i + 1) = y(i) + 0.5 * (k1_g + k2_g);
    z(i + 1) = z(i) + 0.5 * (k1_p + k2_p);

    t(i + 1) = t(i) + h;
end


fprintf("x(%f) = %f \n y(%f) = %f \n z(%f) = %f \n", t(end), x(end), t(end), y(end), t(end), z(end));

plot3(x, y, z);
%axes tight;
xlabel('x-axis');
ylabel('y-axis');
zlabel('z-axis');
title('Lorenz system using R-K Method')
view(21, 12);
box on;
grid on;