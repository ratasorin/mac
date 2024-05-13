function integral_result = trapezoidal_rule_solve_integral (f, a, b, panels)
    integral_result = 0;
    h = abs(b - a) / panels;

    for i = 0 : panels - 1
        x0 = a + i * h;
        x1 = x0 + h;

        y0 = f(x0);
        y1 = f(x1);

        integral_result = integral_result + (h/2) * (y0 + y1);
    end
end 