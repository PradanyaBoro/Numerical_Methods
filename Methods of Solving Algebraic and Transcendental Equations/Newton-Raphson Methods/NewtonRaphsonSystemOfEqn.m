syms x y

f1 = x^2 + x*y - 10;
f2 = y + 3*x*y^2 - 57;

F = [f1; f2];
J = jacobian(F);
F = matlabFunction(F);
J = matlabFunction(J);

xy = [1;1];
error = 1;

while error > (10^(-6))
    new_xy = xy - J(xy(1), xy(2))\F(xy(1), xy(2));
    error = abs(new_xy - xy);
    xy = new_xy;
end

fprintf("Required solution for initial guess (1,1) is (%f,%f) \n", xy(1), xy(2))

xy = [1;0];
error = 1;

while error > (10^(-6))
    new_xy = xy - J(xy(1), xy(2))\F(xy(1), xy(2));
    error = abs(new_xy - xy);
    xy = new_xy;
end

fprintf("Required solution for initial guess (1,0) is (%f,%f) \n", xy(1), xy(2))