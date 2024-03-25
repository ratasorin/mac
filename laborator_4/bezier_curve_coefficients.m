function [coefficients_x, coefficients_y] = bezier_curve_coefficients(x, y)
    bx=3*(x(2)-x(1));
    by=3*(y(2)-y(1));

    cx=3*(x(3)-x(2))-bx;
    cy=3*(y(3)-y(2))-by;

    dx=x(4)-x(1)-bx-cx;
    dy=y(4)-y(1)-by-cy;
    
    coefficients_x = [1 bx cx dx];
    coefficients_y = [1 by cy dy];
end 