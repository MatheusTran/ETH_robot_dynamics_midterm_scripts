% Takes an angle and rotates around the z axis
function C=RotZ(theta)
    C = [
        cos(theta) -sin(theta)  0;
        sin(theta)  cos(theta)  0;
        0           0           1;
    ];
end

