function D = VectorD(X, Y, Z)
    % Calculate the magnitude of the direction vector D
    magnitude_D = sqrt(X^2 + Y^2 + Z^2);

    % Compute the normalized direction vector D
    D = [X/magnitude_D, Y/magnitude_D, Z/magnitude_D];
end




