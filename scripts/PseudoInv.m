function [ pinvA ] = PseudoInv(A, lambda)
% Input: Any m-by-n matrix, and a damping factor.
% Output: An n-by-m pseudo-inverse of the input according to the Moore-Penrose formula

% Get the number of rows (m) and columns (n) of A
    [m, n] = size(A);

    if rank(A) == m & n >= m
        pinvA = A.'  * inv(A * A.' + lambda^2 * eye(m));
    else %if rank(A) == n & m >= n
        pinvA = inv(A.' * A + lambda^2 * eye(n)) * A.'; % note, matlab hates it when I use inv()
    end
end
