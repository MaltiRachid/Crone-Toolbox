%FRAC_POLY_IMP - CRONE toolbox
%
% fpi=FRAC_POLY_IMP(fpe,imp_order) creates an implicit fractional polynomial
% object with the frac_poly_exp object 'fpe' at the power of the implicit
% order 'imp_order'.
% It is the constructor of the class frac_poly_imp.
%
%   Input arguments:
%   - fpe: frac_poly_exp object (size(1*M) or cell array (size(1*M))
%   - imp_order: implicit order of the implicit fractional polynomial object (row vector  or cell array of row vector)
%
%   Output arguments:
%   - fpi : frac_poly_imp object
%
%                 imp_order(i)
%  sys =  (fpe(i))
%
%
% Copyright (c) CRONE
% Last revision : 09/09/2021
%%   Documentation for frac_poly_imp
%      doc frac_poly_imp
%%