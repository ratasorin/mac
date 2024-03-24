function spline_curves = get_spline_curves (x, y)
    sample_size = length(x);    
    [a, b, c, d] = get_spline_curve_coefficients(x, y);

    for i = 1 : sample_size - 1
        spline_curves{i} = @(t) a(i) + b(i) * (t - x(i)) + c(i) * ((t - x(i))^2) + d(i) * ((t - x(i))^3); 
    end
end 