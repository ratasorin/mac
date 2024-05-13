function best_w = runge_kutta_4_degree_solve_ode(f, y0, t, h)
    steps = t(2) / h;
    best_w = y0;

    for i = 1 : steps 
        best_w = runge_kutta_4_degree_helper(f, t, y0, h);
    end 
end 