% solve an inconsistent system using the QR factorization
A = [4 2 3 0; -2 3 -1 1; 1 3 -4 2; 1 0 1 -1; 3 1 3 -2];
b = [10; 0; 2; 0; 5];

qr_solve_system(A, b)  % should be [1.2739; 0.6885; 1.2124; 1.7497]

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
total_deviation = norm(approximation_errors(best_biases));
remp = total_deviation / sqrt(length(h)); % remp = 0.7547

% 4. petrol production by year (in million of barrels)
production_year = [1994; 1995; 1996; 1997; 1998; 1999; 2000; 2001; 2002; 2003];
production = [67.052; 68.008; 69.803; 72.024; 73.400; 72.063; 74.669; 74.487; 74.065; 76.777];

% task 1: find the **line** that best approximates this data
% we want to find the best parameters "m", "n" to approximate the system: m * year + n = production
% this yields the system: LINE * [m; n] = production, where:
m_coefficients = production_year.^1; % [67.052; 68.008; ...; 76.777]
n_coefficients = production_year.^0; % [1; 1; ...; 1]
LINE = [m_coefficients n_coefficients];

% this will be an inconsistent system so we can use QR factorization to solve for it:  
params = qr_solve_system(LINE, production);
m = params(1);
n = params(2);

best_approximation_line = @(x) m * x + n;
fplot(best_approximation_line, [1994 2003]);
hold on 
plot(production_year, production, ".");
hold off

% task 2: find the **parabola** that best approximates this data
% we want to find the best parameters "a", "b", "c" to approximate the system: a * year^2 + b * year + c = production
% this yields the system: PARABOLA * [a; b; c] = production, where:
c_coefficients = production_year.^0;
b_coefficients = production_year.^1;
a_coefficients = production_year.^2;
PARABOLA = [a_coefficients b_coefficients c_coefficients];

% this will again be an inconsistent system so just solve it:
params = PARABOLA\production;
a = params(1);
b = params(2);
c = params(3);

best_approximation_parabola = @(x) a * x^2 + b * x + c; % here the matlab console will print a warning, ignore it.
fplot(best_approximation_parabola, [1994 2003]);
hold on 
plot(production_year, production, ".");
hold off

% task 3: find the **cubic curve** that best approximates this data
% we want to find parameters "c0", "c1", "c2", "c3" to approximate the system: c3 * x^3 + c2 * x ^ 2 + c1 * x + c0 = y 
% this yields the system: CUBIC * [c0; c1; c2; c3] = production, where:
c0_coefficients = production_year.^0;
c1_coefficients = production_year.^1;
c2_coefficients = production_year.^2;
c3_coefficients = production_year.^3;

CUBIC = [c0_coefficients c1_coefficients c2_coefficients c3_coefficients];
cubic_params = CUBIC\production;
c0 = cubic_params(1)
c1 = cubic_params(2)
c2 = cubic_params(3)
c3 = cubic_params(4)

best_approximation_cubic = @(x) c0 + c1 * x + c2 * x^2 + c3 * x^3; % here the matlab console will print a warning, ignore it.
fplot(best_approximation_cubic, [1994 2003]);
hold on 
plot(production_year, production, ".");
hold off

% task 4: predict oil production in 2018
linear_prediction = best_approximation_line(2018); % 91.1370
parabola_prediction = best_approximation_parabola(2018); % 64.2220
cubic_prediction = best_approximation_cubic(2018); % wrong answer in the textbook ???

% task 5: remp of models
linear_remp = norm(arrayfun(best_approximation_line, production_year) - production) / sqrt(length(production_year));
parabola_remp = norm(arrayfun(best_approximation_parabola, production_year) - production) / sqrt(length(production_year));
cubic_remp = norm(arrayfun(best_approximation_cubic, production_year) - production) / sqrt(length(production_year));

% 5. japan petrol consumption (in mega barrels per day)
monthly_consumption_2003 = [6.224; 6.665; 6.241; 5.302; 5.073; 5.127; 4.994; 5.012; 5.108; 5.377; 5.510; 6.372];

% we want to use a periodic model: y(t) = c1 + c2*cos(2πt) + c3*sin(2πt) + c4*cos(4πt) to approximate consumption "y(t)" based on the current month "t"
% to do that we need to find the coefficients [c1; c2; c3; c4].
% we know that: 
% y(month 1) = 6.224 => c1 + c2*cos(2π) + c3*sin(2π) + c4*cos(4π) = 6.224
% y(month 2) = 6.665 => c1 + c2*cos(4π) + c3*sin(4π) + c4*cos(8π) = 6.665
% ...
% y(month 12) = 6.372 => c1 + c2*cos(12 * 2π) + c3*sin(12 * 2π) + c4*cos(12 * 4π) = 6.372
% thus we get an inconsistent system: C * [c1; c2; c3; c4] = [6.224; 6.665; ...; 6.372]

C = zeros(number_of_months, number_of_coefficients);

% here we need to do a trick! We cannot use whole numbers from 1 to 12 because that will give a rank 1 matrix with identical rows and columns
% instead we need to normalize our data into a [0 1] range:
normalized_input = ([1; 2; 3; 4; 5; 6; 7; 8; 9; 10; 11; 12] - 1) / 12;

for i = 1 : length(normalized_input)
    c1_coefficient = 1;
    c2_coefficient = cos(2 * pi * normalized_input(i));
    c3_coefficient = sin(2 * pi* normalized_input(i));
    c4_coefficient = cos(4 * pi * normalized_input(i));
    C(i, :) = [c1_coefficient c2_coefficient c3_coefficient c4_coefficient];
end 

c = C\monthly_consumption_2003; % c = [5.5838 0.7541 0.1220 0.1935]

f = @(t) c(1) + c(2)*cos(2 * pi * t) + c(3)*sin(2 * pi * t) + c(4)*cos(4 * pi * t); 

consumption_approximation_error = arrayfun(f, normalized_input) - monthly_consumption_2003;
remp = norm(consumption_approximation_error) / sqrt(length(normalized_input)); % 0.1836