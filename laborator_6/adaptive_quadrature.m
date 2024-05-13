function integral_result = adaptive_quadrature (f, a, b, a_original, b_original, TOLERANCE)
    c = (a + b) / 2;
    S_ab = (b - a) * (f(a) + f(b)) / 2;
    S_ac = (c - a) * (f(a) + f(c)) / 2;
    S_cb = (b - c) * (f(c) + f(b)) / 2;

    if(abs(S_ab - S_ac - S_cb) < 3 * TOLERANCE * ((b - a) / (b_original - a_original)))
        integral_result = S_ac + S_cb;
    else 
        integral_result = adaptive_quadrature (f, a, c, a_original, b_original, TOLERANCE) + adaptive_quadrature(f, c, b, a_original, b_original, TOLERANCE);
    end
end