% Takes an angle and rotates around the x axis
function C=RotX(theta)
    C = [
        1  0  0;
        0  cos(theta) -sin(theta);
        0  sin(theta)  cos(theta);
    ];
end

