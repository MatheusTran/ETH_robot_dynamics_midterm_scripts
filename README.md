
# Running
run the command 
```matlab
load_scripts 
```
in the matlab terminal to load the scripts. Note: load_scripts.m and the scripts folder have to be in the current directory for it to work. If it fails, either:
- copy and paste the folder and the load_scripts file into your currnet folder

Or

- go to this directory, and then run load_scripts

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
```
>> CartesianToCylindrical([0 ; 1 ; 0])

ans =

    1.0000
    1.5708
         0
```


# CartesianToSpherical

`CartesianToSpherical(v)` converts a 3x1 vector `v=[x ; y ; z]` containing cartesian coordinates into a vector containing Spherical coordinates $\begin{bmatrix}r \\ \theta \\ \phi\end{bmatrix}$
```
>> CartesianToSpherical([1 ; 1 ; 1])

ans =

    1.7321
    0.9553
    0.7854
```

# CylindricalToCartesian
`CylindricalToCartesian(v)` converts a 3x1 vector $v=\begin{bmatrix}\rho \\\theta\\ z\end{bmatrix}$ containing cylindrical coordinates to a 3x1 vector containing Cartesian coordinates

```
>> CylindricalToCartesian([1; 1.5708; 0])

ans =

   -0.0000
    1.0000
         0
```
# SphericalToCartesian
`SphericalToCartesian(v)` converts a 3x1 vector $v=\begin{bmatrix} r \\\theta\\ \phi\end{bmatrix}$ containing spherical coordinates to a 3x1 vector containing Cartesian coordinates

```
>> SphericalToCartesian([1.7321; 0.9553; 0.7854])

ans =

    1.0000
    1.0000
    1.0001

```

# QuatMult
`Quatmult(q1, q2)` multiplies 2 4x1 vectors that represent quaternions $q=\begin{bmatrix} w \\ x\\ y \\ z\end{bmatrix}$

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

```
>> QuatToRot([0.7071; 0 ; 0.7071; 0])

ans =

         0         0    1.0000
         0    1.0000         0
   -1.0000         0         0

```

# RotToQuat
`RotToQuat(C)` converts a 3x3 matrix into a 4x1 vector representing a quaternion $q=\begin{bmatrix} w \\ x\\ y \\ z\end{bmatrix}$

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


