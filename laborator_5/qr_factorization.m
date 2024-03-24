function [Q, R] = qr_factorization (A)
    [rows, columns] = size(A);
    projections = zeros(rows, columns);
    Q = zeros(rows, columns);

    for i = 1 : columns
        column = A(:, i);
        projections(:, i) = column;
        for j = 2 : i
            projections(:, i) = projections(:, i) - project_vector(column, projections(:, j - 1));
        end

        Q(:, i) = projections(:, i) / norm(projections(:, i));
    end

    % A = QR => transpose(Q) * A = R;
    R = transpose(Q) * A;
end