function [fX, fY, slope, intercept, Rsquared] = linearRegression(x,y)
%linearRegression Computes the linear regression of a data set
%   Compute the linear regression based on inputs:
%     1. x: x-values for our data set
%     2. y: y-values for our data set
%
%   Outputs:
%     1. fX: x-values with outliers removed
%     2. fY: y-values with outliers removed
%     3. slope: slope from the linear regression y=mx+b
%     4. intercept: intercept from the linear regression y=mx+b
%     5. Rsquared: R^2, a.k.a. coefficient of determination

% ERRORS
if nargin < 2
    error('2 arguments are needed')
elseif length(x) ~= length(y)
    error('x and y are not the same length')
end

% Sorting data
[sortedY, sortOrder] = sort(y);
sortedX = x(sortOrder);

% Computing Interquartile Range (IQR)
n = length(sortedY);
Q1Index = floor((n + 1)/4);
Q3Index = floor((3*n + 3)/4);
Q1 = sortedY(Q1Index);
Q3 = sortedY(Q3Index);
IQR = Q3 - Q1;

% Removing Outliers
lowerBound = Q1 - 1.5*IQR;
upperBound = Q3 + 1.5*IQR;
lowerOutlier = sortedY < lowerBound; % Creates a vector of length(sortedY) of values where true (1) or false (0)
upperOutlier = sortedY > upperBound;
Outliers = lowerOutlier + upperOutlier; % Creates one singular outlier vector
fY = sortedY(~Outliers); % Removes values where Outliers is true (1)
fX = sortedX(~Outliers);

% Linear Regression
n = length(fY);
sxy = sum(fX.*fY);
sx = sum(fX);
sy = sum(fY);
sx2 = sum(fX.^2);

slope= ((n*sxy-sx*sy)/(n*sx2-sx^2));
intercept = mean(fY)-slope*mean(fX);

SStot = sum((fY-mean(fY)).^2);
SSres = sum((fY-intercept-slope*fX).^2);

Rsquared = (SStot - SSres)/SStot;

end