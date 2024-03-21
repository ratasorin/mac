function sol = gauss_seidel_solve_system (A, b, steps) 
    x = zeros(length(A), steps);
    
    % check if the matrix is "diagonally dominant"
    for i = 1 : length(A)
        element = A(i, i);
        sum = 0;
        for j = 1 : length(A)
            if(i ~= j) 
                sum = sum + abs(A(i, j))
            end
        end 
        
        if(element < sum) 
            error = MException("gauss_seidel_solve_system:not_diagonally_dominant", "The matrix is not diagonally dominant! On line '%d' the element '%d' is lower than the sum '%d'!", i, element, sum);
            throw(error);
        end
    end 


    main_diag = diag(diag(A));
    upper = triu(A) - main_diag;
    lower = tril(A) - main_diag;

    main_diag_inverse = inv(main_diag);

    % (upper + lower + diag) * x = b;
    % x = diag^-1 * (b - upper * x - lower * x)
    % x(k + 1) = diag^-1 * (b - upper * x(k) - lower * x(k + 1))
    for i = 1 : steps - 1
        for j = 1 : length(A)
            x(j, i + 1) = main_diag_inverse(j, j) * (b(j) - dot(upper(j, :), x(:, i)) - dot(lower(j, :), x(:, i + 1)));
        end 
    end
    sol = x(steps);
end 