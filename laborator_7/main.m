% 5
f1 = @(y_vec, t) y_vec(1) + 3 * y_vec(2);
f2 = @(y_vec, t) 2 * y_vec(1) + 2 * y_vec(2);
w = euler_solve_system_ode({f1 f2}, [0 1], [[0 1] [0 1]], 0.1)

