% 5
g1 = @(y_vec, t) y_vec(1) + 3 * y_vec(2);
g2 = @(y_vec, t) 2 * y_vec(1) + 2 * y_vec(2);
w_euler_system = euler_solve_system_ode({g1 g2}, [0 1], [[0 1] [0 1]], 0.1);

f0 = @(t, y) 1 / y^2;
f1 = @(t, y) 2 * (t + 1) * y;
f2 = @(t, y) t^3 / y^2;

% 7
w_adam_bashford_step_f0 = multi_step_solve_ode(f0, 1, [0 1], 0.05)
w_adam_bashford_step_f1 = multi_step_solve_ode(f1, 1, [0 1], 0.05)
w_adam_bashford_step_f2 = multi_step_solve_ode(f2, 1, [0 1], 0.05)

% 8
w_best_aproximation_f0 = ode45(f0, [0 1], 1)
w_best_aproximation_f1 = ode45(f1, [0 1], 1)
w_best_aproximation_f2 = ode45(f2, [0 1], 1)

% 9
w_multi_step_f0 = multi_step_solve_ode(f0, 1, [0 1], 0.05);
w_multi_step_f1 = multi_step_solve_ode(f1, 1, [0 1], 0.05);
w_multi_step_f2 = multi_step_solve_ode(f2, 1, [0 1], 0.05);

% 11
w_adam_bashford_f0 = adam_bashford_3_steps_solve_ode(f0, 1, [0 1], 0.05);
w_adam_bashford_f1 = adam_bashford_3_steps_solve_ode(f1, 1, [0 1], 0.05);
w_adam_bashford_f2 = adam_bashford_3_steps_solve_ode(f2, 1, [0 1], 0.05);

%12
w_predictor_corector_f0 = predictor_corector_solve_ode(f0, 1, [0 1], 0.05)
w_predictor_corector_f1 = predictor_corector_solve_ode(f1, 1, [0 1], 0.05)
w_predictor_corector_f2 = predictor_corector_solve_ode(f2, 1, [0 1], 0.05)