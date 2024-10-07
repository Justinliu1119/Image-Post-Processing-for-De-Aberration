function K_Drn = K(D, r_x2y2, n)
    K_Drn = (1/2) * (cos(dot(n,r_x2y2)/(norm(n)*norm(r_x2y2)))-cos(dot(n,D)/(norm(n)*norm(D))));
end