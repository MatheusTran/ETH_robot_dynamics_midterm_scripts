% Takes a Rotation matrix (3x3) and a vector (3x1) and creates a homogenous matrix
function H=Homogenous(C, v)
    H = eye(4);
    H(1:3, 1:3) = C;
    H(1:3, 4) = v;
end