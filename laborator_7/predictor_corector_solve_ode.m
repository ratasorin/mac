function w = predictor_corector_solve_ode (f, y0, t, h) 
    steps = t(2) / h;

    t(2) = t(1) + h;
    t(3) = t(2) + h;
    t(4) = t(3) + h;

    w(1) = y0;
    w(2) = runge_kutta_4_degree_helper(f, t(1), y0, h);
    w(3) = runge_kutta_4_degree_helper(f, t(2), y0, h);
    for i = 3 : steps
        w(4) = adam_bashford_3_steps_helper(f, h, w(3), w(2), w(1), t(3), t(2), t(1));
        w(4) = adam_moulton_2_steps_helper(f, h, w(4), w(3), w(2), t(4), t(3), t(2));

        w(1) = w(2);
        w(2) = w(3);
        w(3) = w(4);

        t(1) = t(1) + h;
        t(2) = t(2) + h;
        t(3) = t(3) + h;
        t(4) = t(4) + h;
    end

    w = w(4);
end 