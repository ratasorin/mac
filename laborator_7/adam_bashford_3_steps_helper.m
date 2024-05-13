function w_4 = adam_bashford_3_steps_helper (f, h, w_3, w_2, w_1, t_3, t_2, t_1)
    w_4 = w_3 + (h/12) * (23 * f(t_3, w_3) - 16 * f(t_2, w_2) + 5 * f(t_1, w_1));  
end 