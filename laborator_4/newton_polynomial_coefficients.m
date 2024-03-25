function coefficients = newton_polynomial_coefficients(x, y) 
    sample_size = length(x);
    
    coefficients = zeros(sample_size, 1);
    f = zeros(sample_size, sample_size);
    f(:, 1) = y;
    
    for col_index = 2 : sample_size
        for row_index = col_index : sample_size
            f(row_index, col_index) = (f(row_index, col_index - 1) - f(row_index - 1, col_index - 1)) / (x(row_index) - x(row_index - col_index + 1));
        end
    end 

    for i = 1 : sample_size
        coefficients(i) = f(i, i);
    end
end 