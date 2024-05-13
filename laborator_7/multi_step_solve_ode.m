function best_w = multi_step_solve_ode(f, initial_value, t, h)
    w = initial_value;
    steps = t(2) / h;
    
    w(1) = initial_value;
    % w_1 = w_0 + (h/2) * (f(t_0, w_0)) + f(t_0 + h, w_0 + h * f(t_0, w_0)))
    w(2) = w(1) + (h/2) * (f(t(1), w(1)) + f(t(1) + h, w(1) + h * f(t(1), w(1))));
    t(2) = t(1) + h;

    for i = 2 : steps
        
        % w_2 = w_1 + h * ((3/ 2) * f(t_1, w_1) - (1/2) * f(t_0, w_0))
        w(3) = w(2) + h * ((3/2) * f(t(2), w(2)) - (1/2) * f(t(1), w(1)));
        
        w(1) = w(2);
        w(2) = w(3);
        
        t(1) = t(2);
        t(2) = t(1) + h;
    end

    best_w = w(3);
end