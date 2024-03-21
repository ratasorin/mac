% solve an inconsistent system using the QR factorization
A = [4 2 3 0;-2 3 -1 1; 1 3 -4 2; 1 0 1 -1; 3 1 3 -2];
b = [10; 0; 2; 0; 5];

[Q, R] = qr_factorization(A);

[column_size_A, row_size_A] = size(A);
n = min(row_size_A, column_size_A);

% QRx = b => Rx = transpose(Q) * b
b = transpose(Q) * b;

% only pick the first "n" non-zero entries
b = b(1 : n, 1);

% only pick the first "n*n" non-zero entries
R = R(1 : n, 1 : n);

solve_upper_triangular(R, b)

% 10. The minimum distance between a moving point "A" and 3 fixed circles
circle_0_origin = [0 1];
circle_1_origin = [1 1];
circle_2_origin = [0 -1];
circle_radius = 1;

distance_between = @(A, B) sqrt((B(1) - A(1))^2 + (B(2) - A(2))^2);

distance_from_A_to_circle_0 = @(A) distance_between(A, circle_0_origin) - circle_radius;
distance_from_A_to_circle_1 = @(A) distance_between(A, circle_1_origin) - circle_radius;
distance_from_A_to_circle_2 = @(A) distance_between(A, circle_2_origin) - circle_radius;

distance = @(A) [
    distance_from_A_to_circle_0(A);
    distance_from_A_to_circle_1(A);
    distance_from_A_to_circle_2(A);
];  

distance_jacobian = @(A) [
    (A(1) - circle_0_origin(1)) / distance_between(A, circle_0_origin), (A(2) - circle_0_origin(2)) / distance_between(A, circle_0_origin);
    (A(1) - circle_1_origin(1)) / distance_between(A, circle_1_origin), (A(2) - circle_1_origin(2)) / distance_between(A, circle_1_origin);
    (A(1) - circle_2_origin(1)) / distance_between(A, circle_2_origin), (A(2) - circle_2_origin(2)) / distance_between(A, circle_2_origin)
];

best_approximation = gauss_newton(distance, distance_jacobian, 10, [0 0]); % expected result: A (0.4106, 0.0555);

% 11. find the best parameters (bias_1, bias_2) so that the data below can be approximated by the curve: y(h) = bias_1 * h ^ bias_2
h = [0.9120; 0.9860; 1.0600; 1.1300; 1.1900; 1.2600; 1.3200; 1.3800; 1.4100; 1.4900];
y = [13.7; 15.9; 18.5; 21.3; 23.5; 27.2; 32.7; 36.0; 38.6; 43.7];

% given two biases, compute how bad is the approximation. The formula gives: error[i] = bias_1 * h[i] ^ bias_2 - y[i];
approximation_errors = @(bias) bias(1)*h.^bias(2) - y;

jacobian_errors = @(bias) [h.^bias(2), bias(1)*h.^bias(2).*log(h)];

best_biases = gauss_newton(approximation_errors, jacobian_errors, 10, [16 3]) % bias = (15.8854 2.5336)
total_deviation = norm(approximation_errors(best_biases))
remp = total_deviation / sqrt(length(h)) % remp = 0.7547