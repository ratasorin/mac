function w_vec = euler_solve_system_ode (f_vec, initial_values_vec, interval_vec, h)
    w_vec = initial_values_vec;
    max_t = max(max(interval_vec));
    steps = max_t / h;
    for current_step = 1 : steps
        slopes = zeros(length(f_vec));
        % iterate through all function f(i) and compute the slopes:
        for i = 1 : length(f_vec)
            slopes(i) = f_vec{i}(w_vec);
        end 

        % after all slopes are computed get the new values of w by using the formula:
        % w(i) = w(i) + h * slope(i);
        for i = 1 : length(f_vec)
            w_vec(i) = w_vec(i) + slopes(i) * h;
        end
    end 
end 