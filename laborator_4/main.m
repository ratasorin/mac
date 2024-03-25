% interpolation points: [(−1, 3), (0, 5), (3, 1), (4, 1), (5, 1)] with a spline curve should result in coefficients: 
% a = [3; 5; 1; 1; 1]
% b = [2.5629; 0.8742; -0.6824; 0.1950]
% c = [0; -1.6887; 1.1698; -0.2925]
% d = [-0.5629; 0.3176; -0.4874; 0.0975]
x = [-1; 0; 3; 4; 5];
y = [3; 5; 1; 1; 1];

[a, b, c, d] = get_spline_curve_coefficients(x, y);
splines = get_spline_curves(x, y);

for i = 1 : length(x) - 1
    fplot(splines{i}, [x(i), x(i + 1)]);
    hold on
end 
hold off


x=[0.6 0.7 0.8 0.9 1];
y=[1.433329 1.632316 1.896481 2.247908 2.718282];
coefficients = newton_polynomial_coefficients(x, y); % should be [1.4333 1.9899 3.2589 3.6807 4.0004]

f = @(x) exp(x^2);
% compute the approximation error of the polynomial with respect to the "f" function at point 0.82
computed_y = compute_newton_polynomial(coefficients, x, 0.82);
actual_y = f(0.82);
abs(computed_y - actual_y); % error should be -2.3349e-05

% compute the approximation error of the polynomial with respect to the "f" function at point 0.98
computed_y = compute_newton_polynomial(coefficients, x, 0.98);
actual_y = f(0.98);
abs(computed_y - actual_y); % error should be 1.0661e-04

x=[1;1;3;2];
y=[1;3;3;2];
bezier_curve_plot(x, y);

% 4. use cebisev nodes to build a 3rd degree polynomial that approximates sin on [0, pi/2] 
cebisev_nodes = get_cebisev_nodes(0, pi / 2, 4);
y = arrayfun(@(t) sin(t), cebisev_nodes)
coefficients = newton_polynomial_coefficients(cebisev_nodes, y) % should be [0.9982 0.2669 -0.4186 -0.1143]

% show how the approximation is doing on [-2, 2]
fplot(@(t) compute_newton_polynomial(coefficients, cebisev_nodes, t), [-2 2], 'Linewidth',2);
hold on;
fplot(@(t) sin(t), [-2 2], '--r');