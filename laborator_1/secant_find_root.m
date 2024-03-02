
function [success, root] = secant_find_root(f, x0, x1, steps)
    TOLERANCE = 0.0000001;
    x = zeros(1, steps + 1);
    x(1) = x0;
    x(2) = x1;

    for i = 2 : steps
        [x(i + 1)] = find_x_secant(f, x(i), x(i - 1));
        
        if(f(x(i + 1)) == 0)
            root = x(i + 1);
            success = true;
            return;
        end
    end

    if(f(x(steps + 1)) < TOLERANCE)
        root = x(steps + 1);
        success = true;
        return;
    end

    success = false;
    root = NaN;
end