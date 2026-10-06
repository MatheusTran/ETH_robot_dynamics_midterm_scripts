function R = QuatToRot(q)
  % Input: quaternion [w x y z]
  % Output: corresponding rotation matrix
  
  w = q(1);
  x = q(2);
  y = q(3);
  z = q(4);
  R = [
    w^2+x^2-y^2-z^2  2*x*y-2*w*z  2*w*y+2*x*z;
    2*w*z+2*x*y      w^2-x^2+y^2-z^2   2*y*z-2*w*x;
    2*x*z-2*w*y      2*w*x+2*y*z       w^2-x^2-y^2+z^2;
  ];
end
