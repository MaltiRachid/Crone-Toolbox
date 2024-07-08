%-- help for frac_poly_exp/commensurate ---
%%COMMENSURATE - CRONE toolbox
%
% [step_order,new_order, coefficients]=COMMENSURATE(fpe) computes the commun factor of the differentiation order vector and
% returns the integer vector step_order associated with the coefficients.
%
% By convention, if fpe is a constant, then the differentiation order is 
% is 0, and the commensurate order = 1.
%
%   Input arguments:
%	- fpe : frac_poly_exp object
%
%   Output arguments:
%	- step_order : commensurate order of fpe (scalar)
%	- new_order : integer differentiation order vector 
%   - coefficients : coefficient vector associated with step_order
%
% Copyright (c) CRONE
% Last revision : 30/04/2014
%%   Other functions named commensurate
%%      frac_tf/commensurate
%