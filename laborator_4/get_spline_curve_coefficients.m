function [a, b, c, d] = get_spline_curve_coefficients (x, y)
    sample_size = length(x);
    
    delta_x = zeros(sample_size - 1, 1);
    for i = 1 : sample_size - 1
        delta_x(i) = x(i + 1) - x(i);
    end

    delta_y = zeros(sample_size - 1, 1);
    for i = 1 : sample_size - 1
        delta_y(i) = y(i + 1) - y(i);
    end

    % solve for a: 
    a = y;

    % solve for c:
    c_coefficients = zeros(sample_size, sample_size);
    c_coefficients(1, 1) = 1;
    c_coefficients(sample_size, sample_size) = 1;

    for i = 2 : sample_size - 1
        % main diagonal 
        c_coefficients(i, i) = 2 * (delta_x(i - 1) + delta_x(i));

        % below main diagonal
        c_coefficients(i, i - 1) = delta_x(i - 1);

        % above main diagonal
        c_coefficients(i, i + 1) = delta_x(i);
    end

    c_free_terms = zeros(sample_size, 1);
    c_free_terms(1) = 0;
    c_free_terms(sample_size) = 0;
    
    for i = 2 : sample_size - 1
        c_free_terms(i) = 3 * (delta_y(i) / delta_x(i) - delta_y(i - 1) / delta_x(i - 1));
    end 

    c = c_coefficients\c_free_terms;

    % solve for d: 
    d = zeros(sample_size, 1);
    for i = 1 : sample_size - 1
        d(i) = (c(i + 1) - c(i)) / (3 * delta_x(i));
    end 
    
    % solve for b:
    b = zeros(sample_size , 1);
    for i = 1 : sample_size - 1
        b(i) = delta_y(i) / delta_x(i) - delta_x(i) * (2 * c(i) + c(i + 1)) / 3;
    end
end 