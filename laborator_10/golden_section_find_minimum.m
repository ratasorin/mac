function x_min = golden_section_find_minimum (f, a, b, steps)
    g = (sqrt(5) - 1) / 2;
    for i = 1 : steps
        if(f(a + (1 - g)*(b - a)) < f(a + g*(b - a)))
            b = a + g * (b - a);
        else 
            a = a + (1 - g)*(b - a);
        end 
    end
    x_min = (a + b) / 2;

end 