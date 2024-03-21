
function sol = solve_upper_triangular(Upper, b)
    sol = b;

    % a(i, i) * x(i) + ... + a(i, i + n) * x(i + n) + a(i, i + n + 1) * x(i + n + 1) = b(i)
    % a(i, i) * x(i) = sol = b(i) - a(i, i + n + 1) * x(i + n + 1) - a(i, i + n) * x(i + n) - ...
    % x(i) = sol / a(i, i)
    for i = length(Upper) : -1 : 1
        for j = i + 1 : length(Upper)
            sol(i) = sol(i) - Upper(i, j) * sol(j);
        end
        sol(i) = sol(i) / Upper(i, i);
    end 
end 