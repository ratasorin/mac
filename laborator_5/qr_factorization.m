function [Q, R] = qr_factorization (A)
    [column_number, row_size] = size(A);
    projections = zeros(row_size, column_number);
    Q = zeros(row_size, column_number);

    for i = 1 : row_size
        column = A(:, i);
        projections(:, i) = column;
        for j = 2 : i
            projections(:, i) = projections(:, i) - project_vector(column, projections(:, j - 1));
        end

        Q(:, i) = projections(:, i) / norm(projections(:, i));
    end

    % A = QR
    % transpose(Q) * A = R;
    R = transpose(Q) * A;
end