# LU Factorization with partial pivoting
This function determines the LU Factorization of a square matrix using partial pivoting.

---
### Inputs:
A - coefficient matrix

---
### Outputs:
L - lower triangular matrix  
U - upper triangular matrix  
P - permutation matrix

---
### Example:
Create a matrix with the coefficients of the system of equations.
> A = [10 2 -1; -3 -6 2; 1 1 5];

Use the matrix in the luFactor function. You can assign variables to the outputs of the function.
> [L, U, P] = luFactor(A)

In this case, the command window will display the values of L, U, and P.
