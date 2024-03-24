function res = bvp_bc(ya, yb)
    res = [ya(1) + ya(2) - 1; yb(1) - 1];
end