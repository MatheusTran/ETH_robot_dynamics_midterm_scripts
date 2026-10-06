function q = RotToQuat(R)
  % Input: rotation matrix
  % Output: corresponding quaternion [w x y z]
  c = R;
  q = 0.5 * [
     sqrt(c(1, 1) + c(2,2) + c(3,3) + 1);
     sign(c(3,2) - c(2,3)) * sqrt(c(1,1) - c(2,2) - c(3,3) + 1);
     sign(c(1,3) - c(3,1)) * sqrt(-c(1,1) + c(2,2) - c(3,3) + 1);
     sign(c(2,1) - c(1,2)) * sqrt(-c(1,1) - c(2,2) + c(3,3) + 1);
  ];
end