function [I] = Simpson(x, y)
% Numerical evaluation of integral by Simpson's 1/3 Rule
% Inputs
%   x = the vector of equally spaced independent variable
%   y = the vector of function values with respect to x
% Outputs:
%   I = the numerical integral calculated

% Check to see x and y are same length and see difference between elements
% is equal
check_x = diff(x);
if length(x) ~= length(y)
    error('Inputs are not the same length')
end
if any(check_x ~= check_x(1))
    error('x input is not equally spaced')
end
% Find number of intervals
x_l = length(x);
int = x_l - 1;
% If there are an even number of intervals do 1/3 Simpson's Rule
if (-1)^int == 1
    I = (x(x_l)-x(1))*((y(1) + 4*sum(y(2:2:int)) + 2*sum(y(3:2:int-1)) + y(x_l))/(3*int));
% If there are an odd number of intervals do 1/3 Simpson's Rule + Trapezoidal Rule
elseif (-1)^int == -1 && int ~= 1
    warning('Trapezoidal rule will be used for last interval')
    % Leave out last interval so it can be calculated using trap rule
    int = int - 1;
    I = (x(x_l-1)-x(1))*((y(1) + 4*sum(y(2:2:int)) + 2*sum(y(3:2:int)) + y(x_l-1))/(3*int)); % 1/3 Simp
    I_lint = (x(x_l)-x(x_l-1))*((y(x_l)+y(x_l-1))/2); % Trap
    % Add all intervals
    I = I + I_lint;
% If there are only two intervals do Trapezoidal Rule
elseif int == 1
    warning('Trapezoidal rule will be used')
    I = (x(2)-x(1))*((y(2)+y(1))/2);
end