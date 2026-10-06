function q_AC = QuatMult(q_AB,q_BC)
  % Input: two quaternions to be multiplied
  % Output: output of the multiplication
  
  q = q_AB;
  q0 = q(1);
  q1 = q(2);
  q2 = q(3);
  q3 = q(4);
  Mlq = [
    q0  -q1  -q2  -q3;
    q1  q0  -q3   q2;
    q2  q3  q0  -q1;
    q3  -q2  q1  q0;
  ];
  q_AC = Mlq * q_BC;

end

