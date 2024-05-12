% Problem 1:
f0 = @(x) 3 * x^4 + 4 * x^3 - 24 * x^2 + 5;
% fplot(f0); % looks like the function has a local minimum between -3 and -2 and another between 1 and 2

x_min_1_golden_section = golden_section_find_minimum(f0, -3, -2, 10); % should be -2.5616
x_min_2_golden_section = golden_section_find_minimum(f0, 1, 2, 10); % should be 1.5616

x_min_1_parabolic_interpolation = parabolic_interpolation_find_minimum(f0, -3, -2, -2.5, 10); % should be -2.5616
x_min_2_parabolic_interpolation = parabolic_interpolation_find_minimum(f0, 1, 2, 1.4, 10); % should be 1.5616

f1 = @(x) exp(-x(1)^2*x(2)^2) + (x(1)-1)^2 + (x(2)-1)^2;
hess_f1 = @(x,y) [  [4*x^2*y^4*exp(-x^2*y^2) - 2*y^2*exp(-x^2*y^2) + 2,     4*x^3*y^3*exp(-x^2*y^2) - 4*x*y*exp(-x^2*y^2)];
                    [4*x^3*y^3*exp(-x^2*y^2) - 4*x*y*exp(-x^2*y^2), 4*x^4*y^2*exp(-x^2*y^2) - 2*x^2*exp(-x^2*y^2) + 2]];
grad_f1 = @(x,y) [2*x - 2*x*y^2*exp(-x^2*y^2) - 2; 2*y - 2*x^2*y*exp(-x^2*y^2) - 2];

min_expected_vec = fminsearch(f1, [1, 1])
min_vec_newton = newton_find_minimum(hess_f1, grad_f1, [1; 1], 50)
min_vec_gradient = gradient_method_find_minimum(f1, grad_f1, [1; 1], 10)
min_vec_conjugate_gradients = conjugate_gradients_find_minimum(f1, grad_f1, [1; 1], 10)