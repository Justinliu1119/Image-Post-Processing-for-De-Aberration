function E_IrK = ComputeE_Irk(a_0, I_x1y1, r_x2y2, D, n, lamda)
    k = (2*pi) / lamda;

    dot_product1 = dot(n, r_x2y2);
    norm_product1 = norm(n) * norm(r_x2y2);
    dot_product2 = dot(n, D);
    norm_product2 = norm(n) * norm(D);

    K_Drn = (1/2) * (cos(dot_product1/norm_product1) - cos(dot_product2/norm_product2));

    E_IrK = a_0 * (exp(1i * k * I_x1y1) / I_x1y1) * (exp(1i * k * r_x2y2) / r_x2y2) * K_Drn;
end
