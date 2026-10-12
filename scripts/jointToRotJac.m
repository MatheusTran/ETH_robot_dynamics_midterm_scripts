% input: H is a 4 x 4 x n tensor, it is basically a list of all the homogenous
% transformations between each frame. 
% So like H(:, :, 1) = H_I1
% H(:, :, 2) = H_12
% H(:, :, 3) = H_23
% etc. Note that they are all homogenous matrices
% and revolute_axes is a 3 x n matrix, where each entry is the rotational axis 
% of the revolute joint. if it is a prismatic joint, then put 0 0 0.
% revolute_axes(:, 1) = rotational axis of the first joint
% revolute_axes(:, 2) = rotational axis of the second joint
% etc
function J_R = jointToRotJac(H, revolute_axes)
    [h w n] = size(H);
    J_R = zeros(3, n);
    
    C = H(1:3, 1:3, 1);
    for i = 1:(n -1)
        C(:, :, i + 1) = C(1:3, 1:3, i) * H(1:3, 1:3, i + 1);
    end
    for i = 1:n
        J_R(:, i)= C(:, :, i) * revolute_axes(:, i);
    end  
end