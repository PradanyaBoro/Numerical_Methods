syms x 'real'

f = x^x + x - 4;

x0 = 1.4;

f_val = subs(f, x, x0);
diff_f = subs(diff(f, x), x, x0);
x1 = x0 - (f_val / diff_f);

while abs(x1 - x0) > (10^(-6))
    x0 = x1;
    
    f_val = subs(f, x, x0);
    diff_f = subs(diff(f, x), x, x0);
    x1 = x0 - (f_val / diff_f);
end

fprintf("Required root is %f", x1)