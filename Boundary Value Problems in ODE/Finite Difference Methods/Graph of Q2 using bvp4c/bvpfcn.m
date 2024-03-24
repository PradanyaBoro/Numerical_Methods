function dydx = bvpfcn(x,y)
    dydx = [y(2); y(1).*x + 1];
end