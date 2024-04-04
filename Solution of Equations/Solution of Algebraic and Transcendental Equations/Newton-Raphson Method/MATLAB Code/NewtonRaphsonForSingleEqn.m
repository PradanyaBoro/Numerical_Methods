% Define the function f(x) as an anonymous function
f = @(x) x.^x + x - 4;

% Define the derivative of f(x)
df = @(x) x.^x .* (log(x) + 1) + 1;

% Initial guess
x0 = 1.4;

% Newton-Raphson iteration
while true
    f_val = f(x0);
    diff_f = df(x0); % Exact derivative
    
    x1 = x0 - (f_val / diff_f);
    
    % Check for convergence
    if abs(x1 - x0) < (10 ^ (-6))
        break;
    end
    
    x0 = x1;
end

fprintf("Root is %f \n", x1);
