function cartesian = CylindricalToCartesian(c)
    % input: vector containing cylindrical coordinates (rho, theta, z)
    % output: vector containing cartesian coordinates (x,y,z)

    rho = c(1);
    theta = c(2);
    z = c(3);

    x = rho * cos(theta);
    y = rho * sin(theta);
    
    cartesian = [x; y; z];
end