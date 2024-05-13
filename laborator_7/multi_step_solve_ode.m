function w = multi_step_solve_ode(f, initial_value, t, h)
    w = initial_value;
    steps = t(2) / h;
    
    % w_0
    prev_prev_w = initial_value;
    % t_0
    prev_t = t(1);
    % w_1 = w_0 + (h/2) * (f(t_0, w_0)) + f(t_0 + h, w_0 + f(t_0, w_0)))
    prev_w = prev_prev_w + (h/2) * (f(prev_t, prev_prev_w) + f(prev_t + h, prev_prev_w + h * f(prev_t, prev_prev_w)));

    for i = 1 : steps - 1
        % w_2 = w_1 + h * ((3/ 2) * f(t_1, w_1) - (1/2) * f(t_0, w_0))
        w = prev_w + h * ((3/2) * f(prev_t + h, prev_w) - (1/2) * f(prev_t, prev_prev_w));
        
        % w_0 <- w_1
        prev_prev_w = prev_w;
        
        % w_1 <- w_0
        prev_w = w;
        
        prev_t = prev_t + h;
    end 
end