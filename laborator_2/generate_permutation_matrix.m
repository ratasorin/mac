function permutation_matrix = generate_permutation_matrix(i, j, size) 
    permutation_matrix = eye(size);
    permutation_matrix([i j], :)= permutation_matrix([j i], :);
end 