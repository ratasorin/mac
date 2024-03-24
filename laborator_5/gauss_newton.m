function best_approximation = gauss_newton (residuals, residuals_jacobian, steps, initial_approximation) 
    x = zeros(length(initial_approximation), steps);
    x(:, 1) = initial_approximation;
    for i = 1 : steps - 1
        x(:, i + 1) = x(:, i) - (transpose(residuals_jacobian(x(:, i))) * residuals_jacobian(x(:, i))) \ transpose(residuals_jacobian(x(:, i))) * residuals(x(:, i));
    end
    best_approximation = x(:, steps);
end