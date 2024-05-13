function w_4 = adam_moulton_2_steps_helper (f, h, w_4, w_3, w_2, t_4, t_3, t_2)
    w_4 = w_3 + (h/12) * (5 * f(t_4, w_4) + 8 * f(t_3, w_3) - f(t_2, w_2));
end 