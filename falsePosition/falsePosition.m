function [root, fx, ea, iter] = falsePosition(func, xl, xu, es, maxit, varargin)
%falsePosition finds the root of a function using false position method
%   INPUTS:
%   func - the function being evaluated
%   xl - the lower guess
%   xu - the upper guess
%   es - the desired relative error (defaults to 0.0001%)
%   maxit - the maximum number of iterations to use (defaults to 200)
%   varargin,... - any additional parameters used by the function
%   OUTPUTS:
%   root - the estimated root location
%   fx - the function evaluated at the root location
%   ea - the approximate relative error (%)
%   iter - how many iterations were performed

% Test for number of inputs
if nargin < 3
    error('At least 3 inputs are needed')
elseif nargin < 4
    es = 0.0001;
    maxit = 200;
elseif nargin < 5
    maxit = 200;
end

% Test to see if a root is within function
sign = func(xl,varargin{:})*func(xu,varargin{:});
if sign > 0
    error('No root found. Select different bounds')
end

% Variables
iter = 0;
xr = 0;
ea = 100;

% False Position Method
while(ea > es && iter < maxit)
    iter = iter + 1;
    old_xr = xr;
    xr = xu - (func(xu)*(xl - xu))/(func(xl)-(func(xu)));
    if xr ~= 0
        ea = abs((xr - old_xr)/xr) * 100;
    end
    sign = func(xl,varargin{:})*func(xr,varargin{:});
    if sign > 0
        xl = xr;
    elseif sign < 0
        xu = xr;
    else
        ea = 0;
    end
end
fx = func(xr,varargin{:});
format long
fprintf('root = %f\n',xr)
fprintf('f(root) = %f\n',fx)
fprintf('approximate error = %f\n',ea)
fprintf('This took %d iterations\n\n', iter)
end