f1 = @(x) (x./ sqrt(x.^2 + 9));

correct_integral_f1 = integral(f1, 0, 4)
trapezoidal_integral_16_panels_f1 = trapezoidal_rule_solve_integral(f1, 0, 4, 16);
trapezoidal_integral_32_panels_f1 = trapezoidal_rule_solve_integral(f1, 0, 4, 32);

f2 = @(x) x.^2.*sin(x);

correct_integral_f2 = integral(f2,0,pi)

trapezoidal_integral_16_panels_f2 = trapezoidal_rule_solve_integral(f2, 0, pi, 16);
trapezoidal_integral_32_panels_f2 = trapezoidal_rule_solve_integral(f2, 0, pi, 32);

simpson_integral_16_panels_f1 = simpson_rule_solve_integral(f1, 0, 4, 16)
simpson_integral_32_panels_f1 = simpson_rule_solve_integral(f1, 0, 4, 32)

simpson_integral_16_panels_f2 = simpson_rule_solve_integral(f2, 0, pi, 16)
simpson_integral_32_panels_f2 = simpson_rule_solve_integral(f2, 0, pi, 32)

f3 = @(x) x./sqrt(x.^4+1);

correct_integral_f3 = integral(f3, 0, 1)
integral_adaptive_quadrature_f3 = adaptive_quadrature(f3, 0, 1, 0, 1, 0.5 * 10^(-8))