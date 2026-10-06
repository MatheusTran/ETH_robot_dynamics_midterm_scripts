% Rotation matrix to ZYZ vector

function v = RotToZYZ(C)    
    z1 = atan2(C(2, 3), C(1, 3));
    y = atan2(sqrt(C(1, 3)^2 + C(2, 3)^2), C(3, 3));
    z2 = atan2(C(3, 2), -C(3, 1));
    v = [z1; y; z2];
end