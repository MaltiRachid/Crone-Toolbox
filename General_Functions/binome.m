%
%
% factor=binome(n,leng,coef)
%
% Yhis function computes the generalized coefficients of a polynomial :
%
%               k  (n)
% factor=(coef)^   ( ) (with k from 0 to leng-1)
%                  (k)
%
% By default, the value of coef is (-1).
%
% Argument in : 
%	n : order (complex vector)
%	leng : length of the output vector (integer scalar)
%	coef : coefficient 
%
% Argument out :
%	factor : Newton binomus (complex matrix)
%	Erreur : (string)
%
% Global variable
%	none
%
%   Copyright © CRONE - Dancla	04/1999
% Last revision : 23/03/2001
%
% [factor,Erreur]=binome(n,leng,coef)
%