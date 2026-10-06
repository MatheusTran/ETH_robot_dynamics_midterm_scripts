% Takes a Homogenous Matrix and outputs the inverse
function Hinv = InvHomogenous(H)
    Hinv = eye(4);
    C = H(1:3, 1:3);
    v = H(1:3, 4);
    Hinv(1:3, 1:3) = C';
    Hinv(1:3, 4) = -C' * v;
end