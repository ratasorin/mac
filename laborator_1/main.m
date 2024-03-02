TOLERANCE = 0.000001;

% exercise 1
% plot the function to aproximate roots
f1 = @(x) 2*(x^3) - 6*x - 1;
ezplot(f1, [-10, 10]);
% roots seen on graph: (x = -1.63972, y = 0.02), (x = -0.161663, y = -0.03847), (x = 1.82448, y = 0.199518)
root1_f1 = bisection_find_root(f1, -2, 0, TOLERANCE);
root2_f1 = bisection_find_root(f1, -1, 1, TOLERANCE);
root3_f1 = bisection_find_root(f1, 1, 2, TOLERANCE);


% exercise 2
[success_secant_root1_f1, secant_root1_f1] = secant_find_root(f1, 1, 2, 10); % should find 1.82448
[success_secant_root2_f1, secant_root2_f1] = secant_find_root(f1, -1, 1, 10); % should find -0.161663
[success_secant_root3_f1, secant_root3_f1] = secant_find_root(f1, -132, -123, 10); % should find ???


% exercise 3
f2 = @(x) x^5 + x - 1;

% a fixed point is one that satisfies g(a) = a 
% we want to find f(x) = 0 => x^5 + x - 1 = 0
% from here we need to isolate x: i.e. x = 1 - x^5, and call g(x) = x = 1 - x^5. The problem is: |g'(0.8)| > 1 so the algorithm will diverge!
% a better isolation is: x^5 + x - 1 = 0 => x^5 - 1 + x = 0 => (x - 1)(x^4 + x^3 + x^2 + x + 1) + x = 0 => x - 1 = -x / x^4 + x^3 + x^2 + x + 1 => x = 1 -x / x^4 + x^3 + x^2 + x + 1 
% thus we get g:
g = @(x) 1 - x / (x^4 + x^3 + x^2 + x + 1);

% now if we find "a" such that: g(a) = a => a = (1 - a) / (a^4 + a^3 + a^2 + a + 1) => ... => a^5 - 1 + a = 0 => f(a) = 0 => a is root!
a = fixed_point_iteration_find_root(g, 0.8, 10);