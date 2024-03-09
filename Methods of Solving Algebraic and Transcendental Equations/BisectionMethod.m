f = @(x) sin(x) + x.^2 - 1;

a = 0;  % Define the initial interval
b = 1;

x0 = (b + a) / 2;  % Initialize the midpoint of the interval

while abs(b - a) > (10^(-4))  % Loop until the desired accuracy is achieved
    f_val = f(x0);  % Evaluate the function at the midpoint
    
    if f_val < 0
        a = x0;  % Update 'a' if f(x0) is negative
    else
        b = x0;  % Update 'b' if f(x0) is positive
    end

    x0 = (b + a) / 2;  % Update the midpoint of the interval
end

fprintf("Required root is %f\n", x0);
