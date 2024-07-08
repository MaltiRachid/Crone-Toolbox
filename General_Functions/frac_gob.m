%   [F] = frac_gob(lambda, mu)
%   produces the generating functions for the fractional GOB functions, the
%   call to this function should be followed by a call to the GOB function
%   used to orthogonalise the generating functions.
%
%   input arguments :
%   lambda : all the prescribed s^nu-poles (in fact poles are at -lambda),
%       each complex pole MUST be followed by its conjugate
%   Care must be taken because the first function is of multiplicity 
%           m0 = floor(1/(2*m_0)) + 1
%
%   output arguments :
%   F : fractional GOB Generating Functions ; dim(F) = N x 1
%       length(F) = length(lambda)
%       to orthogonalize the vector of generating functions, one can call :
%   [G, M] = gob(F);
%
%   Cf. Ph.D. Thesis of M. Aoun
%
%   Copyright © CRONE - Malti	11/04/2007
%   Last revision :
%