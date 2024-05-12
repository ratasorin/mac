function min_vec = conjugate_gradients_find_minimum(f, grad_f, initial_approximation, steps) 
    min_vec = initial_approximation;
    d = -grad_f(min_vec(1), min_vec(2));
    r = zeros(2, 2);
    r(:,1) = -1 * grad_f(min_vec(1), min_vec(2))
    for i = 0 : steps
        g = @(s) f(min_vec - s * d);
        alpha = fminsearch(g, 0);
        min_vec = min_vec - alpha * d;
        r(:,2) = -1 * grad_f(min_vec(1), min_vec(2))
        beta = dot(r(:,2), r(:,2)) / dot(r(:,1), r(:,1))
        d = r(:,2) + beta * d;
        r(:,1) = r(:,2); 
    end
end 