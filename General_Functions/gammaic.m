%
% [Gincz]=gammaic(x,z)
%
% Complex Incomplete Gamma function is valid in the entire complex plane.
% For real arguments, the result is the same results as Matlab function
% (within numerical error)
%
%Algorithm: 
%Slight modification of MATLAB's GAMMAINC (use gammalnz instead of gammaln)
%Numerical Recipes in C : The art of Scientific computing 
% §6.1 "Gamma function", equation (6.1.5) gammln
%
% Argument in : 
%	x : real variable (scalar or any size)
%	z : complex value (scalar or same size)
%
% Argument out :
%	Gincz : complex value (same size)
%
% Global variable :
%	none
%
%   Copyright © CRONE - Dancla	11/05/2000
% Last revision : 07/02/2001
%
% [Gincz]=gammaic(x,z)
%