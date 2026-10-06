function cylindrical = CartesianToCylindrical(c)
    % input: vector containing cartesian coordinates (x,y,z)
    % output: vector containing cylindrical coordinates (rho, theta, z)
    x = c(1);
    y = c(2);
    z = c(3);
    rho = sqrt(x^2 + y^2);
    theta = atan2(y, x);
    cylindrical = [rho; theta; z];
end