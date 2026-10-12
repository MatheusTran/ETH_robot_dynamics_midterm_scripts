
# Using

Copy and paste the scripts folder into your working folder, then run the `init_workspace` command that is given with the files.

Remember to zip the scripts folder with your submission

# RotX(theta)

`RotX(theta)` returns a rotation matrix that rotates around the x axis by `theta` radians.

$$R_x(\theta) = \begin{bmatrix}
1 & 0 & 0 \\
0 & cos(\theta) & -sin(\theta)\\
0 & sin(\theta) & cos(\theta)\\
\end{bmatrix}$$

```
>> RotX(pi)

ans =

    1.0000         0         0
         0   -1.0000   -0.0000
         0    0.0000   -1.0000
```


# RotY(theta)
`RotY(theta)` returns a rotation matrix that rotates around the y axis by `theta` radians.

$$R_y(\theta) = \begin{bmatrix}
cos(\theta) & 0 & sin(\theta) \\
0 & 1 & 0 \\
-sin(\theta) & 0 & cos(\theta) \\
\end{bmatrix}$$

```
>> RotY(pi)

ans =

   -1.0000         0    0.0000
         0    1.0000         0
   -0.0000         0   -1.0000

```
# RotZ(theta)
`RotZ(theta)` returns a rotation matrix that rotates around the z axis by `theta` radians.

$$R_z(\theta) = \begin{bmatrix}
cos(\theta) & -sin(\theta) & 0 \\
sin(\theta) & cos(\theta) &  0 \\
0 & 0 & 1 \\
\end{bmatrix}$$

```
>> RotZ(pi)

ans =

   -1.0000   -0.0000         0
    0.0000   -1.0000         0
         0         0    1.0000
```
# Homogenous(C, v)
`Homogenous(C, v)` takes a 3x3 rotation matrix `C` and a 3x1 translation vector `v` and makes it into a 4x4 homogenous matrix 

$$H = \begin{bmatrix}
C_{\mathcal{AB}}& _\mathcal{A}r_{\mathcal{AB}}\\
0_{1\times3} & 1
\end{bmatrix}$$

```
>> Homogenous(RotX(pi), [1; 2; 3])

ans =

    1.0000         0         0    1.0000
         0   -1.0000   -0.0000    2.0000
         0    0.0000   -1.0000    3.0000
         0         0         0    1.0000
```

# InvHomogenous(H)
`InvHomogenous(H)` takes a 4x4 homogenous matrix and gives the inverse

$$H^{-1} = \begin{bmatrix}
C_{\mathcal{AB}}^T & -C_{\mathcal{AB}}^T *_\mathcal{A}r_{\mathcal{AB}}\\
0_{1\times3} & 1
\end{bmatrix}$$

```
>> InvHomogenous(Homogenous(RotX(pi), [1; 2; 3]))

ans =

    1.0000         0         0   -1.0000
         0   -1.0000    0.0000    2.0000
         0   -0.0000   -1.0000    3.0000
         0         0         0    1.0000

```

# CartesianToCylindrical
`CartesianToCylindrical(v)` converts a 3x1 vector `v=[x ; y ; z]` containing cartesian coordinates into a vector containing Cylindrical coordinates $\begin{bmatrix}\rho \\ \theta \\ z\end{bmatrix}$
$$
\rho = \sqrt{x^2+y^2}
$$

$$
\theta = \operatorname{atan2}(y,x)
$$

$$
z=z
$$

```
>> CartesianToCylindrical([0 ; 1 ; 0])

ans =

    1.0000
    1.5708
         0
```


# CartesianToSpherical

`CartesianToSpherical(v)` converts a 3x1 vector `v=[x ; y ; z]` containing cartesian coordinates into a vector containing Spherical coordinates $\begin{bmatrix}r \\ \theta \\ \phi\end{bmatrix}$

$$
r = \sqrt{x^2+y^2+z^2}
$$

$$
\theta =
\operatorname{atan2}
\left(
\sqrt{x^2+y^2},
z
\right)
$$

$$
\phi = \operatorname{atan2}(y,x)
$$

```
>> CartesianToSpherical([1 ; 1 ; 1])

ans =

    1.7321
    0.9553
    0.7854
```

# CylindricalToCartesian
`CylindricalToCartesian(v)` converts a 3x1 vector $v=\begin{bmatrix}\rho \\\theta\\ z\end{bmatrix}$ containing cylindrical coordinates to a 3x1 vector containing Cartesian coordinates

$$
x = \rho\cos(\theta)
$$

$$
y = \rho\sin(\theta)
$$

$$
z=z
$$

```
>> CylindricalToCartesian([1; 1.5708; 0])

ans =

   -0.0000
    1.0000
         0
```
# SphericalToCartesian
`SphericalToCartesian(v)` converts a 3x1 vector $v=\begin{bmatrix} r \\\theta\\ \phi\end{bmatrix}$ containing spherical coordinates to a 3x1 vector containing Cartesian coordinates
$$
x = r\sin(\theta)\cos(\phi)
$$

$$
y = r\sin(\theta)\sin(\phi)
$$

$$
z = r\cos(\theta)
$$

```
>> SphericalToCartesian([1.7321; 0.9553; 0.7854])

ans =

    1.0000
    1.0000
    1.0001

```

# QuatMult
`Quatmult(q1, q2)` multiplies 2 4x1 vectors that represent quaternions $q=\begin{bmatrix} w \\ x\\ y \\ z\end{bmatrix}$

$$
q_1\otimes q_2 =
\begin{bmatrix}
w_1 & -x_1 & -y_1 & -z_1\\
x_1 & w_1 & -z_1 & y_1\\
y_1 & z_1 & w_1 & -x_1\\
z_1 & -y_1 & x_1 & w_1
\end{bmatrix}
\begin{bmatrix}
w_2\\
x_2\\
y_2\\
z_2
\end{bmatrix}
$$

```
>> QuatMult([0.9239; -0.3827; 0; 0], [0.8660; 0 ; 0.5; 0])

ans =

    0.8001
   -0.3314
    0.4620
   -0.1913
```

# QuatToRot
`QuatToRot(q)` converts a 4x1 vector representing a quaternion $q=\begin{bmatrix} w \\ x\\ y \\ z\end{bmatrix}$ to a 3x3 rotation matrix

$$
R =
\begin{bmatrix}
1-2(y^2+z^2) & 2(xy-wz) & 2(xz+wy)\\
2(xy+wz) & 1-2(x^2+z^2) & 2(yz-wx)\\
2(xz-wy) & 2(yz+wx) & 1-2(x^2+y^2)
\end{bmatrix}
$$

```
>> QuatToRot([0.7071; 0 ; 0.7071; 0])

ans =

         0         0    1.0000
         0    1.0000         0
   -1.0000         0         0

```

# RotToQuat
`RotToQuat(C)` converts a 3x3 matrix into a 4x1 vector representing a quaternion $q=\begin{bmatrix} w \\ x\\ y \\ z\end{bmatrix}$
$$
w =
\frac{1}{2}
\sqrt{
C_{11}+C_{22}+C_{33}+1
}
$$

$$
x =
\frac{1}{2}
\operatorname{sign}(C_{32}-C_{23})
\sqrt{
C_{11}-C_{22}-C_{33}+1
}
$$

$$
y =
\frac{1}{2}
\operatorname{sign}(C_{13}-C_{31})
\sqrt{
-C_{11}+C_{22}-C_{33}+1
}
$$

$$
z =
\frac{1}{2}
\operatorname{sign}(C_{21}-C_{12})
\sqrt{
-C_{11}-C_{22}+C_{33}+1
}
$$

```
>> RotToQuat(RotY(pi / 2))

ans =

    0.7071
         0
    0.7071
         0
```

# AngleAxisToRot
`AngleAxisToRot(n)` converts a 4x1 vector $\begin{bmatrix}\theta \\ x \\ y \\ z\end{bmatrix}$ into a 3x3 rotation matrix,

```
>> AngleAxisToRot([1.0472; 0 ; 1; 0])

ans =

    0.5000         0    0.8660
         0    1.0000         0
   -0.8660         0    0.5000

```


# RotToAngleAxis
`RotToAngleAxis(n)` converts a 3x3 rotation matrix into a 4x1 vector $\begin{bmatrix}\theta \\ x \\ y \\ z\end{bmatrix}$.

Will return $\begin{bmatrix}0 \\ 0 \\ 0 \\ 0\end{bmatrix}$ in the case of 0 rotation

```
>> RotToAngleAxis(RotY(pi / 3))

ans =

    1.0472
         0
    1.0000
         0
```


# RotToZYX

`RotToZYX(C)` converts a 3x3 rotation matrix into a 3x1 vector containg $ZYX$ Euler angles $\begin{bmatrix} z \\ y \\ x\end{bmatrix}$.

```
>> RotToZYX(RotZ(pi / 3) * RotY(pi / 6) * RotX(- pi/ 4))

ans =

    1.0472
    0.5236
   -0.7854
```

# RotToZYZ

`RotToZYZ(C)` converts a 3x3 rotation matrix into a 3x1 vector containg $ZYZ$ Euler angles $\begin{bmatrix} z_1 \\ y \\ z_2\end{bmatrix}$.

```
>> RotToZYZ(RotZ(pi / 4) * RotY(pi / 5) * RotZ(- pi / 2))

ans =

    0.7854
    0.6283
   -1.5708

```
# joitToRotJac
Converts an array of homogenous matrices and revolute axes into a rotational jacobian
```
>> H = Homogenous(eye(3), [5, 0, 0])

H =

     1     0     0     5
     0     1     0     0
     0     0     1     0
     0     0     0     1

>> H(:, :, 2) = Homogenous(RotX(pi/2), [0, 0, 0])

H(:,:,1) =

     1     0     0     5
     0     1     0     0
     0     0     1     0
     0     0     0     1


H(:,:,2) =

    1.0000         0         0         0
         0    0.0000   -1.0000         0
         0    1.0000    0.0000         0
         0         0         0    1.0000

>> revolute_axes = [
0, 1;
0, 0;
0, 0;
]

revolute_axes =

     0     1
     0     0
     0     0

>> jointToRotJac(H, revolute_axes)

ans =

     0     1
     0     0
     0     0
```
# jointToPosJac
Converts an array of homogenous matrices, prismatic axes, and rotational jacobian into a position jacobian

```
>> prismatic_axes = [
1, 0;
0, 0;
0, 0;
]

prismatic_axes =

     1     0
     0     0
     0     0

>> jointToPosJac(H, prismatic_axes, jointToRotJac(H, revolute_axes))

ans =

     1     0
     0     0
     0     0

>> 
```

