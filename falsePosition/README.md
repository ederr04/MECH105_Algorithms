# False Position
Estimates the root of a function using the closed method, false position. All that is needed are two initial guesses of where the root is, and function. This method is usually faster than the bisection method.

---
### Inputs:
func - the function being evaluated  
xl - the lower guess  
xu - the upper guess  
es - the desired relative error (defaults to 0.0001%)  
maxit - the maximum number of iterations to use (defaults to 200)  
varargin,... - any additional parameters used by the function

---
### Outputs:
root - the estimated root location  
fx - the function evaluated at the root location  
ea - the approximate relative error (%)  
iter - how many iterations were performed  

---
### Example:
In order to find the root of the function $x^4-x^3-x^2-x-1$ you must define the function within MATLAB
> f = @(x) x.^4 - x.^3 - x.^2 - x - 1;

Then you use the falsePosition function and give two initial guesses to where the root is, and any adition parameters you want. If needed, you can assign variables to the outputs of the function.
> [root, fx, ea, iter] = falsePosition(f,1,2)

In this case, the command window will display the follwing:
> root = 1.927562  
> fx = -0.000001  
> ea = 0.000041  
> iter = 7
