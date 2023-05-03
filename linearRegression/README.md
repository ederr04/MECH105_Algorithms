# Linear Regression
linearRegression Computes the linear regression of a data set

---
### Inputs:
x - x-values for data set  
y - y-values for data set

---
### Outputs:
fX - x-values with outliers removed  
fY - y-values with outliers removed  
slope - slope from the linear regression y=mx+b
intercept - intercept from the linear regression y=mx+b
Rsquared - coefficient of determination (R^2)

---
### Example:
Create a vector of x-values and a vector of y-values.
> x = [1 2 3 4 5 6];  
> y = [1 2 1.3 3.75 2.5 100];

Call the function in MATLAB and use the vectors. You can assign the outputs of the function to variables.
> [fX, fY, slope, intercept, Rsquared] = linearRegression(x,y)

In this case, the command window displays the following:
> fX = 1 3 2 5 4  
> fY = 1 1.3 2 2.5 3.75  
> slope = 0.475  
> intercept = 0.685  
> Rsquared = 0.4758
