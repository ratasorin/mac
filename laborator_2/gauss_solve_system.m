function [lower_triangular_matrix, solutions] = gauss_solve_system(matrix, free_terms)
[matrix_row_size, matrix_column_size] = size(matrix);

if(matrix_row_size ~= matrix_column_size)
    error = MException("gauss_solve_system:non_square_matrix", "The matrix is not square!");
    throw(error);
end

matrix_size = matrix_row_size;

for i = 1 : matrix_size - 1;
    if(matrix(i, i) == 0)
        error = MException("gauss_solve_system:pivot_zero", "The pivot is 0! Cannot divide!");
        throw(error);
    end

    for j = i + 1 : matrix_size;
        % a[j][i] / a[i][i]
        coefficient = matrix(j, i) / matrix(i, i);
        % we want to do Lj = Lj - a[i][j] / a[i][i] * Li
        matrix(j, :) = subtract_lines(matrix, i, j, coefficient);

        free_terms(j) = free_terms(j) - coefficient * free_terms(i);
    end
end

solutions = zeros(1, matrix_size);

for i = matrix_size : - 1 : 1
    for j = i + 1 : matrix_size
        free_terms(i) = free_terms(i) - matrix(i, j) * solutions(j);
    end 
    solutions(i) = free_terms(i) / matrix(i, i);
end

lower_triangular_matrix = matrix;
end