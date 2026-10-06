% Rotation matrix to Tait-Bryan angles ZYX

function v = RotToZYX(C)
    z = atan2(C(2, 1), C(1, 1));
    y = atan2(-C(3, 1), sqrt(C(3, 2)^2 + C(3, 3)^2));
    x = atan2(C(3, 2), C(3, 3));
    v = [z; y; x];
end