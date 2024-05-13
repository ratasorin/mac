function integral_result = simpson_rule_solve_integral(f, a, b, panels)
    h = (b - a) / (2 * panels);
    
    integral_result = 0;

    for i = 0 : 2 : 2 * panels - 2
        x0 = a + i * h;
        x1 = x0 + h;
        x2 = x1 + h;

        y0 = f(x0);
        y1 = f(x1);
        y2 = f(x2);

        integral_result = integral_result + (h/3) * (y0 + 4 * y1 + y2);
    end 
end 