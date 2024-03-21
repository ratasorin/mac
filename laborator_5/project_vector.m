% "u" will be projected on "v" = PR v (u)
function pr = project_vector(u, v)
    cos_uv = dot(v, u) / dot(v, v);
    pr = v.*cos_uv;
end 