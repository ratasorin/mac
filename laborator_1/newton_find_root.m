function root = newton_find_root(f, df, initial_value, steps)
    % pre-allocate the array to improve performance
    x = zeros(1, steps + 1);

    x(1) = initial_value;
    for i = 1 : steps 
        x(i + 1) = x(i) - f(x(i)) / df(x(i));
    end
    root = x(steps + 1);
end