function y = compute_newton_polynomial (coefficients, initial_x_values, x)
    polynomial_degree = length(initial_x_values);
    
    sum_terms = coefficients;
    
    for i = 2 : polynomial_degree
        sum_terms(i : end) = sum_terms(i : end) * (x - initial_x_values(i - 1));
    end 

    y = 0;
    for i = 1 : polynomial_degree
        y = y + sum_terms(i);
    end 
end 