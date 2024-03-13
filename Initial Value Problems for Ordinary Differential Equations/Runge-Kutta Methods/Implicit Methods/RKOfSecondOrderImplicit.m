clear
close all

syms z k

f = @(x, y) y^2 - x;

x0 = 0;
y0 = 1;
h = 0.02;
n = (1 -x0)/h;
y(1) = y0;
x(1) = x0;

k = h*f(x(1) + h/2, y(1) + k/2);

for i = 1:n
    F = z - 0.02*((y(i) + z/2)^2 - (x(i) + 0.02/2));
    
    z0 = h*f(x(i), y(i));
    
    F_val = subs(F, z, z0);
    diff_F = subs(diff(F, z), z, z0);
    z1 = z0 - (F_val / diff_F);
    
    while abs(z1 - z0) > (10^(-6))
        z0 = z1;
        
        F_val = subs(F, z, z0);
        diff_F = subs(diff(F, z), z, z0);
        z1 = z0 - (F_val / diff_F);
    end
    K1 = z1;

    y(i + 1) = y(i) + K1;
    x(i + 1) = x0 + i*h;
end

fprintf("y(%f) = %f \n", x(i + 1), y(i + 1))

plot(x, y, '-ok')
hold on;
xspan = [0 1];
y0 = 1;
[x,y] = ode45(@(x, y) y^2 - x, xspan, y0);
plot(x, y, 'r')
