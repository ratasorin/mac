% we want to perform: L2 = L2 - coefficient * L1
function L2 = subtract_lines(matrix, L1_index, L2_index, coefficient)
    L2 = matrix(L2_index, :);
    L1 = matrix(L1_index, :);

    [~, line_size] = size(L1);

    for i = 1 : line_size;
        L2(1, i) = L2(1, i) - coefficient * L1(1, i);
    end
end