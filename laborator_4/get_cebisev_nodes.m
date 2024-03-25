function nodes = get_cebisev_nodes(a, b, nodes_count)
    nodes = 1 : 2 : 2 * nodes_count
    make_cebisev = @(odd) (b + a) / 2 + (b - a) * cos(odd * pi / (2 * nodes_count)) / 2
    nodes = arrayfun(make_cebisev, nodes) 
end 