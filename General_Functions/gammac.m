%
% [Gz]=gammac(z)
%
% Complex Gamma function is valid in the entire complex plane.
%This routine uses the reflection formula to provide valid results
%for all z.
%
%Algorithm:
%Numerical Recipes in C : The art of Scientific computing
% §6.1 "Gamma function", equation (6.1.5) gammln
%
% Argument in :
%	z : complex value (any size)
%
% Argument out :
%	Gz : complex value (same size)
%
% Global variable :
%	none
%
%   Copyright © CRONE - Dancla	28/03/2000
% Last revision : 07/02/2001
%
% [Gz]=gammac(z)
%