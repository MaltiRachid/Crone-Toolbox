%   [G, F, M] = frac_kautz(lambda, mu, N, c, whichone)
%
%   Input arguments :
%   lambda (Scalar) : Kautz pole (the real pole is at (-lambda)) ; its
%   conjugate is automatically considered
%   mu : Commensurate order
%   N : Number of functions required. Care must be taken because the first
%   function is of multiplicity m0 = floor(1/(2*m_0)) + 1
%   c : (optional) coefficients factor 1 x 2 ; default is set to 1/2 * [1  i]
%   whichone : string either 'frac_tf' or 'frac_zpk' (default)
%
%   output arguments :
%   F : fractional Kautz Generating Functions ; dim(F) = N x 1
%   to orthogonalize the vector of generating functions, one can call :
%   [G, M] = gob(F);
%
%   Cf. Ph.D. Thesis of M. Aoun
%
%   Copyright © CRONE - Malti	12/03/2007
%   Last revision :
%