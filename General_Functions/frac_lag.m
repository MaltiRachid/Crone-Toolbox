%   [F] = frac_lab(lambda, mu, N)
%
%   input arguments :
%   lambda : Laguerre pole (the real pole is at (-lambda)
%   mu : Commensurate order
%   N : Number of functions required. Care must be taken because the first
%   function is of multiplicity m0 = floor(1/(2*m_0)) + 1
%   whichone : string either 'frac_tf' or 'frac_zpk' (default)
%
%   output arguments :
%   F : fractional Laguerre Generating Functions ; dim(F) = N x 1
%   to orthogonalize the vector of generating functions, one can call :
%   [G, M] = gob(F);
%
%   Cf. Ph.D. Thesis of M. Aoun
%
%   Copyright � CRONE - Malti	12/03/2007
%   Last revision :
%