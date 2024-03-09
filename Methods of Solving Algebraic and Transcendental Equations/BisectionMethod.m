syms x 'real';

f = sin(x) + x^2 - 1;

a = 0;    % Define the initial interval [a, b]
b = 1;

% Initialize the midpoint of the interval
x0 = (b + a) / 2;

% Loop until the desired accuracy is achieved
while abs(b - a) > (10^(-4))
    % Evaluate the function at the midpoint
    f_val = subs(f, x, x0);

    % Update the interval [a, b] based on the sign of f(x0)
    if f_val < 0
        a = x0; % Update 'a' if f(x0) is negative
    elseif f_val > 0
        b = x0; % Update 'b' if f(x0) is positive
    end

    % Update the midpoint of the interval
    x0 = (b + a) / 2;
end

fprintf("Required root is %f", x0)
