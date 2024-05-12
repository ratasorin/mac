function x_min = parabolic_interpolation_find_minimum (f, r, s, t, steps) 
    for i = 0 : steps 
        upper_term = (f(s) - f(r)) * (t - r) * (t - s);
        bottom_term = 2 * ( (s - r) * (f(t) - f(s)) - (f(s) - f(r)) * (t - s) );
        x_min = (r + s) / 2 - (upper_term / bottom_term);
        t = s;
        s = r;
        r = x_min;
    end 
end 