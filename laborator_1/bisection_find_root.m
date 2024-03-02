function root = bisection_find_root (f, a, b, precision) 
    mid = (a + b) / 2;

    if((b - a) / 2 < precision)
        root = mid;
        return;
    end 
    if(f(a) * f(mid) < 0)
        root = bisection_find_root(f, a, mid, precision);
        return;
    end
    if(f(b) * f(mid) < 0)
        root = bisection_find_root(f, mid, b, precision);
        return;
    end 


end