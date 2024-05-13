function best_w = adam_bashford_3_steps_solve_ode (f, y0, t, h)
    steps = t(2) / h;

    w = zeros(4);
    w(1) = y0;
    w(2) = runge_kutta_4_degree_helper(f, t, w(1), h);
    w(3) = runge_kutta_4_degree_helper(f, t, w(2), h);
    
    t = zeros(3);
    t(1) = t(1);
    t(2) = t(1) + h;
    t(3) = t(2) + h;

    for i = 3 : steps
        w(4) = w(3) + (h/12) * (23 * f(t(3), w(3)) - 16 * f(t(2), w(2)) + 5 * f(t(1), w(1)));
        
        w(1) = w(2);
        w(2) = w(3);
        w(3) = w(4);

        t(1) = t(2);
        t(2) = t(3);
        t(3) = t(2) + h;
    end 

    best_w = w(3);
end 