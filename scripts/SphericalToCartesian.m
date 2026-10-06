function cartesian = SphericalToCartesian(s)
    % input: vector containing spherical coordinates (r, theta, phi)
    % output: vector containing cartesian coordinates (x,y,z)
    r = s(1);
    theta = s(2);
    phi = s(3);
    x = r * sin(theta) * cos(phi);
    y = r * sin(theta) * sin(phi);
    z = r * cos(theta);

    cartesian = [x; y; z];
end