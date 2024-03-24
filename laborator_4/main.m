% (−1, 3), (0, 5), (3, 1), (4, 1), (5, 1) should result in coefficients: 
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