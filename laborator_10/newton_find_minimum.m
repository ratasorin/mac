function min_vec = newton_find_minimum (hessian_f, gradient_f, initial_approximation, steps)
    min_vec = initial_approximation; 
    for i = 0 : steps
        v = hessian_f(min_vec(1), min_vec(2)) \ gradient_f(min_vec(1), min_vec(2));
        min_vec =  min_vec - v;
    end 
end  