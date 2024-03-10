A = [2 -3 4; 1 1 4; 3 4 -1];
B = [8; 15; 8];

for i = 1:length(B)
    U(1, i) = A(1, i);
    L(i, i) = 1;
end

for j = 2:length(B)
    L(j, 1) = A(j, 1) / U(1, 1);
end

for i = 2:length(B)
    for j = 2:i
        U(j, i) = A(j, i) - L(j, 1:j - 1) * U(1:j - 1, i);   % L(i, 1:j - 1) * U(1:j - 1, j);
    end

    for j = i + 1:length(B)
        L(j, i) = (A(j, i) - L(j, 1:i - 1) * U(1:i - 1, i)) / U(i, i);
    end
end

sol = U^(-1)*L^(-1)*B;

fprintf('Required solution is (%f,%f,%f)', sol)