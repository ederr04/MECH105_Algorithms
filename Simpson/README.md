# Simpson
Numerical evaluation of an integral using Simpson's 1/3 Rule
For this function to work, both vectors must be the same length.

---
### Inputs:
x - the vector of equally spaced independent variable  
y - the vector of function values with respect to x

---
### Outputs:
I - the numerical itergral calculated

---
### Example:
Create a vector of equally spaced independent variable values and a seperate vector of function falues with respect to x. Keep in mind that both vectors must be the same length.
> x = [0 5 10 15 20 25 30];  
> y = [0 9 13 14 10.5 12 5];

Then call the function in MATLAB:
> Simpson(x,y)

In this case, $320$ is the numerical solution to the integral.
