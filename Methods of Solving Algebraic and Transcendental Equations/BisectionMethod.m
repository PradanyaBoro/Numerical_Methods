syms x 'real'

f = sin(x) + x^2 - 1;

a = 0;
b = 1;

x0 = (b + a) / 2;

while abs(b - a) > (10^(-4))
    f_val = subs(f, x, x0);

    if f_val < 0
        a = x0;
    elseif f_val > 0
        b = x0;
    end

    x0 = (b + a) / 2;
end

fprintf("Required root is %f", x0)