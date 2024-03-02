
function root = fixed_point_iteration_find_root(g, initial_value, steps) 
    derivative = @(f, x) (f(x + 0.000001) - f(x)) / 0.000001;
    
    if(abs(derivative(g, initial_value)) > 1)
        err = MException("fixed_point_iteration_find_root:divergence", "The derivative of the initial value: %d is: %d > 1. The algorithm will diverge", initial_value, derivative(g, initial_value));
        throw(err);
    end

    x = zeros(1, steps + 1);
    x(1) = initial_value;

    for i = 1 : steps 
        x(i + 1) = g(x(i));
    end

    root = x(steps + 1);
end