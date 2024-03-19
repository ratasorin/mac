function [L, U, P] = pa_lu_factorization (matrix)
    [matrix_row_size, matrix_column_size] = size(matrix);

    if(matrix_row_size ~= matrix_column_size)
        error = MException("pa_lu_factorization:non_square_matrix", "The matrix is not square!");
        throw(error);
    end

    matrix_size = matrix_row_size;
    
    P = eye(matrix_size);
    L = eye(matrix_size);
    
    for i = 1 : matrix_size;
        
        max_element_row = i;
        max_element = matrix(i, i);
        
        % find the highest number on a column, below the main diagonal
        for j = i + 1 : matrix_size;
            if(max_element < matrix(j, i))
                max_element = matrix(j, i);
                max_element_row = j;
            end
        end

        % if the highest number is not a pivot, put it on the main diagonal
        if(max_element_row ~= i)
            % swap the row of the highest number (max_element_row) with the current row (i-th row) using a permutation matrix: https://statlect.com/matrix-algebra/permutation-matrix
            
            % compute the current swap
            current_permutation_matrix = generate_permutation_matrix(i, max_element_row, matrix_size);
            
            % apply the current swap on the matrix
            matrix = current_permutation_matrix * matrix;

            % compose all the swaps applied to "matrix" so we can return a final, complete permutation matrix that can be used in: P * A = L * U
            P = current_permutation_matrix * P;
        end
        
        % proceed with the Gaussian elimination for the j-th column
        for j = i + 1 : matrix_size;
            % a[j][i] / a[i][i]
            coefficient = matrix(j, i) / matrix(i, i);
            % we want to do Lj = Lj - a[i][j] / a[i][i] * Li
            matrix(j, :) = subtract_lines(matrix, i, j, coefficient);

            % store the coefficient in the "L" matrix
            L(j, i) = coefficient;
        end
    end

    U = matrix;
end  