% a 3x3 rot matrix into angle axis vector of the form (theta, x, y, z).'

function v=RotToAngleAxis(C)
    theta = acos((C(1,1) + C(2,2) + C(3,3) - 1)/2);
    if abs(sin(theta)) < 1e-10
        v = [theta; 0; 0; 0];
        return;
    end
    n = 1 / (2 * sin(theta)) * [C(3, 2) - C(2, 3) ; C(1, 3) - C(3, 1); C(2, 1) - C(1, 2)];
    v = [theta; n];
end