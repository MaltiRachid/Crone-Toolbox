%
% [Ft,Error]=invlaplace(fonction,a,b,n,t)
%
% This function computes the numerical inverse Laplace transformation
% of the function 'fonction' [Levron98] used the Aitken method.
%
% Argument in : 
%	fonction	: litteral function (string)
%	a 	: (scalaire)
%	b 	: (scalaire)
%	n 	: number of bases of the Aitken system (scalar)
%	t	: vector time of the vector x (vector)
%
% Argument out :
%	Ft 	: Laplace inverse transform (complex vector)
%	Erreur 	: (string)
%
% Global variable
%	none
%
%   Copyright © CRONE - Dancla	12/1998
% Last revision : 07/02/2001
%
% [Ft,Erreur]=invlaplace(fonction,a,b,n,t)
%