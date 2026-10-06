% Takes an angle and rotates around the y axis
function C=RotY(theta)
    C = [
        cos(theta)   0  sin(theta);
        0            1  0;
        -sin(theta)  0  cos(theta);
    ];
end

