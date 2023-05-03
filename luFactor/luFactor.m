function [L, U, P] = luFactor(A)
% luFactor(A)
%	LU decomposition with pivotiing
% inputs:
%	A = coefficient matrix
% outputs:
%	L = lower triangular matrix
%	U = upper triangular matrix
%   P = the permutation matrix

original_A = A; % Save original matrix for final check
[n, m] = size(A);
if n ~= m % Check dimensions of matrix
    error('Matrix is not square')
end
P = eye(n); % Create permutation matrix
for col = 1:n
    row = col;
    pivot = abs(A(row,col)); % Set initial pivot to a11, a22, a33, etc. depending on iteration
    for i = col:n % Starting at column of interest, run until last column
        if pivot < abs(A(i,col)) % If the initial pivot doesn't have largest magnitude
            pivot = abs(A(i,col));
            row = i; % Position of the highest magnitude
        end
    end
    if row ~= col % If pivot isn't in correct position (a11, a22, a33, etc.), swap rows
        A([col row], :) = A([row col], :);
        P([col row], :) = P([row col], :);
    end
end
U = zeros(n);
L = eye(n);
for i = 1:n % Fill out upper and lower matricies
    U(i,i) = A(i,i);
    U(i,i+1:n) = A(i,i+1:n);
    L(i+1:n,i) = A(i+1:n,i)/A(i,i);
    A(i+1:n,i+1:n) = A(i+1:n,i+1:n) - L(i+1:n,i)*U(i,i+1:n);
end
end