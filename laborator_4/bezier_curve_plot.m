function bezier_curve_plot(x, y)
    [coefficients_x, coefficients_y] = bezier_curve_coefficients(x, y);
    
    plot([x(1) x(2)],[y(1) y(2)],"r:",x(2),y(2),"rs");
    hold on;
    plot([x(3) x(4)],[y(3) y(4)],"r:",x(3),y(3),"rs");
    hold on;
    plot(x(1),y(1),"bo",x(4),y(4),"bo");
    hold on;

    fx = @(t) coefficients_x(1) + coefficients_x(2) * t + coefficients_x(3) * t^2 + coefficients_x(4) * t^3;
    fy = @(t) coefficients_y(1) + coefficients_y(2) * t + coefficients_y(3) * t^2 + coefficients_y(4) * t^3;

    % generate 10^5 points from between [0, 1]
    t = 0 : 0.0001: 1;
    
    % we know that points on the bezier curve obey the parametric relationship:
    % (x, y) = (fx(t), fy(t))
    computed_x = arrayfun(fx, t);
    computed_y = arrayfun(fy, t);

    plot(computed_x, computed_y);
    hold off;
end 