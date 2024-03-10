## Dolittle's Method for Solving Systems of Linear Equations

### Introduction

Dolittle's method is a numerical technique used to solve systems of linear equations. It belongs to the class of direct methods, meaning that it directly computes the solution without iterative refinement. Named after John Todd Dolittle, this method is particularly efficient for solving large, sparse systems of equations.

### Theory

Consider a system of linear equations represented in matrix form as:

```
A = L * U
```

Where:
- `A` is the coefficient matrix,
- `L` is the lower triangular matrix,
- `U` is the upper triangular matrix.

The goal is to find the values of `X` that satisfy the equations.

#### Algorithm Steps:

1. **Decomposition**: Dolittle's method performs LU decomposition (also known as LU factorization) of the coefficient matrix `A` into two matrices: a lower triangular matrix `L` and an upper triangular matrix `U`.

2. **Forward Substitution**: Solve the lower triangular system `L * Y = B` for `Y` using forward substitution.

3. **Backward Substitution**: Solve the upper triangular system `U * X = Y` for `X` using backward substitution.

#### LU Decomposition:

LU decomposition is performed using Gaussian elimination with partial pivoting to ensure numerical stability. This process involves transforming the coefficient matrix `A` into an upper triangular form `U` while keeping track of the multipliers used to eliminate the variables.

#### Forward Substitution:

Forward substitution is used to solve the lower triangular system `L * Y = B` for `Y`. Starting with `Y_1 = B_1 / L_{11}`, the values of `Y` are computed sequentially using the formula:

```
Y_i = (B_i - Σ_{j=1}^{i-1} L_{ij} * Y_j) / L_{ii}
```

#### Backward Substitution:

Backward substitution is used to solve the upper triangular system `U * X = Y` for `X`. Starting with `X_n = Y_n / U_{nn}`, the values of `X` are computed sequentially using the formula:

```
X_i = (Y_i - Σ_{j=i+1}^{n} U_{ij} * X_j) / U_{ii}
```

### Conclusion

Dolittle's method provides a systematic approach to solving systems of linear equations by decomposing the coefficient matrix into triangular form and then solving the resulting triangular systems using forward and backward substitution. It offers a stable and efficient solution method, particularly for large systems of equations encountered in various scientific and engineering applications.
