%-- help for frac_lti/frac2int ---
%%
%FRAC2INT - CRONE toolbox
%
% sys = frac2int(fr) computes an approximation of the fractional transfer 
% function fr using Oustaloups' pole and zero approximation method
% on the frequency band = [Wb,Wh] and using N cells.
%
% function sys = frac2int(fr)
%
% Input arguments:
%	- fr : the transfer function to approximate
%   - N : must be indicated in fr
%   - band : must be present in fr
%   - sim  : must be present in fr
%
% Output arguments :
%	- sys : LTI-zpk system
%
% Copyright (c) CRONE - Malti	09/06/2008
% Last revision : 24/01/2014
% global toto;
%%   Other functions named frac2int
%%      frac_ss/frac2int
%