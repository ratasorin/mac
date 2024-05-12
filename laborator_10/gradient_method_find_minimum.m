function min_x = gradient_method_find_minimum (f, grad_f, initial_approximation, steps) 
    min_x = initial_approximation;
    for i = 0 : steps
        v = grad_f(min_x(1), min_x(2));
        g = @(s) f(min_x - s * v);
        min_s = fminsearch(g, 0);
        min_x = min_x - min_s * v;
    end
end 