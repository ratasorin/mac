function [secant_x, slope] = find_x_secant(f, x1, x2)
    if(x1 > x2)
        temp = x1;
        x1 = x2;
        x2 = temp;
    end 
    y1 = f(x1);
    y2 = f(x2);
    
    if(x2 == x1)
        secant_x = x1;
        slope = NaN;
        return;
    end

    m = (y2 - y1) / (x2 - x1);

    % we know that: y2 / (x2 - secant_x) = m
    secant_x = x2 - y2 / m;
    slope = m;
end