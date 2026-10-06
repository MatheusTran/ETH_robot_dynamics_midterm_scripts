% angle axis vector of the form (theta, x, y, z).' into a 3x3 rot matrix

function C=AngleAxisToRot(v)
    theta = v(1);
    ctheta = cos(theta);
    stheta = sin(theta);
    x = v(2);
    y = v(3);
    z = v(4);
    C = [
        x^2 * (1 - ctheta) + ctheta, x * y * (1 - ctheta) - z * stheta, x * z * (1 - ctheta) + y * stheta;
        y * x * (1 - ctheta) + z * stheta, y^2 * (1 - ctheta) + ctheta, y * z * (1 - ctheta) - x * stheta;
        z * x * (1 - ctheta) - y * stheta, z * y * (1 - ctheta) + x * stheta, z^2 * (1 - ctheta) + ctheta
    ];
end