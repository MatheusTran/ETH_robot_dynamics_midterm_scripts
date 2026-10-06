
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
# SphericalToCartesian
# QuatMult
# QuatToRot
# RotToQuat
# AngleAxisToRot
# RotToAngleAxis
