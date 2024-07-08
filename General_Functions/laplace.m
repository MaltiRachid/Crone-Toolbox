%
% [Fp,Erreur]=laplace(fonction,a,b,n,p)
%
% This computes the numerical Laplace transform
% of the function 'function' [Levron98]
%
% Argument in : 
%	fonction	: litteral function (string)
%	a 	: (scalaire)
%	b 	: (scalaire)
%	n 	: number of bases of the Aitken system (scalar)
%	p	: vector frequency of the vector x (vector)
%
% Argument out :
%	Fp 	: Laplace transform (complex vector)
%	Erreur 	: (string)
%
% Global variable
%	none
%
%   Copyright © CRONE - Dancla	12/1998
% Last revision : 07/02/2001
%
% [Fp,Erreur]=laplace(function,a,b,n,p)
%%   Other functions named laplace
%%      sym/laplace
%