coefficient_matrix = [
    -5  1 -2; 
     1 -3  1; 
     2  1 -4
];
free_terms = [6 -2 -7];
[A, x] = gauss_solve_system(coefficient_matrix, free_terms); % the result should be: x = [-1.539682 0.5238095 1.11111111]

[L, U, P] = pa_lu_factorization([3 1 2; 6 3 4; 3 1 5]);
if(isequal(L, [1 0 0; 0.5 1 0; 0.5 1 1]) && isequal(U, [6 3 4; 0 -0.5 0; 0 0 3]) && isequal(P, [0 1 0; 1 0 0; 0 0 1]))
    disp ("The PA LU factorization algorithm works!");
else 
    disp ("The PA LU factorization doesnt work!");
end

coefficient_matrix_gs = [
     3  1  -1;
     2  4   1;
    -1  2   5
];

free_terms_gs = [4; 1; 1];

sol = gauss_seidel_solve_system(coefficient_matrix_gs, free_terms_gs, 10)