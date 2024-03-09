% MATLAB Code
f = @(x) sin(x) + x.^2 - 1;

% Define the initial interval [a, b]
a = 0;
b = 1;

% Initialize the midpoint of the interval
x0 = (b + a) / 2;

% Loop until the desired accuracy is achieved
while abs(b - a) > (10^(-4))
    % Evaluate the function at the midpoint
    f_val = f(x0);

    % Update the interval [a, b] based on the sign of f(x0)
    if f_val < 0
        a = x0; % Update 'a' if f(x0) is negative
    else
        b = x0; % Update 'b' if f(x0) is positive
    end

    % Update the midpoint of the interval
    x0 = (b + a) / 2;
end

% Print the final result
fprintf("Required root is %f\n", x0);
