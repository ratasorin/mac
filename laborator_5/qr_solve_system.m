function c = qr_solve_system (A, b)
    [Q, R] = qr_factorization(A);

    [column_size_A, row_size_A] = size(A);
    n = min(row_size_A, column_size_A);

    % QRx = b => Rx = transpose(Q) * b
    b = transpose(Q) * b;

    % only pick the first "n" non-zero entries
    b = b(1 : n, 1);

    % only pick the first "n*n" non-zero entries
    R = R(1 : n, 1 : n);

    c = solve_upper_triangular(R, b);
end