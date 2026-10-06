function spherical = CartesianToSpherical(c)
    % input: vector containing cartesian coordinates (x,y,z)
    % output: vector containing spherical coordinates (r, theta, phi)
    x = c(1);
    y = c(2);
    z = c(3);
    r = sqrt(x^2 + y^2 + z^2);
    theta = atan2(sqrt(x^2 + y^2), z^2);
    phi = atan2(y, x);
    spherical = [r; theta; phi];
end