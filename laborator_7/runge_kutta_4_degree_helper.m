function w = runge_kutta_4_degree_helper (f, t, y0, h)
    s1 = f(t(1), y0);
    s2 = f(t(1) + (h/2), y0 + (1/2) * s1);
    s3 = f(t(1) + (h/2), y0 + (1/2) * s2);
    s4 = f(t(1) + h, y0 + h * s3);
    w = y0 + (h / 6) * (s1 + 2 * s2 + 2 * s3 + s4);
end